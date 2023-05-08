<?php

namespace App\Controller\Admin;

use App\Entity\Conf;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;

class ConfCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Conf::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name', 'Site Name'),
            ArrayField::new('keywords'),
            TextareaField::new('description'),
            TextField::new('address'),
            TextField::new('phone'),
            TextField::new('email'),
            TextField::new('icp'),
            TextField::new('weibo'),
            TextField::new('wx'),
            TextField::new('twitter'),
            TextField::new('facebook'),
            TextField::new('linkedin'),
        ];
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setPageTitle('detail', 'Conf')
        ;
    }
}
