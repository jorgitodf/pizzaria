<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;

class Uf extends BaseModel
{
    protected $table = "tb_uf";
    private $sigla_uf;
    private $idUf;
    private $uf = array();

    /**
     * Uf constructor.
     * @param $sigla_uf
     */
    public function __construct($pdo, $sigla_uf)
    {
        parent::__construct($pdo);
        $this->sigla_uf = $sigla_uf;
    }

    public function getTable() {
        return $this->table;
    }
    
    /**
     * @param type $id
     * @return type
     */
    public function setUf($id) {
        $this->idUf = $id;
        try {
            $query = "SELECT id_uf, sigla_uf FROM {$this->table} WHERE id_uf = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->idUf, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $this->uf = $stmt->fetch();
                $stmt->closeCursor();
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }

    public function getUfCidade() {
        if (isset($this->uf)) {
            return $this->uf;
        } else {
            return false;
        }
    }
    
    public function getAllUf() {
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