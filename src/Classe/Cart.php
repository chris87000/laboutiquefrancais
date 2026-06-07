<?php
namespace App\Classe;
use App\Entity\Product;
use Symfony\Component\HttpFoundation\RequestStack;

class Cart{

    public function __construct(private RequestStack $requestStack){

    }
    public function add($product): void
    {
        // appel symfony session
        //$session = $this->requestStack->getSession();
        $cart = $this->requestStack->getSession()->get('cart');

        if(isset($cart[$product->getId()])) {
            $cart[$product->getId()] = [
                'object' => $product,
                'qty' => $cart[$product->getId()]['qty'] + 1
            ];
        }else{
            $cart[$product->getId()] = [
                'object' => $product,
                'qty' => 1
            ];
        }
        $this->requestStack->getSession()->set('cart', $cart);
        //dd($this->requestStack->getSession()->get('cart'));
    }

    public function decrease($id): void
    {
        $cart = $this->requestStack->getSession()->get('cart');

        if($cart[$id]['qty'] > 1){
            $cart[$id]['qty'] =  $cart[$id]['qty']  -1;
        }else{
            unset($cart[$id]);
        }

        $this->requestStack->getSession()->set('cart', $cart);
    }

    public function getCart(){
        return $this->requestStack->getSession()->get('cart');
    }

    public function remove(){
        return $this->requestStack->getSession()->remove('cart');
    }

    public function fullQuantity(){
        $quantity = 0;
        $cart = $this->requestStack->getSession()->get('cart');
        if(!isset($cart)){
            return $quantity;
        }
        foreach($cart as $product){
            $quantity += $product['qty'];
        }

        return $quantity;
    }

    public function getTotalWt(): int
    {
        $price = 0;
        $cart = $this->requestStack->getSession()->get('cart');
        if(!isset($cart)){
            return $price;
        }
        foreach($cart as $product){
          $price += $product['object']->getPriceWt() * $product['qty'];
        }
        return $price;
    }
}