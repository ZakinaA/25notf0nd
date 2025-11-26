<?php

// src/EventListener/AccessDeniedListener.php
namespace App\EventListener;

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\ExceptionEvent;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Routing\RouterInterface;

class AccessDeniedListener
{
    private Security $security;
    private RouterInterface $router;

    public function __construct(Security $security, RouterInterface $router)
    {
        $this->security = $security;
        $this->router = $router;
    }

    public function onKernelException(ExceptionEvent $event)
    {
        $exception = $event->getThrowable();

        if ($exception instanceof AccessDeniedException) {
            // Redirection selon le rôle
            if ($this->security->isGranted('ROLE_ADHERENT')) {
                $url = $this->router->generate('app_compte'); // route compte adhérent
            } else {
                $url = $this->router->generate('app_erreur'); // page générale
            }

            $event->setResponse(new RedirectResponse($url));
        }
    }
}
