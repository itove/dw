<?php

namespace App\Controller\Admin;

use App\Entity\Node;
use App\Entity\Region;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Dto\SearchDto;
use EasyCorp\Bundle\EasyAdminBundle\Dto\EntityDto;
use EasyCorp\Bundle\EasyAdminBundle\Orm\EntityRepository;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FieldCollection;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FilterCollection;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;

class ContactCrudController extends AbstractCrudController
{
    private $doctrine;
    private RequestStack $requestStack;
    private $region;

    public function __construct(ManagerRegistry $doctrine, RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
        $this->doctrine = $doctrine;
        $this->region = $doctrine->getRepository(Region::class)->findOneBy(['label' => 'contact_list']);
    }
    
    public static function getEntityFqcn(): string
    {
        return Node::class;
    }

    public function configureFields(string $pageName): iterable
    {
        yield TextField::new('title');
        yield TextareaField::new('synopsis')
            // ->setMaxLength(15)
        ;
    }
    
    public function createIndexQueryBuilder(SearchDto $searchDto, EntityDto $entityDto, FieldCollection $fields, FilterCollection $filters): QueryBuilder
    {
        $response = $this->container->get(EntityRepository::class)->createQueryBuilder($searchDto, $entityDto, $fields, $filters);
        $id = $this->region->getId();
        $response->andWhere("entity.region = $id");
        return $response;
    }
    
    public function createEntity(string $entityFqcn)
    {
        $node = new Node();
        $node->setRegion($this->region);
        return $node;
    }
}
