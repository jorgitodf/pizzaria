<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;

class Cliente extends BaseModel {
    
    protected $table = "tb_cliente";

    public function __construct($pdo) {
        parent::__construct($pdo);        
    }
    
    public function getTable() {
        return $this->table;
    }
    
    public function getAllClientes() {
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
