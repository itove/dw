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
use Doctrine\Persistence\ManagerRegistry;

class DashboardController extends AbstractDashboardController
{
    private $doctrine;

    public function __construct(ManagerRegistry $doctrine)
    {
      $this->doctrine = $doctrine;
    }
    
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        // return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        return $this->redirect($adminUrlGenerator->setController(NodeCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('湖北多维信息技术有限公司');
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

    public function configureMenuItems(): iterable
    {
        $nodes = $this->doctrine->getRepository(Node::class);
        $regions = $this->doctrine->getRepository(Region::class);
        
        yield MenuItem::section('关于我们');
        
        $region_about = $regions->findOneBy(['label' => 'about']);
        $abouts = $nodes->findBy(['region' => $region_about]);
        foreach ($abouts as $i) {
            yield MenuItem::linkToCrud($i, 'fas fa-list', Node::class)
                ->setController(AboutCrudController::class)
                ->setAction('detail')
                ->setEntityId($i->getId());
            ;
        }
        
        yield MenuItem::section('产品方案');
        yield MenuItem::linkToCrud('产品及服务', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(10);
        ;
        yield MenuItem::linkToCrud('产品列表', 'fas fa-list', Node::class)
            ->setController(ListCrudController::class)
        ;
        
        yield MenuItem::section('我们的优势');
        yield MenuItem::linkToCrud('我们的优势', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(17);
        ;
        yield MenuItem::linkToCrud('优势列表', 'fas fa-list', Node::class)
            ->setController(WhyUsCrudController::class)
        ;
        
        yield MenuItem::section('典型案例');
        yield MenuItem::linkToCrud('典型案例', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(21);
        ;
        yield MenuItem::linkToCrud('案例列表', 'fas fa-list', Node::class)
            ->setController(PortfolioCrudController::class)
        ;
        
        yield MenuItem::section('团队介绍');
        yield MenuItem::linkToCrud('团队成员', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(31);
        ;
        yield MenuItem::linkToCrud('成员列表', 'fas fa-list', Node::class)
            ->setController(TeamCrudController::class)
        ;
        
        yield MenuItem::section('产品价格');
        yield MenuItem::linkToCrud('产品价格', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(36);
        ;
        yield MenuItem::linkToCrud('价格列表', 'fas fa-list', Node::class)
            ->setController(PriceCrudController::class)
        ;
        
        yield MenuItem::section('常见问题');
        yield MenuItem::linkToCrud('常见问题', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(37);
        ;
        yield MenuItem::linkToCrud('问题列表', 'fas fa-list', Node::class)
            ->setController(FaqCrudController::class)
        ;
        
        yield MenuItem::section('联系我们');
        yield MenuItem::linkToCrud('联系我们', 'fas fa-list', Node::class)
            ->setController(AboutCrudController::class)
            ->setAction('detail')
            ->setEntityId(38);
        ;
        yield MenuItem::linkToCrud('联系信息', 'fas fa-list', Node::class)
            ->setController(ContactCrudController::class)
        ;
        
        yield MenuItem::section('企业动态');
        yield MenuItem::linkToCrud('企业动态', 'fas fa-list', Node::class)
            ->setController(NewsCrudController::class)
        ;
        
        yield MenuItem::section('Super Admin');
        yield MenuItem::linkToCrud('region', 'fas fa-list', Region::class);
        yield MenuItem::linkToCrud('tag', 'fas fa-list', Tag::class);
        yield MenuItem::linkToCrud('node', 'fas fa-list', Node::class)
            ->setController(NodeCrudController::class)
        ;
    }
}
