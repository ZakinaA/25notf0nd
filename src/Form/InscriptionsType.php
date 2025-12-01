<?php

namespace App\Form;

use App\Entity\Cours;
use App\Entity\Eleves;
use App\Entity\Inscriptions;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InscriptionsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre_paiments')
            ->add('dateInscription')
            ->add('eleves', EntityType::class, [
                'class' => Eleves::class,
                'choice_label' => 'id',
            ])
            ->add('cours', EntityType::class, [
                'class' => Cours::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Inscriptions::class,
        ]);
    }
}
