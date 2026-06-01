<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Produit')
            ->setEntityLabelInPlural('Produits')  ;
    }

    public function configureFields(string $pageName): iterable
    {
        $required = true;
        if($pageName == 'edit'){
            $required = false;
        }
        return [
            IdField::new('id')->setLabel('Id')->onlyOnIndex(),
            TextField::new('name', 'Nom')->setLabel('Nom du produit')->setHelp('Nom du produit'),
            SlugField::new('slug')->setTargetFieldName('name')->setLabel('URL d\'accès au produit')->setHelp('URL d\'accès au produit'),
            TextEditorField::new('description', 'Description')->setHelp('Description du produit'),
            ImageField::new('illustration', 'Image')->setHelp('Image du produit en 600*600px')
                ->setUploadedFileNamePattern('[year]-[month]-[day]-[contenthash].[extension]')
                ->setUploadDir('public/uploads')
                ->setBasePath('/uploads')
                ->setRequired($required),
            NumberField::new('price', 'Prix HT')->setHelp('Prix Hors Taxe sans le signe €'),
            ChoiceField::new('tva', 'Taux de TVA')->setChoices([
                '5,5%'=>'5.5',
                '10,10%'=>'10',
                '20%'=>'20',
            ]),
            AssociationField::new('category', 'Catégories associées')
        ];
    }

}
