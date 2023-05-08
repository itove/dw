<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Conf;
use App\Entity\Node;
use App\Entity\Region;

#[Route('/node')]
class NodeController extends AbstractController
{
    private $doctrine;
    
    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;
    }
    
    #[Route('/{slug}', name: 'app_node_show')]
    public function show($slug): Response
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
}
