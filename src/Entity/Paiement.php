<?php

namespace App\Entity;

use App\Repository\PaiementRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PaiementRepository::class)]
class Paiement
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?float $montant = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTime $datePaiement = null;

    #[ORM\ManyToOne(inversedBy: 'paiement')]
    private ?Inscriptions $inscriptions = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMontant(): ?float
    {
        return $this->montant;
    }

    public function setMontant(float $montant): static
    {
        $this->montant = $montant;

        return $this;
    }

    public function getDatePaiement(): ?\DateTime
    {
        return $this->datePaiement;
    }

    public function setDatePaiement(\DateTime $datePaiement): static
    {
        $this->datePaiement = $datePaiement;

        return $this;
    }

    public function getInscriptions(): ?Inscriptions
    {
        return $this->inscriptions;
    }

    public function setInscriptions(?Inscriptions $inscriptions): static
    {
        $this->inscriptions = $inscriptions;

        return $this;
    }
}
