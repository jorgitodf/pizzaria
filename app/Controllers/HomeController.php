<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;
use Core\Redirect;

class HomeController extends BaseController {
    
    protected $modelCliente;

    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
        if ($this->modelCliente->isLogged() == false) {
            Redirect::route('/login');
            exit;
        }
    }
    
    public function index() {
        $this->setPageTitle('Home');
        if (isset($_SESSION['ccUser'])) {
            $idCliente = $_SESSION['ccUser']['id_cliente'];
            if ($this->modelCliente->getClienteEnderecoById($idCliente) == true) {
                $this->renderView('home/index', 'layout');
            } else {
                $this->renderView('cadastro/endereco', 'layout');
            }
        }



    }

}

