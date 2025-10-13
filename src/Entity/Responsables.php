<?php

namespace App\Entity;

use App\Repository\ResponsablesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ResponsablesRepository::class)]
class Responsables
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 80)]
    private ?string $nom = null;

    #[ORM\Column(length: 80)]
    private ?string $prenom = null;

    #[ORM\Column(length: 120)]
    private ?string $adresse = null;

    #[ORM\Column(length: 80)]
    private ?string $ville = null;

    #[ORM\Column]
    private ?int $code_postal = null;

    #[ORM\Column(length: 80)]
    private ?string $email = null;

    #[ORM\Column]
    private ?int $quotient_famillial = null;

    #[ORM\Column]
    private ?int $tel1 = null;

    #[ORM\Column]
    private ?int $tel2 = null;

    #[ORM\Column]
    private ?int $tel3 = null;

    /**
     * @var Collection<int, Eleves>
     */
    #[ORM\OneToMany(targetEntity: Eleves::class, mappedBy: 'responsables')]
    private Collection $eleves;

    public function __construct()
    {
        $this->eleves = new ArrayCollection();
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

    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(string $adresse): static
    {
        $this->adresse = $adresse;

        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(string $ville): static
    {
        $this->ville = $ville;

        return $this;
    }

    public function getCodePostal(): ?int
    {
        return $this->code_postal;
    }

    public function setCodePostal(int $code_postal): static
    {
        $this->code_postal = $code_postal;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    public function getQuotientFamillial(): ?int
    {
        return $this->quotient_famillial;
    }

    public function setQuotientFamillial(int $quotient_famillial): static
    {
        $this->quotient_famillial = $quotient_famillial;

        return $this;
    }

    public function getTel1(): ?int
    {
        return $this->tel1;
    }

    public function setTel1(int $tel1): static
    {
        $this->tel1 = $tel1;

        return $this;
    }

    public function getTel2(): ?int
    {
        return $this->tel2;
    }

    public function setTel2(int $tel2): static
    {
        $this->tel2 = $tel2;

        return $this;
    }

    public function getTel3(): ?int
    {
        return $this->tel3;
    }

    public function setTel3(int $tel3): static
    {
        $this->tel3 = $tel3;

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
            $elefe->setResponsables($this);
        }

        return $this;
    }

    public function removeElefe(Eleves $elefe): static
    {
        if ($this->eleves->removeElement($elefe)) {
            // set the owning side to null (unless already changed)
            if ($elefe->getResponsables() === $this) {
                $elefe->setResponsables(null);
            }
        }

        return $this;
    }
}
