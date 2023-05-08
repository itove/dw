<?php

namespace App\Controller\Admin;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\HttpFoundation\RequestStack;

class UserCrudController extends AbstractCrudController
{
    private $action;
    public function __construct(RequestStack $requestStack)
    {
        $this->query = $requestStack->getCurrentRequest()->query;
        $this->action = $this->query->get('action');
    }
    
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    public function configureFields(string $pageName): iterable
    {
        if ($this->action === 'chpw') {
            yield TextField::new('username')
                ->setDisabled()
            ;
            yield TextField::new('plainPassword')
                ->setFormType(RepeatedType::class)
                ->setRequired(true)
                ->setFormTypeOptions([
                    'type' => PasswordType::class,
                    'first_options' => ['label' => 'Password'],
                    'second_options' => ['label' => 'Repeat password'],
                    // 'required' => 'required',
                ]);
        } else {
            yield TextField::new('username');
            yield ChoiceField::new('roles')
                ->onlyOnIndex()
                ->setChoices([
                    'user' => 'ROLE_USER',
                    'admin' => 'ROLE_ADMIN',
                ])
                ;
            yield ChoiceField::new('roles')
                ->onlyOnForms()
                ->allowMultipleChoices()
                ->setChoices([
                    'admin' => 'ROLE_ADMIN',
                ])
                ->setRequired(false)
            ;
            yield TextField::new('plainPassword')
                ->onlyOnForms()
            ;
        }
    }
}
