<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;
use PDO;

class Produtos extends BaseModel {
    
    protected $table = "tb_produto";
    private $nome_produto;
    private $descricao;
    private $volume;
    private $tamanho;
    private $preco_compra;
    private $qtd_estoque;
    private $valor;
    private $idCategoria;
    
    /**
     * Produtos constructor
     * @param type $pdo
     * @param type $nome_produto
     * @param type $descricao
     * @param type $volume
     * @param type $tamanho
     * @param type $preco_compra
     * @param type $qtd_estoque
     * @param type $valor
     * @param type $idCategoria
     */
    public function __construct($pdo, $nome_produto, $descricao, $volume, $tamanho, $preco_compra, $qtd_estoque, $valor, $idCategoria) {
        parent::__construct($pdo);
        $this->nome_produto = $nome_produto;
        $this->descricao = $descricao;
        $this->volume = $volume;
        $this->tamanho = $tamanho;
        $this->preco_compra = $preco_compra;
        $this->qtd_estoque = $qtd_estoque;
        $this->valor = $valor;
        $this->idCategoria = $idCategoria;
    }
    
    public function getTable() {
        return $this->table;
    }
    
    public function getIdCategoria() {
        return $this->idCategoria;
    }

    public function setIdCategoria($idCategoria) {
        if (is_numeric($idCategoria)) {
            $this->idCategoria = $idCategoria;
        } else {
            return false;
        }
    }
    
    public function getAllProdutosByCategoria($categoria) {
        try {
            $query = "SELECT prod.id_produto as id, prod.descricao as descricao, concat(prod.nome_produto,' - ', prod.tamanho) as produto, prod.volume as vol, "
                    . "prod.qtd_estoque as qtd, prod.valor as valor, prod.fk_id_categoria as idCategoria FROM {$this->table} as prod "
                    . "WHERE fk_id_categoria = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $categoria->id_categoria, PDO::PARAM_INT);
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
                return "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            } else {
                return $exc->getMessage();
            }
        }
    }


    
}
