<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class DroitController extends AbstractController
{
    #[Route('/droit-RGPD', name: 'app_droit')]
    public function index(): Response
    {
        return $this->render('droit/index.html.twig', [
            'controller_name' => 'DroitController',
        ]);
    }
}
