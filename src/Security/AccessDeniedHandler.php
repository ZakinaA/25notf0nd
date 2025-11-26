<?php

// src/Security/AccessDeniedHandler.php
namespace App\Security;

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response; // ✅ ajouter Response
use Symfony\Component\Security\Http\Authorization\AccessDeniedHandlerInterface;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class AccessDeniedHandler implements AccessDeniedHandlerInterface
{
    private RouterInterface $router;

    public function __construct(RouterInterface $router)
    {
        $this->router = $router;
    }

    // ✅ Signature exacte avec : ?Response
    public function handle(Request $request, AccessDeniedException $accessDeniedException): ?Response
    {
        // Exemple : redirection vers page d'erreur
        return new RedirectResponse($this->router->generate('app_erreur'));
    }
}
