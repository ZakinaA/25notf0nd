<?php

namespace App\Entity;

use App\Repository\InscriptionsRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use App\Entity\Inscriptions;


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

    #[ORM\OneToMany(targetEntity: Paiement::class, mappedBy: 'inscriptions')]
    private Collection $paiement;

    #[ORM\OneToMany(mappedBy: 'cours', targetEntity: Inscriptions::class, cascade: ['persist', 'remove'])]
    private Collection $inscriptions;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTime $dateInscription = null;


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

    public function __construct()
    {
    $this->inscriptions = new ArrayCollection();
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

    public function getPaiement(): Collection
    {
        return $this->paiement;
    }

     public function addPaiement(Paiement $paiement): static
    {
        if (!$this->paiement->contains($paiement)) {
            $this->paiement->add($paiement);
            $paiement->setInscription($this);
        }

        return $this;
    }

    public function removePaiement(Paiement $paiement): static
    {
        if ($this->paiement->removeElement($paiement)) {
            // set the owning side to null (unless already changed)
            if ($paiement->getInscriptions() === $this) {
                $paiement->setInscriptions(null);
            }
        }

        return $this;
    }




        /**
     * @return Collection|Inscriptions[]
     */
    public function getInscriptions(): Collection
    {
        return $this->inscriptions;
    }

    public function addInscription(Inscriptions $inscription): static
    {
        if (!$this->inscriptions->contains($inscription)) {
            $this->inscriptions->add($inscription);
            $inscription->setCours($this);
        }

        return $this;
    }

    public function removeInscription(Inscriptions $inscription): static
    {
        if ($this->inscriptions->removeElement($inscription)) {
            if ($inscription->getCours() === $this) {
                $inscription->setCours(null);
            }
        }

        return $this;
    }

    public function getDateInscription(): ?\DateTime
    {
        return $this->dateInscription;
    }

    public function setDateInscription(\DateTime $dateInscription): static
    {
        $this->dateInscription = $dateInscription;

        return $this;
    }




}
