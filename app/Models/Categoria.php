<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;
use PDO;

class Categoria extends BaseModel {

    protected $table = "tb_categoria";
    private $categoria;
    
    /**
     * Categoria constructor.
     * @param $categoria
     */
    public function __construct($pdo, $categoria) {
        parent::__construct($pdo);
        $this->categoria = $categoria;
    }
    
    public function getTable() {
        return $this->table;
    }

    public function getAllCategorias() {
        try {
            $query = "SELECT * FROM {$this->table}";
            $stmt = $this->pdo->prepare($query);
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
    
    public function getCategoriaById($idCategoria) {
        try {
            $query = "SELECT * FROM {$this->table} WHERE id_categoria = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $idCategoria, PDO::PARAM_STR);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $result = $stmt->fetch();
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
