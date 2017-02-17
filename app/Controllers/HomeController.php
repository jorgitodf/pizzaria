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
        } elseif ($this->modelCliente->getGrupoCliente()->nome_grupo == 'Admin') {
            $this->view->permissao = 'Admin';
            $this->renderView('home/index', 'layout', 'menu');
        } elseif ($this->modelCliente->getGrupoCliente()->nome_grupo == 'Cliente') {
            $this->view->permissao = 'Cliente';
            $this->renderView('home/cliente', 'layout', 'menu');
        }    
    }

}

