<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\Data;

class IndexController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(Data $data): Response
    {
        return $this->render('index/index.html.twig', $data->get());
    }
}
