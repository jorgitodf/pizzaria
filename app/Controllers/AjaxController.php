<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;
use App\Models\Cidade;
use App\Models\Bairro;
use App\Models\Categoria;
use App\Models\Produtos;
use Core\DataBase;

class AjaxController extends BaseController {
    
    protected $modelCidade;
    protected $modelCliente;
    protected $modelBairro;
    protected $modelCategoria;
    protected $modelProdutos;
    
    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
        $this->modelCidade = new Cidade(DataBase::getConexao());
        $this->modelBairro = new Bairro(DataBase::getConexao());
        $this->modelCategoria = new Categoria(DataBase::getConexao());
        $this->modelProdutos = new Produtos(DataBase::getConexao());
        if ($this->modelCliente->isLogged() == false) {
            Redirect::route('/login');
            exit;
        }
    }
    
    public function index() {
        
    }
    
    public function buscarUf() {
        if (isset($_POST['sigla_uf'])) {
            $idUf = (int) filter_input(INPUT_POST, 'sigla_uf', FILTER_SANITIZE_NUMBER_INT);
            if (empty($idUf) || $idUf == 0) {
                $json = array('status' => 'error', 'message' => 'Selecione uma UF');
            } elseif ($this->modelCidade->getCidadesByIdUf($idUf) != false) {
                $json = array('status' => 'success', 'message' => $this->modelCidade->getCidadesByIdUf($idUf));
            } else {
                $json = array('status' => 'error', 'message' => 'A Tabela de Cidades dessa UF está vazia');
            }
            echo json_encode($json);
        }
    }
    
    public function buscarCidade() {
        if (isset($_POST['nome_cidade'])) {
            $idCidade = (int) filter_input(INPUT_POST, 'nome_cidade', FILTER_SANITIZE_NUMBER_INT);
            if (empty($idCidade) || $idCidade == 0) {
                $json = array('status' => 'error', 'message' => 'Selecione uma Cidade');
            } elseif ($this->modelBairro->getBairrosByIdCidade($idCidade) != false) {
                $json = array('status' => 'success', 'message' => $this->modelBairro->getBairrosByIdCidade($idCidade));
            } else {
                //$json = array('status' => 'error', 'message' => 'Adicione o Bairro clicando no + acima!');
            }
            echo json_encode($json);
        }
    }
    
    public function buscarMenu() {
        if (isset($_POST['buscar_menu'])) {
           if ($this->modelCategoria->getAllCategorias() == true) {
               $json = array('status' => 'success', 'message' => $this->modelCategoria->getAllCategorias());
           } else {
               $json = array('status' => 'error', 'message' => 'Categoria Vazia');
           }
           echo json_encode($json);
        }
    }
    
    public function buscarProdutosByCategoria() {
        if (isset($_POST['menu'])) {
           $idCategoria = (int) filter_input(INPUT_POST, 'menu', FILTER_SANITIZE_NUMBER_INT); 
           $categoria = $this->modelCategoria->getCategoriaById($idCategoria);
           if ($this->modelProdutos->getAllProdutosByCategoria($categoria) == true) {
               $json = array('status' => 'success', 'message' => $this->modelProdutos->getAllProdutosByCategoria($categoria));
           } else {
               $json = array('status' => 'error', 'message' => false);
           }
           echo json_encode($json);
        }
    }

}
