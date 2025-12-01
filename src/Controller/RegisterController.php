<?php
namespace App\Controller;

use App\Entity\User;
use App\Entity\Role; // Ajout de l'import de l'entité Role
use App\Form\RegisterFormType;
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
        UserPasswordHasherInterface $userPasswordHasher,
        EntityManagerInterface $entityManager
    ): Response {
        // 1. Création d'une nouvelle instance de l'entité User
        $user = new User();
        
        // 2. Création du formulaire en utilisant la classe RegisterFormType
        $form = $this->createForm(RegisterFormType::class, $user);
        
        // 3. Traitement de la requête : lie les données POST/formulaire à l'objet $form
        $form->handleRequest($request);
        
        // 4. Vérification de la soumission et de la validité
        if ($form->isSubmitted() && $form->isValid()) {
            
            // --- ATTRIBUTION DU RÔLE ID 2 ---
            $role = $entityManager->getRepository(Role::class)->find(2);
            
            if ($role) {
                $user->setRole($role);
            } else {
                // Gestion d'erreur si le rôle n'existe pas
                $this->addFlash('error', 'Erreur lors de l\'attribution du rôle.');
                return $this->redirectToRoute('app_register');
            }
            
            // --- HACHAGE SÉCURISÉ DU MOT DE PASSE ---
            $hashedPassword = $userPasswordHasher->hashPassword(
                $user,
                $form->get('plainPassword')->getData()
            );
            $user->setPassword($hashedPassword);
            
            // 5. Enregistrement de l'utilisateur en base de données
            $entityManager->persist($user);
            $entityManager->flush();
            
            // Ajout d'un message flash
            $this->addFlash('success', 'Votre compte a été créé avec succès ! Vous pouvez maintenant vous connecter.');
            
            // 6. Redirection vers la page de connexion
            return $this->redirectToRoute('app_login'); 
        }
        
        // 7. Affichage du formulaire dans la vue
        return $this->render('register/index.html.twig', [
            'RegisterForm' => $form->createView(),
        ]);
    }
}