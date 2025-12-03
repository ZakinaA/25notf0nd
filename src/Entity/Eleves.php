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

    #[ORM\ManyToOne(inversedBy: 'eleves')]
    private ?Tranche $tranche = null;

    /**
     * @var Collection<int, ContratPret>
     */
    #[ORM\OneToMany(targetEntity: ContratPret::class, mappedBy: 'eleves')]
    private Collection $contratPrets;

    #[ORM\ManyToOne(inversedBy: 'eleves')]
    private ?role $role = null;

    public function __construct()
    {
        $this->inscriptions = new ArrayCollection();
        $this->contratPrets = new ArrayCollection();
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

    public function getTranche(): ?Tranche
    {
        return $this->tranche;
    }

    public function setTranche(?Tranche $tranche): static
    {
        $this->tranche = $tranche;

        return $this;
    }

    /**
     * @return Collection<int, ContratPret>
     */
    public function getContratPrets(): Collection
    {
        return $this->contratPrets;
    }

    public function addContratPret(ContratPret $contratPret): static
    {
        if (!$this->contratPrets->contains($contratPret)) {
            $this->contratPrets->add($contratPret);
            $contratPret->setEleves($this);
        }

        return $this;
    }

    public function removeContratPret(ContratPret $contratPret): static
    {
        if ($this->contratPrets->removeElement($contratPret)) {
            // set the owning side to null (unless already changed)
            if ($contratPret->getEleves() === $this) {
                $contratPret->setEleves(null);
            }
        }

        return $this;
    }

    public function getRole(): ?role
    {
        return $this->role;
    }

    public function setRole(?role $role): static
    {
        $this->role = $role;

        return $this;
    }
}
