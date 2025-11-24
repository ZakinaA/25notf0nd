<?php

namespace App\Controller;

use App\Entity\User; // L'entité représentant ton utilisateur
use App\Form\RegistrationFormType; // La classe qui définit la structure de ton formulaire
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

final class RegisterController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function index(
        Request $request,
        UserPasswordHasherInterface $userPasswordHasher, // Pour hacher le mot de passe
        EntityManagerInterface $entityManager // Pour interagir avec la base de données
    ): Response {
        // 1. Création d'une nouvelle instance de l'entité User
        $user = new User();

        // 2. Création du formulaire en utilisant la classe RegistrationFormType
        $form = $this->createForm(RegistrationFormType::class, $user);
        
        // 3. Traitement de la requête : lie les données POST/formulaire à l'objet $form
        $form->handleRequest($request);

        // 4. Vérification de la soumission et de la validité (grâce aux contraintes dans RegistrationFormType)
        if ($form->isSubmitted() && $form->isValid()) {
            
            // --- HACHAGE SÉCURISÉ DU MOT DE PASSE (CRITIQUE !) ---
            // Le mot de passe en clair est récupéré du champ 'plainPassword' du formulaire.
            $hashedPassword = $userPasswordHasher->hashPassword(
                $user,
                $form->get('plainPassword')->getData()
            );
            $user->setPassword($hashedPassword);
            $user->setRoles(['ROLE_USER']); // Attribution d'un rôle par défaut

            // 5. Enregistrement de l'utilisateur en base de données
            $entityManager->persist($user);
            $entityManager->flush();

            // Ajout d'un message flash
            $this->addFlash('success', 'Votre compte a été créé avec succès ! Vous pouvez maintenant vous connecter.');

            // 6. Redirection vers la page de connexion (assurez-vous que 'app_signin' est votre route de connexion)
            return $this->redirectToRoute('app_login'); 
        }

        // 7. Affichage du formulaire dans la vue
        return $this->render('register/index.html.twig', [
            // On passe l'objet form créé à la vue Twig
            'registrationForm' => $form->createView(),
        ]);
    }
}