<?php

namespace AppBundle\Admin;

use AppBundle\Form\StringToArrayTransformer;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Show\ShowMapper;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Validator\Constraints\NotBlank;

class UserAdmin extends AbstractAdmin {

    protected function configureRoutes(RouteCollection $collection) {
        $collection->remove("delete");
        $collection->remove("edit");
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('username')
                ->add('nombres')
                ->add('documento')
                ->add('email')
                ->add('enabled')
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('tipoDocumento', null, ["label" => "label.tipo.documento"])
                ->add('documento', null, ["label" => "label.documento"])
                ->add('nombres', null, ["label" => "label.nombres"])
                ->add('username', null, ["label" => "label.username"])
                ->add('email', null, ["label" => "label.email"])
                ->add('enabled', null, ["editable" => true, "label" => "label.enabled"])
                ->add('_action', null, [
                    'actions' => [
                        'show' => [],
                        'edit' => [],
                        'delete' => [],
                    ],
                ])
        ;
    }

    protected function configureFormFields(FormMapper $formMapper) {
        $transformer = new StringToArrayTransformer();
        $choices = array();
        $admin = $this->getConfigurationPool()->getContainer()->get("security.authorization_checker")->isGranted("ROLE_SUPER_ADMIN");
        foreach ($this->getConfigurationPool()->getContainer()->getParameter('security.role_hierarchy.roles') as $rol) {
            $choices["$rol[0]"] = $rol[0];
        }

        $formMapper
                ->add('tipoDocumento', null, ["label" => "label.tipo.documento", "required" => true, "constraints" => new NotBlank()])
                ->add('documento', null, ["label" => "label.documento", "required" => true, "constraints" => new NotBlank()])
                ->add('nombres', null, ["label" => "label.nombres", "required" => true, "constraints" => new NotBlank()])
                ->add('username', null, ["label" => "label.username", "required" => true, "constraints" => new NotBlank()])
                ->add('email', null, ["label" => "label.email"])
                ->add('plainPassword', RepeatedType::class, array(
                    'type' => PasswordType::class,
                    'invalid_message' => 'error.password.distintos',
                    'first_options' => array('label' => 'label.password'),
                    'second_options' => array('label' => 'label.repetir.password'),
                    "required" => true,
                    "constraints" => new NotBlank()
        ));
        $formMapper->add($formMapper->create('roles', 'choice', array(
                    "constraints" => new NotBlank(),
                    'label' => "label.roles",
                    "required" => true,
                    'mapped' => true,
                    'expanded' => false,
                    'multiple' => false,
                    'choices' => $choices
                ))->addModelTransformer($transformer));
    }

    protected function configureShowFields(ShowMapper $showMapper) {
        $showMapper
                ->add('tipoDocumento', null, ["label" => "label.tipo.documento"])
                ->add('documento', null, ["label" => "label.documento"])
                ->add('nombres', null, ["label" => "label.nombres"])
                ->add('username', null, ["label" => "label.username"])
                ->add('enabled', null, ["label" => "label.enabled"])

        ;
    }

    public function prePersist($object) {
        $this->preUpdate($object);
    }

    public function preUpdate($object) {
        parent::preUpdate($object);
        $user = $this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
        $encoder = $this->getConfigurationPool()->getContainer()->get('security.encoder_factory')->getEncoder($user);
        $password = $encoder->encodePassword($object->getPassword(), $user->getSalt());
        $object->setPassword($password);
        $object->setEnabled(true);
    }
    
     public function getTemplate($name) {

        switch ($name) {
            case 'create':
            case 'edit':
                return 'AppBundle:User:base_edit.html.twig';
                break;
            default:
                return parent::getTemplate($name);
                break;
        }
    }


}
