<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/node')]
class NodeController extends AbstractController
{
    #[Route('/{slug}', name: 'app_node_show')]
    public function show($slug): Response
    {
        return $this->render('node/index.html.twig', [
            'controller_name' => 'NodeController',
        ]);
    }
}
