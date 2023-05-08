<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

#[Route('/api')]
class ApiController extends AbstractController
{
    #[Route('/media_objects', methods: ['POST'])]
    public function upload(Request $request): Response
    {
        dump($request);
        $file = $request->files->get('upload');
        dump($file);
        return $this->json(['code' => 0]);
    }
}
