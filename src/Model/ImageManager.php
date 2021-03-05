<?php

namespace App\Model;

class ImageManager extends AbstractManager
{
    private const TABLE = 'image';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectImagesByAtelierId(int $id)
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM $this->table 
        JOIN atelier ON image.atelier_id=atelier.id
        WHERE atelier_id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }

    public function insert(array $image)
    {
        // prepared request
        $statement = $this->pdo->prepare(
            "INSERT INTO " . self::TABLE .
            "(`image`, `atelier_id`) VALUES (:image, :atelier_id)"
        );
        $statement->bindValue('image', $image['image'], \PDO::PARAM_STR);
        $statement->bindValue('atelier_id', $image['atelier_id'], \PDO::PARAM_INT);

        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
    }
}
