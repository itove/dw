<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Service\Data;
use Symfony\Component\HttpFoundation\Request;

class NodeController extends AbstractController
{
    private $data;
    
    public function __construct(Data $data)
    {
        $this->data = $data;
    }
    
    #[Route('/blog/{id}', requirements: ['id' => '\d+'], name: 'app_node_show')]
    public function showNode(int $id): Response
    {
        $arr = $this->data->get($id);
        $arr['page_title'] = '企业动态';
        
        return $this->render('node/node.html.twig', $arr);
    }
    
    #[Route('/blog/{tagLabel}', name: 'app_news_list')]
    public function listNews($tagLabel, Request $request): Response
    {
        $page = $request->query->get('p');
        $limit = 20;
        if (is_null($page) || empty($page)) {
          $page = 1;
        }
        $offset = $limit * ($page - 1);
        
        $nodes = $this->data->getNodeByTag($tagLabel, $limit, $offset);
        $nodes_all = $this->data->getNodeByTag($tagLabel);
        $tag = $this->data->getTagByLabel($tagLabel);

        $arr = $this->data->get();
        $arr['page_title'] = '企业动态';
        $arr['node'] = $tag;
        $arr['nodes'] = $nodes;
        $arr['page'] = $page;
        $arr['page_count'] = ceil(count($nodes_all) / $limit);
        
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
