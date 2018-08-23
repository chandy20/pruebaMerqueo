<?php

namespace AppBundle\DataFixtures\ORM;

use AppBundle\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class UserFixture extends Fixture {

    public function load(ObjectManager $manager) {
        $user = new User();
        $user->setUsername("admin");
        $user->setUsernameCanonical("admin");
        $user->setEmail("email@email.com");
        $user->setPlainPassword("admin");
        $user->setEmailCanonical("email@email.com");
        $user->setRoles(array('ROLE_SUPER_ADMIN'));
        $user->setEnabled(true);
        $manager->persist($user);
        
        $manager->flush();
    }

}
?>
