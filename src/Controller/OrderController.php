<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Form\OrderType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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
            'action' => $this->generateUrl('app_order_summary'),
        ]);

        return $this->render('order/index.html.twig', [
            'deliveryForm' => $form->createView()
        ]);
    }

    /*
     *  2° étape du tunel d'achat
     *  recap de la commande utilisateur
     *  insertion en BDD
     *  préparation du paiement vers Stripe
     */
    #[Route('/commande/recapitulatif', name: 'app_order_summary')]
    public function add(Request $request, Cart $cart): Response
    {

        if ($request->getMethod() != 'POST') {
            return $this->redirectToRoute('app_cart');
        }
        $form = $this->createForm(OrderType::class, null, [
            'adresses' =>$this->getUser()->getAddresses() ,

        ]);

        $form-> handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            //dd($form->getData());
            //stocker les infos en base
        }
        return $this->render('order/summary.html.twig', [
            'choices' => $form->getData(),
            'cart' => $cart->getCart(),
            'totalWt' => $cart->getTotalWt(),
        ]);
    }
}
