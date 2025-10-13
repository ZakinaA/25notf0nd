<?php

namespace App\Entity;

use App\Repository\CoursRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CoursRepository::class)]
class Cours
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 80)]
    private ?string $libelle = null;

    #[ORM\Column]
    private ?int $ageMini = null;

    #[ORM\Column]
    private ?int $ageMaxi = null;

    /**
     * @var Collection<int, Inscriptions>
     */
    #[ORM\OneToMany(targetEntity: Inscriptions::class, mappedBy: 'cours')]
    private Collection $inscriptions;

    public function __construct()
    {
        $this->inscriptions = new ArrayCollection();
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

    public function getAgeMini(): ?int
    {
        return $this->ageMini;
    }

    public function setAgeMini(int $ageMini): static
    {
        $this->ageMini = $ageMini;

        return $this;
    }

    public function getAgeMaxi(): ?int
    {
        return $this->ageMaxi;
    }

    public function setAgeMaxi(int $ageMaxi): static
    {
        $this->ageMaxi = $ageMaxi;

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
            $inscription->setCours($this);
        }

        return $this;
    }

    public function removeInscription(Inscriptions $inscription): static
    {
        if ($this->inscriptions->removeElement($inscription)) {
            // set the owning side to null (unless already changed)
            if ($inscription->getCours() === $this) {
                $inscription->setCours(null);
            }
        }

        return $this;
    }
}
