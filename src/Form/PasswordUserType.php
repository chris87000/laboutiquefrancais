<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class PasswordUserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('actualPassword', PasswordType::class, [
                'label' => 'Votre mot de passe actuel',
                'attr' => [
                    'placeholder' => 'Votre mot de passe actuel',
                ],
                'mapped' => false,
            ])
            ->add('plainPassword', RepeatedType::class, [
                'type' => PasswordType::class,
                'constraints' => [
                    new Length(['min'=>3, 'max' => 30])
                ],
                'first_options'  => [
                    'label' => 'Votre nouveau mot de passe',
                    'hash_property_path' => 'password',
                    'attr' => [
                        'placeholder' => 'Indiquez votre nouveau mot de passe',
                    ]
                ],
                'second_options' => [
                    'label' => 'Confirmez votre nouveau mot de passe',
                    'attr' => [
                        'placeholder' => 'Confirmez votre nouveau mot de passe',
                    ]
                ],
                'mapped' => false,
            ])
            ->add('submit', SubmitType::class,[
                'label' => 'Mettre à jour le mot de passe',
                'attr' => [
                    'class' => 'btn btn-success',
                ]
            ])
            ->addEventListener(FormEvents::SUBMIT, function (FormEvent $event) {
                //mdp actuel saisi
                $form = $event->getForm();
                $user = $form->getConfig()->getOptions()['user'];
                $actualPwd = $form->get('actualPassword')->getData();
                //mdp en bdd
                $actualPasswordDb = $user->getPassword();
                // si ko -> erreur
        })
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
