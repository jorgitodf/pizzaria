<?php

    foreach ($this->view->cliente  as $key => $value) {
        echo $value->nome;
    }
    
    
   /* 
        Controller Permissoa

            public function index() {
                $data = array();
                $u = new Users();
                $u->setLoggedUser();
                $company = new Companies($u->getCompany());
                $data['company_name'] = $company->getName();
                $data['user_email'] = $u->getEmail();

                if($u->hasPermission('permissions_view')) {
                    $permissions = new Permissions();
                    $data['permissions_list'] = $permissions->getList($u->getCompany());
                    $data['permissions_groups_list'] = $permissions->getGroupList($u->getCompany());

                        $this->loadTemplate('permissions', $data);
                } else {
                        header("Location: ".BASE_URL);
                }
            }
    * 
    *             $idCliente = $_SESSION['ccUser']['id_cliente'];
            if ($this->modelCliente->getClienteEnderecoById($idCliente) == true) {
                $this->renderView('home/index', 'layout');
            } else {
                $this->renderView('cadastro/endereco', 'layout');
            }
    } */
    
    