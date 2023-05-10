<?php

namespace App\Controller\Admin;

use App\Entity\Conf;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use Symfony\Component\HttpFoundation\RequestStack;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;

class ConfCrudController extends AbstractCrudController
{
    private $action;
    private $adminUrlGenerator;
    
    public function __construct(RequestStack $requestStack, AdminUrlGenerator $adminUrlGenerator)
    {
        $this->query = $requestStack->getCurrentRequest()->query;
        $this->action = $this->query->get('action');
        $this->adminUrlGenerator = $adminUrlGenerator;
    }
    
    public static function getEntityFqcn(): string
    {
        return Conf::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        $editFn = fn (Action $action) => $action->linkToUrl(fn (Conf $entity) =>
            $this->adminUrlGenerator
                 ->setAction('edit')
                 ->set('entityId', $entity->getId())
                 ->generateUrl()
        );
        
        return $actions
            ->update(Crud::PAGE_DETAIL, Action::EDIT, $editFn)
            ->disable('new')
        ;
    }

    public function configureFields(string $pageName): iterable
    {
        switch ($this->action) {
            case 'contact':
                $fields = [
                    TextField::new('address'),
                    TextField::new('phone'),
                    TextField::new('email'),
                ];
                break;
            default:
                $fields = [
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
        
        return $fields;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setPageTitle('detail', 'Conf')
        ;
    }
}
