<?php

namespace App\Controller;

use App\Model\AtelierManager;
use App\Model\PlaneteManager;
use App\Model\ImageManager;

class AtelierController extends AbstractController
{
    public function read($id)
    {
        $atelierManager = new AtelierManager();
        $imagesManager = new ImageManager();
        $atelier = $atelierManager->selectOneById($id);
        $images = $imagesManager->selectImagesByAtelierId($id);

        return $this->twig->render('Atelier/browse.html.twig', ['atelier' => $atelier, 'images' => $images]);
    }
    public function add()
    {

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $imageDir = realpath("./") . "/assets/images/";

            $image = basename($_FILES['image']['name']);
            $uploadFile = $imageDir . $image;
            move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile);

            $planeteImage = basename($_FILES['planete_image']['name']);
            $uploadPlaneteFile = $imageDir . $planeteImage;
            move_uploaded_file($_FILES['planete_image']['tmp_name'], $uploadPlaneteFile);

            $planete = [
                'name' => $_POST['name'],
                'image' => $planeteImage
            ];
            $planeteManager = new PlaneteManager();
            $planeteId = $planeteManager->insert($planete);

            $atelier = [
                'name' => $_POST['name'],
                'description' => $_POST['description'],
                'planete_id' => $planeteId
            ];
            $atelierManager = new AtelierManager();
            $atelierId = $atelierManager->insert($atelier);

            $image = [
                'image' => $image,
                'atelier_id' => $atelierId
            ];
            $imageManager = new ImageManager();
            $imageManager->insert($image);
        }
        return $this->twig->render('Atelier/add.html.twig');
    }
}
