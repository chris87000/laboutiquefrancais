<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class RegisterUserTest extends WebTestCase
{
    public function testSomething(): void
    {
        $client = static::createClient();
        $client->request('GET', '/inscription');
        $client->submitForm('Valider',[
            'register_user[email]' => 'julie@example.fr',
             'register_user[plainPassword][first]' => '123456'   ,
            'register_user[plainPassword][second]' => '123456',
            'register_user[firstname]' =>'Julie',
            'register_user[lastname]' => 'Doe'
        ]);
        //follow
        $this->assertResponseRedirects('/connexion');
        $client->followRedirect();
        $this->assertSelectorExists('div:contains("Votre compte a été créé, vous pouvez vous connecter.")');


    }
}
