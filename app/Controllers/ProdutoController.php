<?php

namespace App\Controllers;

use Core\BaseController;
use Core\DataBase;
use App\Models\Cliente;

class ProdutoController extends BaseController {
    
    protected $modelCliente;
    
    public function __construct() {
        parent::__construct();
        $this->modelCliente = new Cliente(DataBase::getConexao());
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

}
