<?php

namespace App\Form;

use App\Entity\Cours;
use App\Entity\Eleves;
use App\Entity\Inscriptions;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InscriptionsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre_paiments', IntegerType::class, [
                'label' => 'Nombre de paiements',
                'data' => 1,
                'attr' => [
                    'min' => 1,
                    'max' => 12
                ]
            ]);

        // Si des élèves sont passés en option (pour les adhérents)
        if (!empty($options['eleves'])) {
            $builder->add('eleves', EntityType::class, [
                'class' => Eleves::class,
                'choices' => $options['eleves'],
                'choice_label' => function(Eleves $eleve) {
                    return $eleve->getPrenom() . ' ' . $eleve->getNom();
                },
                'label' => 'Sélectionner un élève',
                'placeholder' => 'Choisir un élève'
            ]);
        } else {
            // Pour les admins : tous les élèves
            $builder->add('eleves', EntityType::class, [
                'class' => Eleves::class,
                'choice_label' => function(Eleves $eleve) {
                    return $eleve->getPrenom() . ' ' . $eleve->getNom();
                },
                'label' => 'Élève',
                'placeholder' => 'Choisir un élève'
            ]);
        }

        // Si un cours n'est pas déjà défini (pour les admins)
        if (empty($options['data']->getCours())) {
            $builder->add('cours', EntityType::class, [
                'class' => Cours::class,
                'choice_label' => function(Cours $cours) {
                    return $cours->getLibelle() . ' - ' . $cours->getProfesseur()->getNom();
                },
                'label' => 'Cours',
                'placeholder' => 'Choisir un cours'
            ]);
        }
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Inscriptions::class,
            'eleves' => []
        ]);
    }
}