<?php
namespace App\Controller;

use App\Entity\Inscriptions;
use App\Form\InscriptionsType;
use App\Repository\InscriptionsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/inscriptions')]
final class InscriptionsController extends AbstractController
{
    #[Route('/', name: 'app_inscriptions_index', methods: ['GET'])]
    public function index(InscriptionsRepository $inscriptionsRepository): Response
    {
        return $this->render('inscriptions/index.html.twig', [
            'inscriptions' => $inscriptionsRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_inscriptions_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $inscription = new Inscriptions();
        $form = $this->createForm(InscriptionsType::class, $inscription);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Définir la date d'inscription si elle n'est pas définie
            if ($inscription->getDateInscription() === null) {
                $inscription->setDateInscription(new \DateTime());
            }
            
            $entityManager->persist($inscription);
            $entityManager->flush();

            $this->addFlash('success', 'Inscription créée avec succès !');

            return $this->redirectToRoute('app_inscriptions_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('inscriptions/new.html.twig', [
            'inscription' => $inscription,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_inscriptions_show', methods: ['GET'], requirements: ['id' => '\d+'])]
    public function show(Inscriptions $inscription): Response
    {
        return $this->render('inscriptions/show.html.twig', [
            'inscription' => $inscription,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_inscriptions_edit', methods: ['GET', 'POST'], requirements: ['id' => '\d+'])]
    public function edit(Request $request, Inscriptions $inscription, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(InscriptionsType::class, $inscription);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            $this->addFlash('success', 'Inscription modifiée avec succès !');

            return $this->redirectToRoute('app_inscriptions_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('inscriptions/edit.html.twig', [
            'inscription' => $inscription,
            'form' => $form,
        ]);
    }

    #[Route('/{id}/delete', name: 'app_inscriptions_delete', methods: ['POST'], requirements: ['id' => '\d+'])]
    public function delete(Request $request, Inscriptions $inscription, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$inscription->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($inscription);
            $entityManager->flush();

            $this->addFlash('success', 'Inscription supprimée avec succès !');
        }

        return $this->redirectToRoute('app_inscriptions_index', [], Response::HTTP_SEE_OTHER);
    }
}