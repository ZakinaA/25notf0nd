<?php

namespace App\Controller;

use App\Entity\ContratPret;
use App\Form\ContratPretType;
use App\Repository\ContratPretRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/contrat_pret')]
final class ContratPretController extends AbstractController
{
    #[Route(name: 'app_contrat_pret_index', methods: ['GET'])]
    public function index(ContratPretRepository $contratPretRepository): Response
    {
        return $this->render('contrat_pret/index.html.twig', [
            'contrat_prets' => $contratPretRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_contrat_pret_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $contratPret = new ContratPret();
        $form = $this->createForm(ContratPretType::class, $contratPret);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($contratPret);
            $entityManager->flush();

            return $this->redirectToRoute('app_contrat_pret_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contrat_pret/new.html.twig', [
            'contrat_pret' => $contratPret,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_contrat_pret_show', methods: ['GET'])]
    public function show(ContratPret $contratPret): Response
    {
        return $this->render('contrat_pret/show.html.twig', [
            'contrat_pret' => $contratPret,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_contrat_pret_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, ContratPret $contratPret, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ContratPretType::class, $contratPret);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_contrat_pret_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contrat_pret/edit.html.twig', [
            'contrat_pret' => $contratPret,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_contrat_pret_delete', methods: ['POST'])]
    public function delete(Request $request, ContratPret $contratPret, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$contratPret->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($contratPret);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_contrat_pret_index', [], Response::HTTP_SEE_OTHER);
    }
}
