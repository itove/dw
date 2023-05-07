<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Node;
use App\Entity\Region;

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
        $nodeRepo = $this->doctrine->getRepository(Node::class);
        $regionRepo = $this->doctrine->getRepository(Region::class);
        $about = $nodeRepo->findBy(['region' => $regionRepo->findOneBy(['label' => 'about'])]);
        $product = $nodeRepo->findOneBy(['region' => $regionRepo->findOneBy(['label' => 'product'])]);
        $product_list = $nodeRepo->findBy(['region' => $regionRepo->findOneBy(['label' => 'product_list'])]);
        
        return $this->render('index/index.html.twig', [
            'about' => $about,
            'product' => $product,
            'product_list' => $product_list,
        ]);
    }
}
