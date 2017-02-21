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
    
    /**
     * @param type $nome_produto
     * @return type
     */
    function setNome_produto($nome_produto) {
        if (Helpers::validaNomeProduto($nome_produto) == true) {
            return Helpers::validaNomeProduto($nome_produto);
        } else {
            $this->nome_produto = $nome_produto;
        }
    }

    /**
     * @param type $descricao
     * @return type
     */
    function setDescricao($descricao) {
        if (Helpers::validaDescricaoProduto($descricao) == true) {
            return Helpers::validaDescricaoProduto($descricao);
        } else {
            $this->descricao = $descricao;
        }
    }

    /**
     * @param string $volume
     */
    function setVolume($volume) {
        if (!empty($volume)) {
            $this->volume = $volume;
        } else {
            $this->volume = "";
        }
    }
    
    /**
     * @param type $tamanho
     * @return type
     */
    function setTamanho($tamanho) {
        if (Helpers::validaTamanhoProduto($tamanho) == true) {
            return Helpers::validaTamanhoProduto($tamanho);
        } else {
            $this->tamanho = $tamanho;
        }
    }

    /**
     * @param type $preco_compra
     * @return type
     */
    function setPreco_compra($preco_compra) {
        if (Helpers::validaPrecoProduto($preco_compra) == true) {
            return Helpers::validaPrecoProduto($preco_compra);
        } else {
            $this->preco_compra = Helpers::formataPreço($preco_compra);
        }
    }
    
    /**
     * @param type $categoria
     * @return type
     */
    public function setId_categoria($categoria) {
        if (Helpers::validaCategoriaProduto($categoria) == true) {
            return Helpers::validaCategoriaProduto($categoria);
        } else {
            $this->idCategoria = $categoria;
        }
    }

    /**
     * @param type $data_compra
     * @return type
     */
    function setData_compra($data_compra) {
        if (Helpers::validaDataCompraProduto($data_compra) == true) {
            return Helpers::validaDataCompraProduto($data_compra);
        } else {
            $this->data_compra = Helpers::formataData($data_compra);
        }
    }
    
    /**
     * @param type $qtd_comprada
     * @return type
     */
    function setQtd_comprada($qtd_comprada) {
        if (Helpers::validaQuantidadeProduto($qtd_comprada) == true) {
            return Helpers::validaQuantidadeProduto($qtd_comprada);
        } else {
            $this->qtd_comprada = $qtd_comprada;
        }
    }

    /**
     * @param type $prod_nome_imagem
     * @return type
     */
    function setProd_nome_imagem($prod_nome_imagem) {
        if (Helpers::validaEnvioImagem($prod_nome_imagem) == true) {
            return Helpers::validaEnvioImagem($prod_nome_imagem);
        } else {
            if ($prod_nome_imagem['type'] == 'image/png') {
                $md5imagem = md5(time().rand(0,9999)).'.png';
            } elseif ($prod_nome_imagem['type'] == 'image/jpeg') {
                $md5imagem = md5(time().rand(0,9999)).'.jpeg';
            } else {
                $md5imagem = md5(time().rand(0,9999)).'.jpg';
            }
            $this->prod_nome_imagem = $md5imagem;
        }
    }
        
    public function getIdCategoria() {
        return $this->idCategoria;
    }

    /**
     * @param type $idCategoria
     * @return boolean
     */
    public function setIdCategoria($idCategoria) {
        if (is_numeric($idCategoria)) {
            $this->idCategoria = $idCategoria;
        } else {
            return false;
        }
    }
    
    /**
     * @param type $categoria
     * @return boolean
     */
    public function getAllProdutosByCategoria($categoria) {
        try {
            if ($categoria->id_categoria == 1) {
                $query = "SELECT pv.id_produto_venda AS id, prod.descricao as descricao, concat(prod.nome_produto,' - ', 
                    prod.tamanho) as produto, prod.volume as vol, pv.preco_venda AS valor, prod.prod_nome_imagem AS imagem, 
                    prod.fk_id_categoria as idCategoria FROM {$this->table} AS prod JOIN tb_produto_venda AS pv ON (prod.id_produto = 
                    pv.fk_id_produto) WHERE pv.ativo = 'true' ORDER BY prod.fk_id_categoria ASC"; 
            } else {
                $query = "SELECT pv.id_produto_venda AS id, prod.descricao as descricao, concat(prod.nome_produto,' - ', prod.tamanho) 
                    as produto, prod.volume as vol, pv.preco_venda AS valor, prod.prod_nome_imagem AS imagem, prod.fk_id_categoria as 
                    idCategoria FROM {$this->table} AS prod JOIN tb_produto_venda AS pv ON (prod.id_produto = pv.fk_id_produto) 
                    WHERE prod.fk_id_categoria = ? AND pv.ativo = 'true'";
            }
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

    /**
     * @return int
     */
    public function cadastrarProduto() {
        try {
            $this->pdo->beginTransaction();
            $query = "INSERT INTO {$this->table} (nome_produto, descricao, volume, tamanho, preco_compra, data_compra, "
                . "qtd_comprada, prod_nome_imagem, fk_id_categoria) VALUES (?,?,?,?,?,?,?,?,?)";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->nome_produto, PDO::PARAM_STR);
            $stmt->bindValue(2, $this->descricao, PDO::PARAM_STR);
            $stmt->bindValue(3, $this->volume, PDO::PARAM_STR);
            $stmt->bindValue(4, $this->tamanho, PDO::PARAM_STR);
            $stmt->bindValue(5, $this->preco_compra, PDO::PARAM_STR);
            $stmt->bindValue(6, $this->data_compra, PDO::PARAM_STR);
            $stmt->bindValue(7, $this->qtd_comprada, PDO::PARAM_INT);
            $stmt->bindValue(8, $this->prod_nome_imagem, PDO::PARAM_STR);
            $stmt->bindValue(9, $this->idCategoria, PDO::PARAM_INT);
            $stmt->execute();
            $id = $this->pdo->lastInsertId();
            $query = "CALL sp_atualiza_estoque_produtos(?)";
            $stmtP = $this->pdo->prepare($query);
            $stmtP->bindValue(1, $id, PDO::PARAM_INT);
            $stmtP->execute();
            $this->pdo->commit();
            return 1;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            if ($exc->getCode() == '42S02') {
                return "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            } else {
                return $exc->getMessage();
            }
        } 
    }
    
    public function getProdutoById($id_produto) {
        try {
            $this->pdo->beginTransaction();
            $query = "SELECT pv.id_produto_venda AS id, CONCAT(prod.nome_produto,' - ', prod.tamanho) AS prod, pv.preco_venda AS 
                valor FROM tb_produto_venda AS pv JOIN {$this->table} AS prod ON (prod.id_produto = pv.fk_id_produto) WHERE 
                pv.fk_id_produto = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $id_produto, PDO::PARAM_INT);
            $stmt->execute();
            $this->pdo->commit();
            $result = $stmt->fetch();
            $stmt->closeCursor();
            return $result;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            if ($exc->getCode() == '42S02') {
                return "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            } else {
                return $exc->getMessage();
            }
        } 
    }
    
}
