<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Tag;
use App\Entity\Node;
use App\Service\Data;
use Symfony\Component\HttpFoundation\Request;

class NodeController extends AbstractController
{
    private $doctrine;
    private $data;
    
    public function __construct(ManagerRegistry $doctrine, Data $data)
    {
        $this->doctrine = $doctrine;
        $this->data = $data;
    }
    
    #[Route('/blog/{id}', requirements: ['id' => '\d+'], name: 'app_node_show')]
    public function showNode(int $id): Response
    {
        $arr = $this->data->get($id);
        $arr['page_title'] = '企业动态';
        
        return $this->render('node/node.html.twig', $arr);
    }
    
    #[Route('/blog/{tag}', name: 'app_news_list')]
    public function listNews($tag, Request $request): Response
    {
        $page = $request->query->get('p');
        $limit = 20;
        if (is_null($page)) {
          $offset = 0;
        } else {
          $offset = $limit * $page;
        }
        
        $tago = $this->doctrine->getRepository(Tag::class)->findOneBy(['label' => $tag]);
        // $nodes = $this->doctrine->getRepository(Node::class)->findBy(['tag' => $tago], ['id' => 'DESC']);
        $nodes = $tago->getNodes();
        dump($nodes);

        $arr = $this->data->get();
        $arr['page_title'] = '企业动态';
        $arr['node'] = $tago;
        $arr['nodes'] = $nodes;
        
        return $this->render('node/index.html.twig', $arr);
    }
    
    #[Route('/product/{id}', requirements: ['id' => '\d+'], name: 'app_product')]
    public function showProduct($id): Response
    {
        $arr = $this->data->get($id);
        $arr['page_title'] = '产品方案';
        $arr['page_title_2'] = '产品信息';
        $arr['params'] = [
            '类别' => '数据分析',
        ];
        
        return $this->render('node/detail.html.twig', $arr);
    }
    
    #[Route('/portfolio/{id}', requirements: ['id' => '\d+'], name: 'app_portfolio')]
    public function showPortfolio($id): Response
    {
        $arr = $this->data->get($id);
        $arr['page_title'] = '典型案例';
        $arr['page_title_2'] = '案例详情';
        $arr['params'] = [
            '类别' => '数据分析',
            '客户' => '十堰电信',
            '日期' => '2022年05月18日',
            '项目地址' => 'www.abc.com',
        ];
        
        return $this->render('node/detail.html.twig', $arr);
    }
    
    #[Route('/privacy', name: 'app_privacy')]
    public function showPrivacy(): Response
    {
        $arr = $this->data->get(69);
        $arr['page_title'] = '隐私声明';
        
        return $this->render('node/node.html.twig', $arr);
    }
    
    #[Route('/policy', name: 'app_policy')]
    public function showPolicy(): Response
    {
        $arr = $this->data->get(68);
        $arr['page_title'] = '用户条款';
        
        return $this->render('node/node.html.twig', $arr);
    }
}
