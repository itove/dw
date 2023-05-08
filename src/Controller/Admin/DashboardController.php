<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use App\Entity\Node;
use App\Entity\Region;
use App\Entity\Tag;
use App\Entity\User;
use App\Entity\Conf;
use Doctrine\Persistence\ManagerRegistry;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;

class DashboardController extends AbstractDashboardController
{
    private $doctrine;
    private $nodes;

    public function __construct(ManagerRegistry $doctrine)
    {
      $this->doctrine = $doctrine;
      $this->nodes = $doctrine->getRepository(Node::class);
    }
    
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        return $this->redirect($adminUrlGenerator->setController(NodeCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        // Make sure first one is company name
        $title = $this->nodes->find(1);
        return Dashboard::new()
            ->setTitle($title);
    }
    
    public function configureCrud(): Crud
    {
        return Crud::new()
            ->showEntityActionsInlined()
            ->setTimezone('Asia/Shanghai')
            ->setDateTimeFormat('yyyy/MM/dd HH:mm')
            ->setDefaultSort(['id' => 'DESC'])
        ;
    }

    public function configureActions(): Actions
    {
        return Actions::new()
            ->disable('delete')
            ->add('detail', 'edit')
            ->add('index', 'edit')
            ->add('index', 'new')
            ->add(Crud::PAGE_NEW, Action::SAVE_AND_RETURN)
            ->add(Crud::PAGE_EDIT, Action::SAVE_AND_RETURN)
            ->add(Crud::PAGE_EDIT, Action::SAVE_AND_CONTINUE)
        ;
    }

    public function configureMenuItems(): iterable
    {
        $regions = $this->doctrine->getRepository(Region::class);
        
        yield MenuItem::section('关于我们');
        
        $region_about = $regions->findOneBy(['label' => 'about']);
        $abouts = $this->nodes->findBy(['region' => $region_about]);
        foreach ($abouts as $i) {
            yield MenuItem::linkToCrud($i, 'fas fa-list', Node::class)
                ->setQueryParameter('region', 'about')
                ->setAction('detail')
                ->setEntityId($i->getId());
            ;
        }
        
        yield MenuItem::section('产品方案');
        yield MenuItem::linkToCrud('产品及服务', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'product')
            ->setAction('detail')
            ->setEntityId(10);
        ;
        yield MenuItem::linkToCrud('产品列表', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'product_list')
        ;
        
        yield MenuItem::section('我们的优势');
        yield MenuItem::linkToCrud('我们的优势', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'why')
            ->setAction('detail')
            ->setEntityId(17);
        ;
        yield MenuItem::linkToCrud('优势列表', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'why_list')
        ;
        
        yield MenuItem::section('典型案例');
        yield MenuItem::linkToCrud('典型案例', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'portfolio')
            ->setAction('detail')
            ->setEntityId(21);
        ;
        yield MenuItem::linkToCrud('案例列表', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'portfolio_list')
            ->setQueryParameter('img', '1')
        ;
        
        yield MenuItem::section('团队介绍');
        yield MenuItem::linkToCrud('团队成员', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'team')
            ->setAction('detail')
            ->setEntityId(31);
        ;
        yield MenuItem::linkToCrud('成员列表', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'member_list')
            ->setQueryParameter('img', '1')
        ;
        
        yield MenuItem::section('产品价格');
        yield MenuItem::linkToCrud('产品价格', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'price')
            ->setAction('detail')
            ->setEntityId(36);
        ;
        yield MenuItem::linkToCrud('价格列表', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'price_list')
            ->setQueryParameter('synopsis', 'Price') // parameter as field label
            ->setQueryParameter('body', 'Feature')
        ;
        
        yield MenuItem::section('常见问题');
        yield MenuItem::linkToCrud('常见问题', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'faq')
            ->setAction('detail')
            ->setEntityId(37);
        ;
        yield MenuItem::linkToCrud('问题列表', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'faq_list')
        ;
        
        yield MenuItem::section('联系我们');
        yield MenuItem::linkToCrud('联系我们', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'contact')
            ->setAction('detail')
            ->setEntityId(38);
        ;
        yield MenuItem::linkToCrud('联系信息', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'contact_list')
        ;
        
        yield MenuItem::section('企业动态');
        yield MenuItem::linkToCrud('企业动态', 'fas fa-list', Node::class)
            ->setQueryParameter('region', 'news')
            ->setQueryParameter('img', '1')
            ->setQueryParameter('tag', '1')
            ->setQueryParameter('body', 'Body')
        ;
        yield MenuItem::section('系统管理');
        yield MenuItem::linkToCrud('用户管理', 'fas fa-list', User::class);
        yield MenuItem::linkToCrud('系统设置', 'fas fa-list', Conf::class)
            ->setAction('detail')
            ->setEntityId(1)
        ;
        
        yield MenuItem::section('Super Admin');
        yield MenuItem::linkToCrud('region', 'fas fa-list', Region::class);
        yield MenuItem::linkToCrud('tag', 'fas fa-list', Tag::class);
        yield MenuItem::linkToCrud('node', 'fas fa-list', Node::class)
        ;
    }
}
