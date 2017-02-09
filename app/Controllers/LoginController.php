<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;

class LoginController extends BaseController {

    protected $modelCliente;
    
    public function __construct() {
        parent::__construct();  
        $this->modelCliente = Container::getModel("Cliente");
    }
    
    public function index() {
        $this->setPageTitle('Login');
        if (isset($_POST['email']) &&  isset($_POST['senha'])) {
            $email = trim(addslashes(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_STRING)));
            $senha = trim(addslashes(filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING)));
            if ($this->modelCliente->setEmail($email)['erroEmail'] == true) {
                $this->view->retornoEmail = $this->modelCliente->setEmail($email);
            } else {
                $this->view->email = $this->modelCliente->getEmail();
            }
            if ($this->modelCliente->setSenha($senha)['erroSenha'] == true) {
                $this->view->retornoSenha = $this->modelCliente->setSenha($senha);
            } else {
                $this->view->senha = $this->modelCliente->getSenha();
            }
            if ($this->modelCliente->setEmail($email)['erroEmail'] == false && $this->modelCliente->setSenha($senha)['erroSenha'] == false) {
                $this->view->erro = $this->modelCliente->verificaExisteEmail($this->modelCliente->getEmail());
            }
            $this->modelCliente->getSenha();
        }
        $this->renderView('login/login', 'layout');
    }
    
    public function logout() {
        unset($_SESSION['ccUser']);
        Redirect::route('/home');
    }

}
