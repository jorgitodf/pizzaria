<?php

namespace App\Controllers;

use Core\Container;
use Core\Redirect;
use App\Models\Permissoes;
use Core\DataBase;

class PermissaoController extends \Core\BaseController {
    
    protected $modelCliente;
    protected $modelPermissoes;
    
    public function __construct() {
        parent::__construct();
        $this->modelCliente = Container::getModel("Cliente");
        $this->modelPermissoes = new Permissoes(DataBase::getConexao());
        if ($this->modelCliente->isLogged() == false) {
            Redirect::route('/login');
            exit;
        }
    }
    
    public function index() {
        $this->setPageTitle('Permissões');
        $this->modelCliente->setLoggedUser();
        if ($this->modelCliente->possuiPermissao('completo') == true) {
            $this->view->permissoes = $this->modelPermissoes->getListaPermissoes();
            $this->view->grupos = $this->modelPermissoes->getListaGrupos();
            $this->view->permissao = $this->modelCliente->possuiPermissao('completo');
            $this->renderView('permissao/cadastro', 'layout', 'menu');
        } else {
            Redirect::route('/home');
        }
    }
    
    public function add() {
        $this->setPageTitle('Nova Permissão');
        $this->modelCliente->setLoggedUser();
        if ($this->modelCliente->possuiPermissao('completo') == true) {
            $this->view->permissoes = $this->modelPermissoes->getListaPermissoes();
            $this->view->permissao = $this->modelCliente->possuiPermissao('completo');
            if (isset($_POST['nome_permissao'])) {
                $nome_permissao = trim(addslashes(filter_input(INPUT_POST, 'nome_permissao', FILTER_SANITIZE_STRING)));
                if ($this->modelPermissoes->setNome_permissao($nome_permissao)['erroNomePermissao'] == true) {
                    $this->view->erroNomePermissao = $this->modelPermissoes->setNome_permissao($nome_permissao);
                } else {
                    $this->view->nome_permissao = $nome_permissao;
                }
                if ($this->modelPermissoes->setNome_permissao($nome_permissao) == false && $this->modelPermissoes->addNovaPermissao($this->modelPermissoes->getNome_permissao())) {
                    $this->view->permissoes = $this->modelPermissoes->getListaPermissoes();
                    $this->renderView('permissao/cadastro', 'layout', 'menu');
                } else {

                }
            }
            $this->renderView('permissao/novapermissao', 'layout', 'menu');
        } else {
            Redirect::route('/home');
        }
    }
    
    public function adicionar() {
        $this->setPageTitle('Novo Grupo');
        $this->modelCliente->setLoggedUser();
        if ($this->modelCliente->possuiPermissao('completo') == true) {
            $this->view->permissoes = $this->modelPermissoes->getListaPermissoes();
            $this->view->permissao = $this->modelCliente->possuiPermissao('completo');
            
            if (isset($_POST['nome_grupo'])) {
                $nome_grupo = trim(addslashes(filter_input(INPUT_POST, 'nome_grupo', FILTER_SANITIZE_STRING)));
                $permissoes = $_POST['permissoes'];
                if ($this->modelPermissoes->setNome_grupo($nome_grupo)['erroNomeGrupo'] == true) {
                    $this->view->erroNomeGrupo = $this->modelPermissoes->setNome_grupo($nome_grupo);
                } else {
                    $this->view->nome_grupo = $nome_grupo;
                }
                if ($this->modelPermissoes->setParametros_permissao($permissoes)['erroParametros'] == true) {
                    $this->view->erroNomeParamPermi = $this->modelPermissoes->setParametros_permissao($permissoes);
                } else {
                    //$this->view->nome_grupo = $nome_grupo;
                }
                if ($this->modelPermissoes->setNome_grupo($nome_grupo) == false && $this->modelPermissoes->setParametros_permissao($permissoes) == false && 
                        $this->modelPermissoes->addNovoGrupo($this->modelPermissoes->getNome_permissao(), $this->modelPermissoes->getParametros_permissao())) {
                    $this->view->grupos = $this->modelPermissoes->getListaGrupos();
                    $this->renderView('permissao/cadastro', 'layout', 'menu');
                } else {

                }
            }
            $this->view->parametros = $this->modelPermissoes->getListaPermissoes();
            $this->renderView('permissao/novogrupo', 'layout', 'menu');
        } else {
            Redirect::route('/home');
        }
    }
    
    public function excluir($id) {
        $this->modelCliente->setLoggedUser();
        if ($this->modelCliente->possuiPermissao('completo') == true) {
            if (is_numeric($id)) {
                $this->modelPermissoes->deletePermissao($id);
                $this->view->permissoes = $this->modelPermissoes->getListaPermissoes();
                $this->view->permissao = $this->modelCliente->possuiPermissao('completo');
                $this->renderView('permissao/cadastro', 'layout', 'menu');
            } else {
                Container::pageNotFound();
            }
        } else {
            Redirect::route('/home');
        }
    }
    
    public function remover($id) {
        $this->modelCliente->setLoggedUser();
        if ($this->modelCliente->possuiPermissao('completo') == true) {
            if (is_numeric($id)) {
                $this->modelPermissoes->deleteGrupo($id);
                $this->view->grupos = $this->modelPermissoes->getListaGrupos();
                $this->view->permissoes = $this->modelPermissoes->getListaPermissoes();
                $this->view->permissao = $this->modelCliente->possuiPermissao('completo');
                $this->renderView('permissao/cadastro', 'layout', 'menu');
            } else {
                Container::pageNotFound();
            }
        } else {
            Redirect::route('/home');
        }
    }

}
