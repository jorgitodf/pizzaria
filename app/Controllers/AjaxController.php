<?php

namespace App\Controllers;

use Core\BaseController;
use Core\Container;
use App\Models\Cidade;
use Core\DataBase;

class AjaxController extends BaseController{
    
    protected $modelCidade;
    protected $modelCliente;
    
    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
        $this->modelCidade = new Cidade(DataBase::getConexao());
        if ($this->modelCliente->isLogged() == false) {
            Redirect::route('/login');
            exit;
        }
    }
    
    public function index() {
        
    }
    
    public function buscarUf() {
        if (isset($_POST['sigla_uf'])) {
            $idUf = (int) filter_input(INPUT_POST, 'sigla_uf', FILTER_SANITIZE_NUMBER_INT);
            if (empty($idUf) || $idUf == 0) {
                $json = array('status' => 'error', 'message' => 'Selecione uma UF');
            } elseif ($this->modelCidade->getCidadesByIdUf($idUf) != false) {
                $json = array('status' => 'success', 'message' => $this->modelCidade->getCidadesByIdUf($idUf));
            } else {
                $json = array('status' => 'error', 'message' => 'A Tabela de Cidades dessa UF está vazia');
            }
            echo json_encode($json);
        }
    }

}
