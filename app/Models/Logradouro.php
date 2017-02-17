<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;


class Logradouro extends BaseModel
{
    protected $table = "tb_logradouro";
    private $nome_logradouro;
    private $idLogradouro;
    private $logradouro = array();

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

    /**
     * @return type
     */
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
    
    /**
     * @param type $id
     * @return type
     */
    public function setLogradouro($id) {
        $this->idLogradouro = $id;
        try {
            $query = "SELECT * FROM {$this->table} WHERE id_logradouro = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->idLogradouro, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $this->logradouro = $stmt->fetch();
                $stmt->closeCursor();
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function getLogradouroBairro() {
        if (isset($this->logradouro)) {
            return $this->logradouro;
        } else {
            return false;
        }
    }
}