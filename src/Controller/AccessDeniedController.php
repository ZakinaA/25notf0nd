<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class AccessDeniedController extends AbstractController
{
    #[Route('/access_denied', name: 'app_erreur')]
    public function index(): Response
    {
        return $this->render('access_denied/index.html.twig', [
            'controller_name' => 'AccessDeniedController',
        ]);
    }
}
