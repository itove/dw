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
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use App\Admin\Field\VichImageField;
use EasyCorp\Bundle\EasyAdminBundle\Dto\SearchDto;
use EasyCorp\Bundle\EasyAdminBundle\Dto\EntityDto;
use EasyCorp\Bundle\EasyAdminBundle\Orm\EntityRepository;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FieldCollection;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FilterCollection;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;
use App\Entity\Region;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Config\Assets;
use EasyCorp\Bundle\EasyAdminBundle\Config\Asset;

class NodeCrudController extends AbstractCrudController
{
    private $region;
    private $query;
    private $adminUrlGenerator;

    public function __construct(ManagerRegistry $doctrine, RequestStack $requestStack, AdminUrlGenerator $adminUrlGenerator)
    {
        $this->query= $requestStack->getCurrentRequest()->query;
        $region_label = $this->query->get('region');
        if (!is_null($region_label)) {
            $this->region = $doctrine->getRepository(Region::class)->findOneBy(['label' => $region_label]);
        }
        $this->adminUrlGenerator = $adminUrlGenerator;
    }
    
    public static function getEntityFqcn(): string
    {
        return Node::class;
    }
    
    public function createIndexQueryBuilder(SearchDto $searchDto, EntityDto $entityDto, FieldCollection $fields, FilterCollection $filters): QueryBuilder
    {
        $response = $this->container->get(EntityRepository::class)->createQueryBuilder($searchDto, $entityDto, $fields, $filters);
        if (!is_null($this->region)) {
            $id = $this->region->getId();
            $response->andWhere("entity.region = $id");
        }
        return $response;
    }
    
    public function createEntity(string $entityFqcn)
    {
        $node = new Node();
        if (!is_null($this->region)) {
            $node->setRegion($this->region);
        }
        return $node;
    }

    public function configureActions(Actions $actions): Actions
    {
        $new1 = Action::new('new1', 'New')
            ->createAsGlobalAction()
            ->addCssClass('btn btn-primary')
            ->linkToUrl(function (){
                return $this->adminUrlGenerator
                    // ->setController(NodeCrudController::class)
                    ->setAction('new')
                    // ->set('menuIndex', 1)
                    ->generateUrl();
            })
            ;
        
        $edit1 = Action::new('edit1', 'Edit')
            // ->addCssClass('btn btn-primary')
            ->linkToUrl(function (Node $entity){
                return $this->adminUrlGenerator
                    // ->setController(NodeCrudController::class)
                    ->setAction('edit')
                    // ->set('menuIndex', 1)
                    ->set('entityId', $entity->getId())
                    ->generateUrl();
            })
            ;
        
        return $actions
            ->remove('index', 'new')
            ->remove('index', 'edit')
            ->remove('detail', 'edit')
            ->add('index', $new1)
            ->add('index', $edit1)
            ->add('detail', $edit1)
        ;
        /*
        return $actions
            ->update(Crud::PAGE_INDEX, Action::NEW, function (Action $action) {
                return $action->setQueryParameter('fa fa-file-alt');
            })

            // in PHP 7.4 and newer you can use arrow functions
            // ->update(Crud::PAGE_INDEX, Action::NEW,
            //     fn (Action $action) => $action->setIcon('fa fa-file-alt'))
            ;
         */
    }
    
    public function configureAssets(Assets $assets): Assets
    {
        return $assets
            ->addJsFile(
                Asset::new('/js/ckeditor.js')
                    ->onlyOnForms()
            )
            ->addJsFile(
                Asset::new('/js/initCKEditor.js')
                    ->defer()
                    ->onlyOnForms()
            )
        ;
    }

    public function configureFields(string $pageName): iterable
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN') && is_null($this->region)) {
            yield IdField::new('id')
                ->onlyOnIndex()
            ;
            yield TextField::new('icon');
            yield AssociationField::new('region');
            yield ArrayField::new('tag')
                ->hideOnForm()
            ;
            yield AssociationField::new('tag')
                ->onlyOnForms()
            ;
            yield TextareaField::new('body')
                ->onlyOnForms()
            ;
            yield DateTimeField::new('createdAt')
                ->onlyOnIndex()
            ;
        }
        
        yield TextField::new('title');
        if (!is_null($this->query->get('img'))) {
            yield ImageField::new('img')
                ->onlyOnIndex()
                ->setBasePath('img/')
                ->setUploadDir('public/img/')
            ;
            yield VichImageField::new('imageFile', 'Img')
                ->hideOnIndex()
            ;
        }
        if (!is_null($this->query->get('tag'))) {
            yield ArrayField::new('tag')
                ->hideOnForm()
            ;
            yield AssociationField::new('tag')
                ->onlyOnForms()
            ;
        }
        yield TextareaField::new('synopsis')
            // ->setMaxLength(15)
        ;
        if (!is_null($this->query->get('body'))) {
            yield TextareaField::new('body')
                ->onlyOnForms()
            ;
            yield DateTimeField::new('createdAt')
                ->onlyOnIndex()
            ;
        }
    }
}
