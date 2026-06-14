<?php

namespace App\Controller;

use App\Form\OrderType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;


final class OrderController extends AbstractController
{
    /*
     *  1° étape du tunel d'achat
     *  choix adresse de livraison
     *  choix transporteur
     */
    #[Route('/commander/livraison', name: 'app_order')]
    public function index(): Response
    {
        $addresses = $this->getUser()->getAddresses();

        if(count($addresses)==0) {
            return $this->redirectToRoute('app_account_address_form');
        }
        $form = $this->createForm(OrderType::class, null, [
            'adresses' => $addresses,
        ]);

        return $this->render('order/index.html.twig', [
            'deliveryForm' => $form->createView()
        ]);
    }

}
