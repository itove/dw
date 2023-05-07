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
use EasyCorp\Bundle\EasyAdminBundle\Dto\SearchDto;
use EasyCorp\Bundle\EasyAdminBundle\Dto\EntityDto;
use EasyCorp\Bundle\EasyAdminBundle\Orm\EntityRepository;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FieldCollection;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FilterCollection;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;
use App\Entity\Region;

class NodeCrudController extends AbstractCrudController
{
    private $doctrine;
    private $region;

    public function __construct(ManagerRegistry $doctrine, RequestStack $requestStack)
    {
        $this->doctrine = $doctrine;
        $request = $requestStack->getCurrentRequest();
        $region_label = $request->query->get('region');
        if (!is_null($region_label)) {
            $this->region = $doctrine->getRepository(Region::class)->findOneBy(['label' => $region_label]);
        }
        dump($region_label);
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

    public function configureFields(string $pageName): iterable
    {
        if (!is_null($this->region)) {
            yield TextField::new('title');
            yield TextareaField::new('synopsis')
                // ->setMaxLength(15)
                ;
        } else {
            yield IdField::new('id')
                ->onlyOnIndex()
            ;
            yield TextField::new('title');
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
}
