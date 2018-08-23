<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\UploadedFile;

/**
 * Registro
 *
 * @ORM\Table(name="registro")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\RegistroRepository")
 */
class Registro {

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
     * @ORM\Column(name="mayusculas", type="text")
     */
    private $mayusculas;
    /**
     * @var string
     *
     * @ORM\Column(name="mayor", type="integer")
     */
    private $mayor;

    /**
     * @ORM\ManyToOne(targetEntity="User", inversedBy="registro")
     * @ORM\JoinColumn(name="usuario_id", referencedColumnName="id", nullable=false)
     */
    private $usuario;

    /**
     * Unmapped property to handle file uploads
     * @Assert\File(mimeTypes={ "txt", "text/plain" })
     */
    protected $file;

    /**
     * Unmapped property to handle path to file uploads
     */
    protected $path;

    public function __toString() {
        return $this->getId() ? $this->getId() . "" : "";
    }

    /**
     * Get file.
     *
     * @return UploadedFile
     */
    public function getFile() {
        return $this->file;
    }

    /**
     * Sets file.
     *
     * @param UploadedFile $file
     */
    public function setFile(UploadedFile $file = null) {
        $this->file = $file;
    }

    /**
     * Get path.
     *
     * @return string
     */
    public function getPath() {
        return $this->path;
    }

    /**
     * Set path.
     *
     * @param string $path
     */
    public function setPath($path) {
        $this->path = $path;
    }

    public function getFilenameWithPath() {
        $path = explode("../web", $this->getPath());
        if (count($path) >= 2) {
            return $path[1] . "/" . $this->getSoporte();
        }
        return '/uploads/txt/' . $this->getSoporte();
    }

    /**
     * Manages the copying of the file to the relevant place on the server
     */
    public function upload() {
        if (null === $this->getFile()) {
            return;
        }
        $filename = $this->getFile()->getClientOriginalName();
        $ext = pathinfo($filename, PATHINFO_EXTENSION);
        $filename = uniqid(date('YmdHis')) . '.' . $ext;
        $this->getFile()->move(
                $this->getPath(), $filename
        );
        $this->setFile(null);
        return $filename;
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
     * Set mayusculas.
     *
     * @param string $mayusculas
     *
     * @return Registro
     */
    public function setMayusculas($mayusculas) {
        $this->mayusculas = $mayusculas;

        return $this;
    }

    /**
     * Get mayusculas.
     *
     * @return string
     */
    public function getMayusculas() {
        return $this->mayusculas;
    }

    /**
     * Set usuario.
     *
     * @param \AppBundle\Entity\User $usuario
     *
     * @return Registro
     */
    public function setUsuario(\AppBundle\Entity\User $usuario) {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * Get usuario.
     *
     * @return \AppBundle\Entity\User
     */
    public function getUsuario() {
        return $this->usuario;
    }


    /**
     * Set mayor.
     *
     * @param int $mayor
     *
     * @return Registro
     */
    public function setMayor($mayor)
    {
        $this->mayor = $mayor;

        return $this;
    }

    /**
     * Get mayor.
     *
     * @return int
     */
    public function getMayor()
    {
        return $this->mayor;
    }
}
