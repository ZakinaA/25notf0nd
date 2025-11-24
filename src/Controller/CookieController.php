<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CookieController extends AbstractController
{
    #[Route('/politique-cookie', name: 'app_cookie')]
    public function index(): Response
    {
        return $this->render('cookie/index.html.twig', [
            'controller_name' => 'CookieController',
        ]);
    }
}
