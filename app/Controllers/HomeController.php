<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;

class HomeController extends BaseController {
    
    protected $modelCliente;

    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
    }
    
    public function index() {
        $this->setPageTitle('Home');
        $clientes = $this->modelCliente->getAllClientes();
        if (empty($clientes)) {
            echo "A Tabela <b>{$this->modelCliente->getTable()}</b> está vazia";
            exit;
        }
        $this->view->cliente = $clientes;
        $this->renderView('home/index', 'layout');
    }

}

