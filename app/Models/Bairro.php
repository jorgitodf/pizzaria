<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;
use Core\Helpers;

class Bairro extends BaseModel
{
    protected $table = "tb_bairro";
    private $nome_bairro;
    private $idBairro;
    private $bairro = array();

    /**
     * Bairro constructor.
     * @param $nome_bairro
     */
    public function __construct($pdo, $nome_bairro)
    {
        parent::__construct($pdo);
        $this->nome_bairro = $nome_bairro;
    }
    
    public function getTable() {
        return $this->table;
    }
    
    /**
     * @param type $id
     * @return type
     */
    public function setBairro($id) {
        $this->idBairro = $id;
        try {
            $query = "SELECT * FROM {$this->table} WHERE id_bairro = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->idBairro, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $this->bairro = $stmt->fetch();
                $stmt->closeCursor();
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function getBairroCidade() {
        if (isset($this->bairro)) {
            return $this->bairro;
        } else {
            return false;
        }
    }
    
    
    public function getBairrosByIdCidade($idCidade) {
        try {
            $query = "SELECT id_bairro, nome_bairro FROM {$this->table} WHERE fk_id_cidade = ? ORDER BY nome_bairro ASC";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $idCidade, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();
                $stmt->closeCursor();
                return $result;
            } else {
                return false;
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function getNome_bairro() {
        return $this->nome_bairro;
    }

    public function setNome_bairro($nome_bairro) {
        if (Helpers::validaBairro($nome_bairro)) {
            return Helpers::validaBairro($nome_bairro);
        } else {
            $this->nome_bairro = $nome_bairro;
        }
    }


}