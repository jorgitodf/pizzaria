<?php

    foreach ($this->view->cliente  as $key => $value) {
        echo $value->nome;
    }
    
    
   /* public function index() {
        $this->setPageTitle('Home');
        $clientes = $this->modelCliente->getAllClientes();
        if (empty($clientes)) {
            echo "A Tabela <b>{$this->modelCliente->getTable()}</b> está vazia";
            exit;
        }
        $this->view->cliente = $clientes;
        $this->renderView('home/index', 'layout');
    } */
    
    