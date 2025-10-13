<?php

namespace App\Entity;

use App\Repository\TrancheRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TrancheRepository::class)]
class Tranche
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $libelle = null;

    #[ORM\Column]
    private ?int $quotientMini = null;

    /**
     * @var Collection<int, Type>
     */
    #[ORM\ManyToMany(targetEntity: Type::class, inversedBy: 'tranches')]
    private Collection $type;

    /**
     * @var Collection<int, Eleves>
     */
    #[ORM\OneToMany(targetEntity: Eleves::class, mappedBy: 'tranche')]
    private Collection $eleves;

    /**
     * @var Collection<int, Responsables>
     */
    #[ORM\OneToMany(targetEntity: Responsables::class, mappedBy: 'tranche')]
    private Collection $responsables;

    public function __construct()
    {
        $this->type = new ArrayCollection();
        $this->eleves = new ArrayCollection();
        $this->responsables = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(string $libelle): static
    {
        $this->libelle = $libelle;

        return $this;
    }

    public function getQuotientMini(): ?int
    {
        return $this->quotientMini;
    }

    public function setQuotientMini(int $quotientMini): static
    {
        $this->quotientMini = $quotientMini;

        return $this;
    }

    /**
     * @return Collection<int, Type>
     */
    public function getType(): Collection
    {
        return $this->type;
    }

    public function addType(Type $type): static
    {
        if (!$this->type->contains($type)) {
            $this->type->add($type);
        }

        return $this;
    }

    public function removeType(Type $type): static
    {
        $this->type->removeElement($type);

        return $this;
    }

    /**
     * @return Collection<int, Eleves>
     */
    public function getEleves(): Collection
    {
        return $this->eleves;
    }

    public function addElefe(Eleves $elefe): static
    {
        if (!$this->eleves->contains($elefe)) {
            $this->eleves->add($elefe);
            $elefe->setTranche($this);
        }

        return $this;
    }

    public function removeElefe(Eleves $elefe): static
    {
        if ($this->eleves->removeElement($elefe)) {
            // set the owning side to null (unless already changed)
            if ($elefe->getTranche() === $this) {
                $elefe->setTranche(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Responsables>
     */
    public function getResponsables(): Collection
    {
        return $this->responsables;
    }

    public function addResponsable(Responsables $responsable): static
    {
        if (!$this->responsables->contains($responsable)) {
            $this->responsables->add($responsable);
            $responsable->setTranche($this);
        }

        return $this;
    }

    public function removeResponsable(Responsables $responsable): static
    {
        if ($this->responsables->removeElement($responsable)) {
            // set the owning side to null (unless already changed)
            if ($responsable->getTranche() === $this) {
                $responsable->setTranche(null);
            }
        }

        return $this;
    }
}
