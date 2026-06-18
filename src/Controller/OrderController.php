<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\OrderDetail;
use App\Form\OrderType;
use Doctrine\ORM\EntityManagerInterface;
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
    public function add(Request $request, Cart $cart, EntityManagerInterface $entityManager): Response
    {

        if ($request->getMethod() != 'POST') {
            return $this->redirectToRoute('app_cart');
        }
        $products = $cart->getCart();

        $form = $this->createForm(OrderType::class, null, [
            'adresses' =>$this->getUser()->getAddresses() ,

        ]);

        $form-> handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            //dd($form->getData());

            //creation de la chaine adresse
            $addressObj =  $form->get('adresses')->getData();
            $address =  $addressObj->getFirstName().' ' . $addressObj->getLastName(). '<br/> ';
            $address .= $addressObj->getAddress(). '<br/> ';
            $address .= $addressObj->getPostal() . ' ' . $addressObj->getCity(). '<br/> ';
            $address .= $addressObj->getCountry(). '<br/> ';
            $address .= $addressObj->getPhone();

            //stocker les infos en base
            $order = new Order();
            $order->setUser($this->getUser());
            $order->setCreatedAt(new \DateTime());
            $order->setState(1);
            $order->setCarrierName($form->get('carriers')->getData()->getName());
            $order->setCarrierPrice($form->get('carriers')->getData()->getPrice());
            $order->setDelivery($address);

            foreach ($products  as $product) {
                  $orderDetail = new OrderDetail();
                  $orderDetail->setProductName($product['object']->getName());
                  $orderDetail->setProductIllustration($product['object']->getIllustration());
                  $orderDetail->setProductPrice($product['object']->getPrice());
                  $orderDetail->setProductQuantity($product['qty']);
                  $orderDetail->setProductTva($product['object']->getTva());
                  $order->addOrderDetail($orderDetail);
            }
            $entityManager->persist($order);
            $entityManager->flush();



        }
        return $this->render('order/summary.html.twig', [
            'choices' => $form->getData(),
            'cart' => $products,
            'totalWt' => $cart->getTotalWt(),
        ]);
    }
}
