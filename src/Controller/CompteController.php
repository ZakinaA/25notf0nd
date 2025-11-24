<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CompteController extends AbstractController
{
    #[Route('/compte', name: 'app_compte')]
    public function index(): Response
    {
        // Tu peux récupérer l’utilisateur connecté si besoin
        $user = $this->getUser();

        return $this->render('compte/index.html.twig', [
            'user' => $user,
        ]);
    }
}
