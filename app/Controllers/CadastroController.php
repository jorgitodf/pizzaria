<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;
use Core\Helpers;

class CadastroController extends BaseController {

    protected $modelCliente;

    /**
     * CadastroController constructor.
     */
    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
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
                    $this->view->erroCad =  $this->modelCliente->addCliente();
                }
            }

        }
        $this->renderView('cadastro/index', 'layout');        
    }

}
