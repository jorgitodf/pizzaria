<?php

namespace App\Controllers;

use Core\BaseController;
use Core\DataBase;
use App\Models\Cliente;
use App\Models\Produtos;

class ProdutoController extends BaseController {
    
    protected $modelCliente;
    protected $modelProdutos;
    
    public function __construct() {
        parent::__construct();
        $this->modelCliente = new Cliente(DataBase::getConexao());
        $this->modelProdutos = new Produtos(DataBase::getConexao());
        if ($this->modelCliente->isLogged() == false) {
            Redirect::route('/login');
            exit;
        }
    }
    
    public function index() {
        $this->setPageTitle('Produtos');
        $this->modelCliente->setLoggedUser();
        $this->modelCliente->getUserInfo();
        if ($this->modelCliente->getGrupoCliente()->nome_grupo == 'Admin') {
            $this->view->permissao = 'Admin';
            $this->renderView('produtos/index', 'layout', 'menu');
        }  
    }
    
    public function cadastrar() {
        $this->setPageTitle('Produtos - Cadastrar');
        $this->modelCliente->setLoggedUser();
        $this->modelCliente->getUserInfo();
        if ($this->modelCliente->getGrupoCliente()->nome_grupo == 'Admin') {
            $this->view->permissao = 'Admin';
            $nome_produto = trim(addslashes(filter_input(INPUT_POST, 'nome_produto')));
            $descricao_produto = trim(addslashes(filter_input(INPUT_POST, 'descricao_produto')));
            $volume = trim(addslashes(filter_input(INPUT_POST, 'volume')));
            $tamanho = trim(addslashes(filter_input(INPUT_POST, 'tamanho')));
            $preco_compra = trim(addslashes(filter_input(INPUT_POST, 'preco_compra')));
            $quantidade = trim(addslashes(filter_input(INPUT_POST, 'quantidade', FILTER_SANITIZE_NUMBER_INT)));
            $categoria = trim(addslashes(filter_input(INPUT_POST, 'categoria')));
            $imagem = trim(addslashes(filter_input(INPUT_POST, 'imagem')));
            if ($this->modelProdutos->setNome_produto($nome_produto)) {
                $json = $this->modelProdutos->setNome_produto($nome_produto);
            } elseif ($this->modelProdutos->setDescricao($descricao_produto)) {
                $json = $this->modelProdutos->setDescricao($descricao_produto);
            } elseif ($this->modelProdutos->setTamanho($tamanho)) {
                $json = $this->modelProdutos->setTamanho($tamanho);
            } elseif ($this->modelProdutos->setPreco_compra($preco_compra)) {
                $json = $this->modelProdutos->setPreco_compra($preco_compra);
            } elseif ($this->modelProdutos->setQtd_comprada($quantidade)) {
                $json = $this->modelProdutos->setQtd_comprada($quantidade);
            } elseif ($this->modelProdutos->setId_categoria($categoria)) {
                $json = $this->modelProdutos->setId_categoria($categoria);
            } else {

            }
            echo json_encode($json);
        }  
    }

}
