<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Node;
use App\Entity\Region;
use App\Entity\Conf;

class IndexController extends AbstractController
{
    private $doctrine;
    
    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;
    }
    
    #[Route('/', name: 'app_index')]
    public function index(): Response
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
            'conf' => $conf,
        ];
        
        foreach($regions as $r ) {
            $limit = $r->getCount();
            if (str_ends_with($r->getLabel(), '_list')) {
                $arr[$r->getLabel()] = $nodeRepo->findBy(['region' => $r], ['id' => 'DESC'], $limit);
            } else if ($r->getLabel() === 'about') {
                $arr[$r->getLabel()] = $nodeRepo->findBy(['region' => $r], [], $limit);
            } else {
                $arr[$r->getLabel()] = $nodeRepo->findOneBy(['region' => $r]);
            }
        }
        
        return $this->render('index/index.html.twig', $arr);
    }
}
