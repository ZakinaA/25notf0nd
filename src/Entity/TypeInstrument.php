<?php

namespace App\Entity;

use App\Repository\TypeInstrumentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TypeInstrumentRepository::class)]
class TypeInstrument
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 80)]
    private ?string $libelle = null;

    #[ORM\ManyToOne(inversedBy: 'typeInstruments')]
    private ?ClasseInstrument $class_instru = null;

    /**
     * @var Collection<int, Professeur>
     */
    #[ORM\ManyToMany(targetEntity: Professeur::class, mappedBy: 'typeInstrument')]
    private Collection $professeurs;

    public function __construct()
    {
        $this->professeurs = new ArrayCollection();
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

    public function getClassInstru(): ?ClasseInstrument
    {
        return $this->class_instru;
    }

    public function setClassInstru(?ClasseInstrument $class_instru): static
    {
        $this->class_instru = $class_instru;

        return $this;
    }

    /**
     * @return Collection<int, Professeur>
     */
    public function getProfesseurs(): Collection
    {
        return $this->professeurs;
    }

    public function addProfesseur(Professeur $professeur): static
    {
        if (!$this->professeurs->contains($professeur)) {
            $this->professeurs->add($professeur);
            $professeur->addTypeInstrument($this);
        }

        return $this;
    }

    public function removeProfesseur(Professeur $professeur): static
    {
        if ($this->professeurs->removeElement($professeur)) {
            $professeur->removeTypeInstrument($this);
        }

        return $this;
    }
}
