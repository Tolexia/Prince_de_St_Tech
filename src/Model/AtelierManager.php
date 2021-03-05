<?php

namespace App\Model;

class AtelierManager extends AbstractManager
{
    private const TABLE = 'atelier';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    /**
     * @param array $atelier
     */
    public function insert(array $atelier)
    {
        // prepared request
        $statement = $this->pdo->prepare(
            "INSERT INTO " . self::TABLE .
            " (`name`, `description`, `planete_id`) VALUES (:name, :description, :planete_id)"
        );
        $statement->bindValue('name', $atelier['name'], \PDO::PARAM_STR);
        $statement->bindValue('description', $atelier['description'], \PDO::PARAM_STR);
        $statement->bindValue('planete_id', $atelier['planete_id'], \PDO::PARAM_INT);

        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
    }
}
