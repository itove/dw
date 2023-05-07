<?php

namespace App\Controller\Admin;

use App\Entity\Node;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use App\Admin\Field\VichImageField;

class NodeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Node::class;
    }

    public function configureFields(string $pageName): iterable
    {
        yield IdField::new('id')
            ->onlyOnIndex()
        ;
        yield TextField::new('title');
        yield TextField::new('label');
        yield ImageField::new('img')
            ->onlyOnIndex()
            ->setBasePath('img/')
            ->setUploadDir('public/img/')
        ;
        yield VichImageField::new('imageFile', 'Img')
            ->hideOnIndex()
        ;
        yield TextField::new('icon');
        yield AssociationField::new('region');
        yield AssociationField::new('tag');
        
        yield TextareaField::new('synopsis')
            ->setMaxLength(15)
        ;
        yield TextareaField::new('body')
            ->onlyOnForms()
        ;
        yield DateTimeField::new('createdAt')
            ->onlyOnIndex();
    }
}
