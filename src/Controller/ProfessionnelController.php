<?php

namespace App\Controller;

use App\Entity\Professionnel;
use App\Form\ProfessionnelType;
use App\Repository\ProfessionnelRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/professionnel')]
final class ProfessionnelController extends AbstractController
{
    #[Route(name: 'app_professionnel_index', methods: ['GET'])]
    public function index(ProfessionnelRepository $professionnelRepository): Response
    {
        return $this->render('professionnel/index.html.twig', [
            'professionnels' => $professionnelRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_professionnel_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $professionnel = new Professionnel();
        $form = $this->createForm(ProfessionnelType::class, $professionnel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($professionnel);
            $entityManager->flush();

            return $this->redirectToRoute('app_professionnel_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('professionnel/new.html.twig', [
            'professionnel' => $professionnel,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_professionnel_show', methods: ['GET'])]
    public function show(Professionnel $professionnel): Response
    {
        return $this->render('professionnel/show.html.twig', [
            'professionnel' => $professionnel,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_professionnel_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Professionnel $professionnel, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ProfessionnelType::class, $professionnel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_professionnel_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('professionnel/edit.html.twig', [
            'professionnel' => $professionnel,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_professionnel_delete', methods: ['POST'])]
    public function delete(Request $request, Professionnel $professionnel, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$professionnel->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($professionnel);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_professionnel_index', [], Response::HTTP_SEE_OTHER);
    }
}
