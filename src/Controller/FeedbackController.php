<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Feedback;
use Doctrine\Persistence\ManagerRegistry;

#[Route('/feedback')]
class FeedbackController extends AbstractController
{
    private $doctrine;

    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;
    }
    
    #[Route('/new', methods: ['POST'], name: 'app_feedback_new')]
    public function new(Request $request): Response
    {
        $name = $request->request->get('name');
        $phone = $request->request->get('phone');
        $email = $request->request->get('email');
        $title = $request->request->get('title');
        $content = $request->request->get('content');
        
        $em = $this->doctrine->getManager();
        $f = new Feedback();
        $f->setName($name);
        $f->setPhone($phone);
        $f->setEmail($email);
        $f->setTitle($title);
        $f->setContent($content);
        $em->persist($f);
        $em->flush();
        
        return $this->json('OK');
    }
}
