<?php

namespace App\Model;

class PlaneteManager extends AbstractManager
{
    private const TABLE = 'planete';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function insert(array $planete)
    {
        // prepared request
        $statement = $this->pdo->prepare(
            "INSERT INTO " . self::TABLE .
            " (`name`, `image`) VALUES (:name, :image)"
        );
        $statement->bindValue('name', $planete['name'], \PDO::PARAM_STR);
        $statement->bindValue('image', $planete['image'], \PDO::PARAM_STR);

        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
    }
}
