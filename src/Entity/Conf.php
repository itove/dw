<?php

namespace App\Entity;

use App\Repository\ConfRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConfRepository::class)]
class Conf
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(type: Types::SIMPLE_ARRAY, nullable: true)]
    private array $keywords = [];

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(length: 255)]
    private ?string $address = null;

    #[ORM\Column(length: 20)]
    private ?string $phone = null;

    #[ORM\Column(length: 20)]
    private ?string $email = null;

    #[ORM\Column(length: 20)]
    private ?string $icp = '鄂ICP备XXXXXXXX号-X';

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $weibo = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $wx = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $twitter = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $facebook = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $linkedin = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getKeywords(): array
    {
        return $this->keywords;
    }

    public function setKeywords(?array $keywords): self
    {
        $this->keywords = $keywords;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getIcp(): ?string
    {
        return $this->icp;
    }

    public function setIcp(?string $icp): self
    {
        $this->icp = $icp;

        return $this;
    }

    public function getWeibo(): ?string
    {
        return $this->weibo;
    }

    public function setWeibo(?string $weibo): self
    {
        $this->weibo = $weibo;

        return $this;
    }

    public function getWx(): ?string
    {
        return $this->wx;
    }

    public function setWx(?string $wx): self
    {
        $this->wx = $wx;

        return $this;
    }

    public function getTwitter(): ?string
    {
        return $this->twitter;
    }

    public function setTwitter(?string $twitter): self
    {
        $this->twitter = $twitter;

        return $this;
    }

    public function getFacebook(): ?string
    {
        return $this->facebook;
    }

    public function setFacebook(?string $facebook): self
    {
        $this->facebook = $facebook;

        return $this;
    }

    public function getLinkedin(): ?string
    {
        return $this->linkedin;
    }

    public function setLinkedin(?string $linkedin): self
    {
        $this->linkedin = $linkedin;

        return $this;
    }
}
