<?php
/**
 * vim:ft=php et ts=4 sts=4
 * @version
 * @todo
 */

namespace App\EventListener;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\User;
use Doctrine\Persistence\Event\LifecycleEventArgs;
use App\Entity\Taxon;
use Doctrine\Bundle\DoctrineBundle\Attribute\AsEntityListener;
use Doctrine\ORM\Events;

#[AsEntityListener(event: Events::prePersist, entity: User::class)]
// #[AsEntityListener(event: Events::postPersist, entity: User::class)]
class UserNew extends AbstractController
{
    private $hasher;

    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }

    public function prePersist(User $user, LifecycleEventArgs $event): void
    {
        if (is_null($user->getPlainPassword())) {
            // $user->setPlainPassword('111');
        }
        $user->setPassword($this->hasher->hashPassword($user, $user->getPlainPassword()));
        $user->eraseCredentials();

    }

    public function postPersist(User $user, LifecycleEventArgs $event): void
    {
    }
}
