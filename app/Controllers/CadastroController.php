<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Helpers;
use App\Models\Uf;
use App\Models\Logradouro;
use App\Models\Endereco;
use App\Models\Bairro;
use App\Models\Cliente;
use Core\DataBase;

class CadastroController extends BaseController {

    protected $modelCliente;
    protected $modelLogradouro;
    protected $modelEndereco;
    protected $modelBairro;
    protected $modelUf;

    /**
     * CadastroController constructor.
     */
    public function __construct() {
        parent::__construct();
        $this->modelCliente = new Cliente(DataBase::getConexao());
        $this->modelLogradouro = new Logradouro(DataBase::getConexao());
        $this->modelEndereco = new Endereco(DataBase::getConexao());
        $this->modelBairro = new Bairro(DataBase::getConexao());
        $this->modelUf = new Uf(DataBase::getConexao());
    }

    public function index() {
        $this->setPageTitle('Cadastro');
        if (isset($_POST['nome']) && isset($_POST['email']) &&  isset($_POST['senha'])) {
            $nome = trim(addslashes(filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_STRING)));
            $email = trim(addslashes(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_STRING)));
            $senha = trim(addslashes(filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING)));
            $senha_confirm = trim(addslashes(filter_input(INPUT_POST, 'senha_confirm', FILTER_SANITIZE_STRING)));
            if ($this->modelCliente->setNomeCompleto($nome)['erroNome'] == true) {
                $this->view->retornoNomeCompleto = $this->modelCliente->setNomeCompleto($nome);
            } else if ($this->modelCliente->setNomeCompleto($nome)['erroNomeNumero'] == true) {
                $this->view->retornoNomeCompleto = $this->modelCliente->setNomeCompleto($nome);
            } else {
                $this->view->nomeCompleto = $this->modelCliente->getNomeCompleto();
            }
            if ($this->modelCliente->setEmail($email)['erroEmail'] == true) {
                $this->view->retornoEmail = $this->modelCliente->setEmail($email);
            } else if ($this->modelCliente->setEmail($email)['emailExiste'] == true) {
                $this->view->retornoEmailExiste = $this->modelCliente->setEmail($email);
            } else {
                $this->view->email = $this->modelCliente->getEmail();
            }
            if ($this->modelCliente->setSenha($senha)['erroSenha'] == true) {
                $this->view->retornoSenha = $this->modelCliente->setSenha($senha);
            } else {
                $this->view->senha = $this->modelCliente->getSenha();
            }
            if (Helpers::validaConfirmaSenha($senha, $senha_confirm)['erroSenha2'] == true) {
                $this->view->retornoSenhaConfirm = Helpers::validaConfirmaSenha($senha, $senha_confirm);
            } else {
                $this->view->senhaConfirm = $senha_confirm;
            }
            if ($this->modelCliente->setNomeCompleto($nome)['erroNome'] == false && $this->modelCliente->setNomeCompleto($nome)['erroNomeNumero'] == false
                && $this->modelCliente->setEmail($email)['erroEmail'] == false && $this->modelCliente->setEmail($email)['emailExiste'] == false &&
                $this->modelCliente->setSenha($senha)['erroSenha'] == false &&
                Helpers::validaConfirmaSenha($senha, $senha_confirm)['erroSenha2'] == false) {
                if ($this->modelCliente->addCliente() == 1) {
                    $this->view->sucesso = "Dados Cadastrados com Sucesso!";
                } else {
                    $this->view->erroCad = $this->modelCliente->addCliente();
                }
            }

        }
        $this->renderView('cadastro/index', 'layout', 'menu');        
    }

    public function cadastrarEndereco() {
        if($_POST) {
            $idCidade = filter_input(INPUT_POST, 'nome_cidade');
            $idUf = filter_input(INPUT_POST, 'sigla_uf');
            $logradouro = filter_input(INPUT_POST, 'logradouro');
            $complemento = trim(addslashes(filter_input(INPUT_POST, 'complemento')));
            $numero = trim(addslashes(filter_input(INPUT_POST, 'numero')));
            $cep = trim(addslashes(filter_input(INPUT_POST, 'cep', FILTER_SANITIZE_STRING)));
            $bairro = trim(addslashes(filter_input(INPUT_POST, 'bairro', FILTER_SANITIZE_STRING))) ;
            $tipoEndereco = filter_input(INPUT_POST, 'tipoEndereco');
            if ($this->modelEndereco->setUf($idUf)) {
                $json = $this->modelEndereco->setUf($idUf);
            } elseif($this->modelEndereco->setCidade($idCidade)) {
                $json = $this->modelEndereco->setCidade($idCidade);
            } elseif($this->modelEndereco->setLogradouroCad($logradouro)) {
                $json = $this->modelEndereco->setLogradouroCad($logradouro);
            } elseif($this->modelEndereco->setComplemento($complemento)) {
                $json = $this->modelEndereco->setComplemento($complemento);
            } elseif($this->modelEndereco->setNumero($numero)) {
                $json = $this->modelEndereco->setNumero($numero);
            } elseif($this->modelEndereco->setCep($cep)) {
                $json = $this->modelEndereco->setCep($cep);
            } elseif($this->modelEndereco->setBairro($bairro)) {
                $json = $this->modelEndereco->setBairro($bairro);
            } elseif($this->modelEndereco->setTipoEndereco($tipoEndereco)) {
                $json = $this->modelEndereco->setTipoEndereco($tipoEndereco);
            } else {
                $this->modelCliente->setLoggedUser();
                $idCliente = $this->modelCliente->getUserInfo()->id_cliente;
                if ($this->modelEndereco->cadastrarEndereco($idCliente) === 1) {
                    $json = array('status' => 'success', 'message' => 'Endereço Cadastrado com Sucesso!');
                } else {
                    $json = array('status' => 'error', 'message' => 'Já existe um Bairro com este nome!');
                }
            }
            echo json_encode($json);
        } else {
            $this->setPageTitle('Endereço');
            $this->view->ufs = $this->modelUf->getAllUf();
            $this->view->lograrouros = $this->modelLogradouro->getLogradouros();
            $this->renderView('endereco/index', 'layout', 'menu');
        }
    }
    
    
    public function cadastrarBairro() {
        if($_POST) {
            $idCidade = filter_input(INPUT_POST, 'nome_cidade');
            $idUf = filter_input(INPUT_POST, 'sigla_uf');
            $nome_bairro = trim(addslashes(filter_input(INPUT_POST, 'nome_bairro', FILTER_SANITIZE_STRING))) ;
            if ($this->modelEndereco->setUf($idUf)) {
                $json = $this->modelEndereco->setUf($idUf);
            } elseif($this->modelEndereco->setCidade($idCidade)) {
                $json = $this->modelEndereco->setCidade($idCidade);
            } elseif ($this->modelBairro->setNome_bairro($nome_bairro)) {
                $json = $this->modelBairro->setNome_bairro($nome_bairro);
            } else {
                if ($this->modelBairro->cadastrarNovoBairro($this->modelBairro->getNome_bairro(), $this->modelEndereco->getCidade())) {
                    $json = array('status' => 'success', 'message' => 'Bairro Cadastrado com Sucesso!');
                } else {
                    $json = array('status' => 'error', 'message' => 'Já existe um Bairro com este nome!');
                }
            }
            echo json_encode($json);
        }
    }
    
}
