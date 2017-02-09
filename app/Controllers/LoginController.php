<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;

class LoginController extends BaseController {

    protected $modelLogin;

    public function __construct() {
        parent::__construct();  
        $this->modelLogin = Container::getModel("Login");
    }
    
    public function index() {
        $this->setPageTitle('Login');
        if (isset($_POST['email']) &&  isset($_POST['senha'])) {
            $email = trim(addslashes(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_STRING)));
            $senha = trim(addslashes(filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING)));
            if ($this->modelLogin->setEmail($email)['erroEmail'] == true) {
                $this->view->retornoEmail = $this->modelLogin->setEmail($email);
            } elseif ($this->modelLogin->setEmail($email)['erroSemCadastro'] == true) {
                $this->view->erro = $this->modelLogin->setEmail($email);
            } else {
                $this->view->email = $this->modelLogin->getEmail();
            }
            if ($this->modelLogin->setSenha($senha)['erroSenha'] == true) {
                $this->view->retornoSenha = $this->modelLogin->setSenha($senha);
            } elseif ($this->modelLogin->setSenha($senha)['erroSenhaNaoConfere'] == true) {
                $this->view->erro = $this->modelLogin->setSenha($senha);
            } else {
                $this->view->senha = $this->modelLogin->getSenha();
            }
            if ($this->modelLogin->setEmail($email) == false && $this->modelLogin->setSenha($senha) == false) {
                echo "Efetuar o Login com Sessão do Usuário no Sistema";exit;
            }
        }
        $this->renderView('login/login', 'layout');
    }
    
    public function logout() {
        unset($_SESSION['ccUser']);
        Redirect::route('/home');
    }

}
