<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;

class Cidade extends BaseModel
{
    protected $table = "tb_cidade";
    private $nome_cidade;
    private $idCidade;
    private $cidade = array();

    /**
     * Cidade constructor.
     * @param $nome_cidade
     */
    public function __construct($pdo, $nome_cidade)
    {
        parent::__construct($pdo);
        $this->nome_cidade = $nome_cidade;
    }

    public function getTable() {
        return $this->table;
    }
    
    /**
     * @param type $id
     * @return type
     */
    public function setCidade($id) {
        $this->idCidade = $id;
        try {
            $query = "SELECT * FROM {$this->table} WHERE id_cidade = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->idCidade, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $this->cidade = $stmt->fetch();
                $stmt->closeCursor();
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function getCidadeBairro() {
        if (isset($this->cidade)) {
            return $this->cidade;
        } else {
            return false;
        }
    }
    
    public function getCidadesByIdUf($idUf) {
        try {
            $query = "SELECT id_cidade, nome_cidade FROM {$this->table} WHERE fk_id_uf = ? ORDER BY nome_cidade ASC";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $idUf, PDO::PARAM_INT);
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
}