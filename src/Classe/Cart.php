<?php
namespace App\Classe;
use App\Entity\Product;
use Symfony\Component\HttpFoundation\RequestStack;

class Cart{

    public function __construct(private RequestStack $requestStack){

    }
    public function add($product)
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
    public function getCart(){
        return $this->requestStack->getSession()->get('cart');
    }

    public function remove(){
        return $this->requestStack->getSession()->remove('cart');
    }
}