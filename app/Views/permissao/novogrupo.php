
<section class="container col-xs-12 col-lg-12 col-md-12 col-sm-12" id="">
    <aside class="row">
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" id="div_cad_permissao">
            <h2>Cadastro de Grupo de Permissões</h2>
            <div class="form-group " id="">
                <form class="form-login" id="" action="/permissoes/adicionar" method="post">
                    <div class="form-group">
                        <input class="form-control input-sm" name="nome_grupo" type="text" placeholder="Digite o nome do Grupo de Permissão" value="<?php echo isset($this->view->nome_grupo) ? $this->view->nome_grupo : ""; ?>">
                    </div><br/>
                    <div class="form-group" id="div_head_grupo_permissao">
                        <h5>Permissões</h5>
                        <div class="checkbox">
                        <?php foreach ($this->view->parametros as $value): ?>
                            <label for="p_<?php echo $value->id_permissao_parametros; ?>">
                            <input type="checkbox" name="permissoes[]" value="<?php echo $value->id_permissao_parametros; ?>" id="p_<?php echo $value->id_permissao_parametros; ?>">
                            <?php echo $value->nome_parametro; ?>
                            </label>
                            <br/>
                        <?php endforeach; ?>
                        </div>
                    </div>
                    <div class="form-group" id="div_form_cad_permissao">
                        <button type="submit" class="btn btn-primary btn-sm" id="">Cadastrar</button>
                    </div>
                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6" id="div_erro_cad_permissao">
                        <?php 
                        echo isset($this->view->erroNomeGrupo) ? "<div class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_novo_grupo'>{$this->view->erroNomeGrupo['erroNomeGrupo']}</div>" : "";
                        ?>
                        <?php 
                        echo isset($this->view->erroNomeParamPermi) ? "<div class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_param_permi'>{$this->view->erroNomeParamPermi['erroParametros']}</div>" : "";
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
