<?php

namespace AppBundle\Form\Type;

use Doctrine\DBAL\Types\Type;

class BitType extends Type {

    public function getName(): string {
        
    }

    public function getSQLDeclaration(array $fieldDeclaration, \Doctrine\DBAL\Platforms\AbstractPlatform $platform): string {
        $platform->registerDoctrineTypeMapping('bit', 'boolean');
    }

    public function convertToPHPValue($value, \Doctrine\DBAL\Platforms\AbstractPlatform $platform) {
        parent::convertToPHPValue($value, $platform);
        $platform->registerDoctrineTypeMapping('bit', 'boolean');
    }

    public function convertToDatabaseValue($value, \Doctrine\DBAL\Platforms\AbstractPlatform $platform) {
        parent::convertToDatabaseValue($value, $platform);
        $platform->registerDoctrineTypeMapping('bit', 'boolean');
    }

}
