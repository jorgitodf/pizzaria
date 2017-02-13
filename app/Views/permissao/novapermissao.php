
<section class="container col-xs-12 col-lg-12 col-md-12 col-sm-12" id="">
    <aside class="row">
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" id="div_cad_permissao">
            <h2>Cadastro de Permissões</h2>
            <div class="form-group " id="">
                <form class="form-login" id="" action="/permissoes/add" method="post">
                    <div class="form-group">
                        <input class="form-control input-sm" name="nome_permissao" type="text" placeholder="Digite a Permissão" value="<?php echo isset($this->view->nome_permissao) ? $this->view->nome_permissao : ""; ?>">
                    </div>
                    <div class="form-group" id="div_form_cad_permissao">
                        <button type="submit" class="btn btn-primary btn-sm" id="">Cadastrar</button>
                    </div>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5" id="div_erro_cad_permissao">
                        <?php 
                        echo isset($this->view->erroNomePermissao) ? "<div class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_nova_permissao'>{$this->view->erroNomePermissao['erroNomePermissao']}</div>" : "";
                        ?>
                        <?php 
                            if (isset($this->view->erro)) {
                                echo $this->view->erro['erroSemCadastro'];
                                echo $this->view->erro['erroSenha'];
                                echo $this->view->erro['erroSenhaNaoConfere'];
                            } else {
                                echo "";
                            }
                        ?>
                    </div>
                </form>
            </div>

        </div>
    </aside>
</section>
