
<section class="container container col-xs-12 col-lg-12 col-md-12 col-sm-12" id="section_cadastro_cliente">
    <aside class="row">
        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7" id="div_cadastro">
            <div class="panel panel-default" id="panel_cadastro_cliente_body">
                <form class="form-login" id="" action="/cadastrar" method="post">
                    <div class="panel-heading" id="panel_cadastro_cliente">Cadastro de Cliente</div>
                    <div class="panel-body"><br/>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <input class="form-control input-group" placeholder="Digite seu Nome Completo" name="nome" type="text" value="<?php echo isset($this->view->nomeCompleto) ? $this->view->nomeCompleto : ""; ?>"/> 
                        </div>	
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <input class="form-control input-group" placeholder="Digite seu E-mail" name="email" type="email" value="<?php echo isset($this->view->email) ? $this->view->email : ""; ?>"/>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <input class="form-control input-group" placeholder="Digite sua Senha" name="senha" type="password" value="<?php echo isset($this->view->senha) ? $this->view->senha : ""; ?>"/>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                            <input class="form-control input-group" placeholder="Confirme sua Senha" name="senha_confirm" type="password" value="<?php echo isset($this->view->senhaConfirm) ? $this->view->senhaConfirm : ""; ?>"/>
                        </div>
                        <br/>
                        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4" id="div_botoes_cadas_cliente">
                            <button type="submit" class="btn btn-success btn-sm" id="btn_cad_cliente">Cadastrar</button>
                            <a class="btn btn-primary btn-sm" href="/home" id="btn_cad_cliente_logar">Logar</a>
                        </div>
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6" id="div_erros_cadas_cliente">
                            <?php echo isset($this->view->cadastro) ? $this->view->cadastro : ""; ?>
                            <?php echo isset($this->view->retorno_senha) ? $this->view->retorno_senha : ""; ?>
                            <?php echo isset($this->view->sucesso) ? "<div class='alert alert-success' role='alert' id='msg_cad_cliente_sucesso'>{$this->view->sucesso}</div>" : ""; ?>
                            <?php echo isset($this->view->erroCad) ? "<div class='alert alert-danger' role='alert' id='msg_erro_cad_cliente'>{$this->view->erroCad}</div>" : ""; ?>
                            <?php 
                                if (isset($this->view->retornoNomeCompleto)) {
                                    echo $this->view->retornoNomeCompleto['erroNome'];
                                }
                                if (isset($this->view->retornoNomeCompleto)) {
                                    echo $this->view->retornoNomeCompleto['erroNomeNumero'];
                                } else {
                                    echo "";
                                }
                                if (isset($this->view->retornoEmail)) {
                                    echo "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_email_cad_cliente'>{$this->view->retornoEmail['erroEmail']}</span><br/>";
                                } else {
                                    echo "";
                                }
                                if (isset($this->view->retornoEmailExiste)) {
                                    echo "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_email_cad_cliente'>{$this->view->retornoEmailExiste['emailExiste']}</span><br/>";
                                } else {
                                    echo "";
                                }
                                if (isset($this->view->retornoSenha)) {
                                    echo "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_senha_cad_cliente'>{$this->view->retornoSenha['erroSenha']}</span><br/>";
                                } else {
                                    echo "";
                                }
                                if (isset($this->view->retornoSenhaConfirm)) {
                                    echo $this->view->retornoSenhaConfirm['erroSenha2'];
                                }
                                if (isset($this->view->erro)) {
                                    echo $this->view->erro['erroSemCadastro'];
                                    echo $this->view->erro['erroSenha'];
                                } else {
                                    echo "";
                                }
                            ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </aside>
</section>