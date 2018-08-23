<?php

namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\AdminBundle\Route\RouteCollection;

class TipoDocumentoAdmin extends AbstractAdmin {

    protected function configureRoutes(RouteCollection $collection) {
        
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper) {
        $datagridMapper
                ->add('descripcion')
                ->add('abreviatura')
        ;
    }

    protected function configureListFields(ListMapper $listMapper) {
        $listMapper
                ->add('descripcion')
                ->add('abreviatura')
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
        $formMapper
                ->add('descripcion')
                ->add('abreviatura')
        ;
    }

    protected function configureShowFields(ShowMapper $showMapper) {
        $showMapper
                ->add('descripcion')
                ->add('abreviatura')
        ;
    }

}
