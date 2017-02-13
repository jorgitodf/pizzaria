<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;
use Core\Redirect;

class HomeController extends BaseController {
    
    protected $modelCliente;
    protected $modelPermissoes;
    protected $modelEndereco;

    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
        $this->modelPermissoes = Container::getModel("Permissoes");
        $this->modelEndereco = Container::getModel("Endereco");
        if ($this->modelCliente->isLogged() == false) {
            Redirect::route('/login');
            exit;
        }
    }
    
    public function index() {
        $this->setPageTitle('Home');
        $this->modelCliente->setLoggedUser();
        $this->modelCliente->getUserInfo();
        
        if (!$this->modelCliente->getUserInfoUser()['complemento']) {
            $this->renderView('cadastro/endereco', 'layout', 'menu');
        }
        $this->view->permissao = $this->modelCliente->possuiPermissao('completo');
        $this->renderView('home/index', 'layout', 'menu');
    }

}

