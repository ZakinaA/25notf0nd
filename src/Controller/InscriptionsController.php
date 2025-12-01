<?php

namespace App\Controller;

use App\Entity\Inscriptions;
use App\Form\InscriptionsType;
use App\Repository\InscriptionsRepository;
use App\Repository\CoursRepository;
use App\Repository\ElevesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/inscriptions')]
final class InscriptionsController extends AbstractController
{
    #[Route(name: 'app_inscriptions_index', methods: ['GET'])]
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
            $entityManager->persist($inscription);
            $entityManager->flush();

            return $this->redirectToRoute('app_inscriptions_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('inscriptions/new.html.twig', [
            'inscription' => $inscription,
            'form' => $form,
        ]);
    }

    #[Route('/cours/{coursId}', name: 'app_inscription_new_cours', methods: ['GET', 'POST'])]
    public function inscriptionCours(
        int $coursId,
        CoursRepository $coursRepo,
        EntityManagerInterface $entityManager,
        Request $request
    ): Response {
        // Vérifier que le cours existe
        $cours = $coursRepo->find($coursId);
        if (!$cours) {
            throw $this->createNotFoundException('Cours non trouvé');
        }

        // Récupérer l'utilisateur connecté et ses élèves
        $user = $this->getUser();
        
        // Vérifier si l'utilisateur a un responsable associé
        if (!$user || !method_exists($user, 'getResponsable') || !$user->getResponsable()) {
            $this->addFlash('error', 'Vous devez être connecté en tant qu\'adhérent pour vous inscrire');
            return $this->redirectToRoute('app_cours_index');
        }
        
        $responsable = $user->getResponsable();
        $eleves = $responsable->getEleves();

        if ($eleves->isEmpty()) {
            $this->addFlash('error', 'Aucun élève trouvé pour cet adhérent');
            return $this->redirectToRoute('app_cours_index');
        }

        $inscription = new Inscriptions();
        $inscription->setCours($cours);

        $form = $this->createForm(InscriptionsType::class, $inscription, [
            'eleves' => $eleves
        ]);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Vérification optionnelle de l'âge
            $eleve = $inscription->getEleves();
            $age = $eleve->getDateNaiss()->diff(new \DateTime())->y;
            
            if ($age < $cours->getAgeMini() || $age > $cours->getAgeMaxi()) {
                $this->addFlash('error', 'L\'élève n\'a pas l\'âge requis pour ce cours (entre ' . $cours->getAgeMini() . ' et ' . $cours->getAgeMaxi() . ' ans)');
                return $this->redirectToRoute('app_cours_index');
            }

            $entityManager->persist($inscription);
            $entityManager->flush();

            $this->addFlash('success', 'Inscription réussie !');
            return $this->redirectToRoute('app_cours_index');
        }

        return $this->render('inscriptions/new.html.twig', [
            'inscription' => $inscription,
            'form' => $form,
            'cours' => $cours,
        ]);
    }

    #[Route('/{id}', name: 'app_inscriptions_show', methods: ['GET'])]
    public function show(Inscriptions $inscription): Response
    {
        return $this->render('inscriptions/show.html.twig', [
            'inscription' => $inscription,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_inscriptions_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Inscriptions $inscription, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(InscriptionsType::class, $inscription);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_inscriptions_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('inscriptions/edit.html.twig', [
            'inscription' => $inscription,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_inscriptions_delete', methods: ['POST'])]
    public function delete(Request $request, Inscriptions $inscription, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$inscription->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($inscription);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_inscriptions_index', [], Response::HTTP_SEE_OTHER);
    }
}