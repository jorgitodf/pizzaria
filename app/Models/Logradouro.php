<?php
/**
 * Created by PhpStorm.
 * User: jorgito.paiva
 * Date: 10/02/2017
 * Time: 16:27
 */

namespace App\Models;

use Core\BaseModel;

class Logradouro extends BaseModel
{
    protected $table = "tb_logradouro";
    private $nome_logradouro;

    /**
     * Logradouro constructor.
     * @param $nome_logradouro
     */
    public function __construct($pdo, $nome_logradouro)
    {
        parent::__construct($pdo);
        $this->nome_logradouro = $nome_logradouro;
    }

    public function getTable() {
        return $this->table;
    }

    public function getLogradouros() {
        try {
            $query = "SELECT * FROM {$this->table}";
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $stmt->closeCursor();
            return $result;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }

}