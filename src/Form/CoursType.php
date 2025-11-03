<?php

namespace App\Form;

use App\Entity\Cours;
use App\Entity\Professeur;
use App\Entity\TypeInstrument;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CoursType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('libelle')
            ->add('ageMini')
            ->add('ageMaxi')
            ->add('professeur', EntityType::class, [
                'class' => Professeur::class,
                'choice_label' => 'id',
            ])
            ->add('typeInstrument', EntityType::class, [
                'class' => TypeInstrument::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Cours::class,
        ]);
    }
}
