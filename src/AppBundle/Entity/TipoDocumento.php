<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TipoDocumento
 *
 * @ORM\Table(name="tipo_documento")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TipoDocumentoRepository")
 */
class TipoDocumento {

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="descripcion", type="string", length=255, unique=true)
     */
    private $descripcion;

    /**
     * @var string
     *
     * @ORM\Column(name="abreviatura", type="string", length=3, unique=true)
     */
    private $abreviatura;

    /**
     * @ORM\OneToMany(targetEntity="User", mappedBy="tipoDocumento" , cascade={"persist"})
     */
    private $usuario;

    public function __toString() {
        return $this->getDescripcion() ? $this->getAbreviatura() . " - " . $this->getDescripcion() : "";
    }

    /**
     * Get id.
     *
     * @return int
     */
    public function getId() {
        return $this->id;
    }

    /**
     * Set descripcion.
     *
     * @param string $descripcion
     *
     * @return TipoDocumento
     */
    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;

        return $this;
    }

    /**
     * Get descripcion.
     *
     * @return string
     */
    public function getDescripcion() {
        return $this->descripcion;
    }

    /**
     * Set abreviatura.
     *
     * @param string $abreviatura
     *
     * @return TipoDocumento
     */
    public function setAbreviatura($abreviatura) {
        $this->abreviatura = $abreviatura;

        return $this;
    }

    /**
     * Get abreviatura.
     *
     * @return string
     */
    public function getAbreviatura() {
        return $this->abreviatura;
    }

    /**
     * Constructor
     */
    public function __construct() {
        $this->posicion = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add usuario.
     *
     * @param \AppBundle\Entity\User $usuario
     *
     * @return TipoDocumento
     */
    public function addUsuario(\AppBundle\Entity\User $usuario) {
        $this->usuario[] = $usuario;

        return $this;
    }

    /**
     * Remove usuario.
     *
     * @param \AppBundle\Entity\User $usuario
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeUsuario(\AppBundle\Entity\User $usuario) {
        return $this->usuario->removeElement($usuario);
    }

    /**
     * Get usuario.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUsuario() {
        return $this->usuario;
    }

}
