<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class PolitiqueConfController extends AbstractController
{
    #[Route('/politique-confidentialite', name: 'app_politique_conf')]
    public function index(): Response
    {
        // Chemin absolu vers ton fichier Twig
        $filePath = $this->getParameter('kernel.project_dir') . '/templates/politique_conf/index.html.twig';

        $lastModified = null;

        if (file_exists($filePath)) {
            // Création d'une date à partir de la dernière modif du fichier
            $lastModified = new \DateTimeImmutable('@' . filemtime($filePath));
            // Conversion automatique en heure de Paris
            $lastModified = $lastModified->setTimezone(new \DateTimeZone('Europe/Paris'));
        }

        return $this->render('politique_conf/index.html.twig', [
            'controller_name' => 'PolitiqueConfController',
            'lastModified' => $lastModified,
        ]);
    }
}
