<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;
use PDO;
use Core\Helpers;

class Produtos extends BaseModel {
    
    protected $table = "tb_produto";
    private $nome_produto;
    private $descricao;
    private $volume;
    private $tamanho;
    private $preco_compra;
    private $data_compra;
    private $qtd_comprada;
    private $prod_nome_imagem;
    private $idCategoria;
    
    /**
     * 
     * @param type $pdo
     * @param type $nome_produto
     * @param type $descricao
     * @param type $volume
     * @param type $tamanho
     * @param type $preco_compra
     * @param type $data_compra
     * @param type $qtd_comprada
     * @param type $prod_nome_imagem
     * @param type $idCategoria
     */
    public function __construct($pdo, $nome_produto, $descricao, $volume, $tamanho, $preco_compra, $data_compra, $qtd_comprada, $prod_nome_imagem, $idCategoria) {
        parent::__construct($pdo);
        $this->nome_produto = $nome_produto;
        $this->descricao = $descricao;
        $this->volume = $volume;
        $this->tamanho = $tamanho;
        $this->preco_compra = $preco_compra;
        $this->data_compra = $data_compra;
        $this->qtd_comprada = $qtd_comprada;
        $this->prod_nome_imagem = $prod_nome_imagem;
        $this->idCategoria = $idCategoria;
    }
    
    public function getTable() {
        return $this->table;
    }
    
    function getNome_produto() {
        return $this->nome_produto;
    }

    function getDescricao() {
        return $this->descricao;
    }

    function getVolume() {
        return $this->volume;
    }

    function getTamanho() {
        return $this->tamanho;
    }

    function getPreco_compra() {
        return $this->preco_compra;
    }

    function getData_compra() {
        return $this->data_compra;
    }

    function getQtd_comprada() {
        return $this->qtd_comprada;
    }

    function getProd_nome_imagem() {
        return $this->prod_nome_imagem;
    }

    function setNome_produto($nome_produto) {
        if (Helpers::validaNomeProduto($nome_produto) == true) {
            return Helpers::validaNomeProduto($nome_produto);
        } else {
            $this->nome_produto = $nome_produto;
        }
    }

    function setDescricao($descricao) {
        if (Helpers::validaDescricaoProduto($descricao) == true) {
            return Helpers::validaDescricaoProduto($descricao);
        } else {
            $this->descricao = $descricao;
        }
    }

    function setVolume($volume) {
        $this->volume = $volume;
    }

    function setTamanho($tamanho) {
        if (Helpers::validaTamanhoProduto($tamanho) == true) {
            return Helpers::validaTamanhoProduto($tamanho);
        } else {
            $this->tamanho = $tamanho;
        }
    }

    function setPreco_compra($preco_compra) {
        if (Helpers::validaPrecoProduto($preco_compra) == true) {
            return Helpers::validaPrecoProduto($preco_compra);
        } else {
            $this->preco_compra = Helpers::formataPreço($preco_compra);
        }
    }
    
    public function setId_categoria($categoria) {
        if (Helpers::validaCategoriaProduto($categoria) == true) {
            return Helpers::validaCategoriaProduto($categoria);
        } else {
            $this->idCategoria = $categoria;
        }
    }

    function setData_compra($data_compra) {
        $this->data_compra = $data_compra;
    }

    function setQtd_comprada($qtd_comprada) {
        if (Helpers::validaQuantidadeProduto($qtd_comprada) == true) {
            return Helpers::validaQuantidadeProduto($qtd_comprada);
        } else {
            $this->qtd_comprada = $qtd_comprada;
        }
    }

    function setProd_nome_imagem($prod_nome_imagem) {
        $this->prod_nome_imagem = $prod_nome_imagem;
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
                    . "prod.qtd_estoque as qtd, prod.valor as valor, prod.prod_nome_imagem as imagem, prod.fk_id_categoria as idCategoria FROM {$this->table} as prod "
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
