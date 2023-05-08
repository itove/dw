<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Conf;
use App\Entity\Node;
use App\Entity\Region;

class NodeController extends AbstractController
{
    private $doctrine;
    
    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;
    }
    
    #[Route('/node/{slug}', name: 'app_node_show')]
    public function showNode($slug): Response
    {
        $conf = $this->doctrine->getRepository(Conf::class)->find(1);
        $nodeRepo = $this->doctrine->getRepository(Node::class);
        $regions = $this->doctrine->getRepository(Region::class)->findAll();
        $arr = [
            'description' => $conf->getDescription(),
            'keywords' => $conf->getKeywords(),
            'site_name' => $conf->getName(),
            'icp' => $conf->getIcp(),
            'address' => $conf->getAddress(),
            'phone' => $conf->getPhone(),
            'email' => $conf->getEmail(),
        ];
        
        foreach($regions as $r ) {
            $limit = $r->getCount();
            if ($limit > 0) {
                $order = 'DESC';
            } else {
                $order = 'ASC';
            }
            if ($limit !== 0) {
                $arr[$r->getLabel()] = $nodeRepo->findBy(['region' => $r], ['id' => $order], abs($limit));
            } else {
                $arr[$r->getLabel()] = $nodeRepo->findOneBy(['region' => $r]);
            }
        }
        
        // is number
        if ($slug) {
            $node = $this->doctrine->getRepository(Node::class)->find($slug);
            $arr['node'] = $node;
        }
        
        return $this->render('node/detail.html.twig', $arr);
    }
    
    #[Route('/news/{tag}', name: 'app_news_list')]
    public function showPrivacy($tag): Response
    {
    }
    
    #[Route('/product/{id}', name: 'app_product')]
    public function showPrivacy($id): Response
    {
    }
    
    #[Route('/portfolio/{id}', name: 'app_portfolio')]
    public function showPrivacy($id): Response
    {
    }
    
    #[Route('/privacy', name: 'app_privacy')]
    public function showPrivacy($slug): Response
    {
    }
    
    #[Route('/policy', name: 'app_policy')]
    public function showPolicy($slug): Response
    {
    }
}
