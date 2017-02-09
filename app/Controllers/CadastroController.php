<?php

namespace App\Controllers;

use Core\BaseController;

class CadastroController extends BaseController {
    
    
    public function index() {
        $this->setPageTitle('Cadastro');
        $this->renderView('cadastro/index', 'layout');        
    }

}
