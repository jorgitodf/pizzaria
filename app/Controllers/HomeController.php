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
        $this->renderView('home/index', 'layout');
    }

}

