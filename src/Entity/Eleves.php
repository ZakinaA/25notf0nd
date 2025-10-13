<?php

namespace App\Entity;

use App\Repository\ElevesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ElevesRepository::class)]
class Eleves
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 80)]
    private ?string $nom = null;

    #[ORM\Column(length: 80)]
    private ?string $prenom = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTime $date_naiss = null;

    #[ORM\ManyToOne(inversedBy: 'eleves')]
    private ?Responsables $responsables = null;

    /**
     * @var Collection<int, Inscriptions>
     */
    #[ORM\OneToMany(targetEntity: Inscriptions::class, mappedBy: 'eleves')]
    private Collection $inscriptions;

    public function __construct()
    {
        $this->inscriptions = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): static
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getDateNaiss(): ?\DateTime
    {
        return $this->date_naiss;
    }

    public function setDateNaiss(\DateTime $date_naiss): static
    {
        $this->date_naiss = $date_naiss;

        return $this;
    }

    public function getResponsables(): ?Responsables
    {
        return $this->responsables;
    }

    public function setResponsables(?Responsables $responsables): static
    {
        $this->responsables = $responsables;

        return $this;
    }

    /**
     * @return Collection<int, Inscriptions>
     */
    public function getInscriptions(): Collection
    {
        return $this->inscriptions;
    }

    public function addInscription(Inscriptions $inscription): static
    {
        if (!$this->inscriptions->contains($inscription)) {
            $this->inscriptions->add($inscription);
            $inscription->setEleves($this);
        }

        return $this;
    }

    public function removeInscription(Inscriptions $inscription): static
    {
        if ($this->inscriptions->removeElement($inscription)) {
            // set the owning side to null (unless already changed)
            if ($inscription->getEleves() === $this) {
                $inscription->setEleves(null);
            }
        }

        return $this;
    }
}
