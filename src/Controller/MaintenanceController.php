<?php

namespace App\Controller;
use App\Repository\InterventionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class MaintenanceController extends AbstractController
{
    #[Route('/maintenance', name: 'app_maintenance')]
    public function index(InterventionRepository $InterventionRepository): Response
    {
        $interventions = $InterventionRepository->findAll();
        return $this->render('intervention/index.html.twig', [
            'controller_name' => 'InterventionController',
            'interventions' => $interventions,
        ]);
    }
    
}
