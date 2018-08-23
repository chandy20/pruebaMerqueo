<?php

namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Show\ShowMapper;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistroAdmin extends AbstractAdmin
{

    protected function configureRoutes(RouteCollection $collection) {
        
    }
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('mayusculas')
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('mayusculas', null, ["label"=> "label.mayusculas"])
            ->add('mayor',  null, ["label"=> "label.mayor"])
            ->add('usuario')
            ->add('_action', null, [
                'actions' => [
                    'show' => [],
                    'edit' => [],
                    'delete' => [],
                ],
            ])
        ;
    }

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->add('file', 'file', [
                    'label' => 'label.file',
                    'required' => true,
                    'constraints' => [
                        new File([
                            'maxSize' => ini_get('upload_max_filesize')
                                ]),
                        new NotBlank()
                    ]
                ])
        ;
    }

    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('mayusculas')
        ;
    }
    
    public function prePersist($object) {
        parent::prePersist($object);
        $this->preUpdate($object);
    }

    public function preUpdate($object) {
        parent::preUpdate($object);
        $user = $this->getConfigurationPool()->getContainer()->get('security.token_storage')->getToken()->getUser();
        $object->setUsuario($user);
    }
}
