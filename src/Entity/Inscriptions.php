<?php

namespace App\Entity;

use App\Repository\InscriptionsRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InscriptionsRepository::class)]
class Inscriptions
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $nombre_paiments = null;

    #[ORM\ManyToOne(inversedBy: 'inscriptions')]
    private ?Eleves $eleves = null;

    #[ORM\ManyToOne(inversedBy: 'inscriptions')]
    private ?Cours $cours = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombrePaiments(): ?int
    {
        return $this->nombre_paiments;
    }

    public function setNombrePaiments(int $nombre_paiments): static
    {
        $this->nombre_paiments = $nombre_paiments;

        return $this;
    }

    public function getEleves(): ?Eleves
    {
        return $this->eleves;
    }

    public function setEleves(?Eleves $eleves): static
    {
        $this->eleves = $eleves;

        return $this;
    }

    public function getCours(): ?Cours
    {
        return $this->cours;
    }

    public function setCours(?Cours $cours): static
    {
        $this->cours = $cours;

        return $this;
    }
}
