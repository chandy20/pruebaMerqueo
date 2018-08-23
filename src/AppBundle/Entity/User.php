<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\Collection;
use FOS\UserBundle\Model\User as BaseUser;
use Symfony\Component\Security\Core\User\UserInterface;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user")
 */
class User extends BaseUser implements UserInterface {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nombres", type="string", length=255, nullable=true)
     */
    private $nombres;

    /**
     * @var string
     *
     * @ORM\Column(name="apellidos", type="string", length=255, nullable=true)
     */
    private $apellidos;
    /**
     * @var string
     *
     * @ORM\Column(name="documento", type="string", length=255, nullable=true)
     */
    private $documento;

    /**
     * @ORM\ManyToOne(targetEntity="TipoDocumento", inversedBy="usuario")
     * @ORM\JoinColumn(name="tipo_documento_id", referencedColumnName="id", nullable=true   )
     */
    private $tipoDocumento;

     /**
     * @ORM\OneToMany(targetEntity="Registro", mappedBy="usuario" , cascade={"persist"})
     */
    private $registro;

    public function __toString() {
        return $this->getNombres() ? $this->getNombres() . " " . $this->getApellidos() : "";
    }

    public function __construct() {
        parent::__construct();
        // your own logic
    }

    /**
     * Set nombres.
     *
     * @param string|null $nombres
     *
     * @return User
     */
    public function setNombres($nombres = null) {
        $this->nombres = $nombres;

        return $this;
    }

    /**
     * Get nombres.
     *
     * @return string|null
     */
    public function getNombres() {
        return $this->nombres;
    }

    /**
     * Set apellidos.
     *
     * @param string|null $apellidos
     *
     * @return User
     */
    public function setApellidos($apellidos = null) {
        $this->apellidos = $apellidos;

        return $this;
    }

    /**
     * Get apellidos.
     *
     * @return string|null
     */
    public function getApellidos() {
        return $this->apellidos;
    }

    /**
     * Set telefono.
     *
     * @param string|null $telefono
     *
     * @return User
     */
    public function setTelefono($telefono = null) {
        $this->telefono = $telefono;

        return $this;
    }

    /**
     * Get telefono.
     *
     * @return string|null
     */
    public function getTelefono() {
        return $this->telefono;
    }


    /**
     * Set tipoDocumento.
     *
     * @param \AppBundle\Entity\TipoDocumento $tipoDocumento
     *
     * @return User
     */
    public function setTipoDocumento(\AppBundle\Entity\TipoDocumento $tipoDocumento)
    {
        $this->tipoDocumento = $tipoDocumento;

        return $this;
    }

    /**
     * Get tipoDocumento.
     *
     * @return \AppBundle\Entity\TipoDocumento
     */
    public function getTipoDocumento()
    {
        return $this->tipoDocumento;
    }

    /**
     * Set documento.
     *
     * @param string|null $documento
     *
     * @return User
     */
    public function setDocumento($documento = null)
    {
        $this->documento = $documento;

        return $this;
    }

    /**
     * Get documento.
     *
     * @return string|null
     */
    public function getDocumento()
    {
        return $this->documento;
    }

    /**
     * Add registro.
     *
     * @param \AppBundle\Entity\Registro $registro
     *
     * @return User
     */
    public function addRegistro(\AppBundle\Entity\Registro $registro)
    {
        $this->registro[] = $registro;

        return $this;
    }

    /**
     * Remove registro.
     *
     * @param \AppBundle\Entity\Registro $registro
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeRegistro(\AppBundle\Entity\Registro $registro)
    {
        return $this->registro->removeElement($registro);
    }

    /**
     * Get registro.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getRegistro()
    {
        return $this->registro;
    }
}
