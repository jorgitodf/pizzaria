<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;

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
    
    
}