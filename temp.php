            <div class="row-fluid" id="produto_menu">
            </div>
            <div class="row col-lg-8 col-md-8 col-sm-8 col-xs-8" id="div_produto_menu">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="div_row_prod_menu" name="idProduto" value="">
                    <div class="" id="div_imagem_produto">
                        <p>Foto Imagem</p>
                    </div>
                    <div class="" id="div_desc_produto">
                        <p>Pizza de Calabresa - Júnior</p>
                        <p>Mussarela e Calabresa</p>
                    </div>
                    <div class="" id="div_preco_produto">
                        <p>R$ 14,00</p>
                    </div>
                    <div class="" id="div_produto_add_car">
                        <p><span class="glyphicon glyphicon-plus"></span></p>
                    </div>
                </div>    
            </div>
            <div class="row col-lg-8 col-md-8 col-sm-8 col-xs-8" id="div_produto_menu">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="div_row_prod_menu">
                    <div class="" id="div_imagem_produto">
                        <p>Foto Imagem</p>
                    </div>
                    <div class="" id="div_desc_produto">
                        <p>Pizza de Calabresa - Júnior</p>
                        <p>Mussarela e Calabresa</p>
                    </div>
                    <div class="" id="div_preco_produto">
                        <p>R$ 14,00</p>
                    </div>
                    <div class="" id="div_produto_add_car">
                        <p><span class="glyphicon glyphicon-plus"></span></p>
                    </div>
                </div>    
            </div>

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
    
    