<?php

namespace App\Form;

use App\Entity\Eleves;
use App\Entity\Responsables;
use App\Entity\Tranche;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ElevesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('prenom')
            ->add('date_naiss')
            ->add('responsables', EntityType::class, [
                'class' => Responsables::class,
                'choice_label' => 'id',
            ])
            ->add('tranche', EntityType::class, [
                'class' => Tranche::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Eleves::class,
        ]);
    }
}
