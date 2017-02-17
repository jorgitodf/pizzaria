
<section class="container col-xs-12 col-lg-12 col-md-12 col-sm-12" id="section_sem_end">
    <aside class="row">
        <form class="form-login" action="/cadastrar/endereco" method="post" id="form_cad_endereco">
            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12" id="div_cad_end">
                <div class="row">
                    <div class="form-group col-sm-8 col-xs-12">
                        <h2><span class="glyphicon glyphicon-map-marker" id="gly_end"></span>&nbsp;&nbsp;Meus Endereços</h2>
                    </div><br/>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <select class="form-control" name="sigla_uf" id="sigla_uf">
                                <option value="">UF</option>
                                <?php foreach ($this->view->ufs as $value): ?>
                                    <option value="<?php echo $value->id_uf; ?>"><?php echo $value->sigla_uf; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <select class="form-control" name="nome_cidade" id="cmbCidade">
                                <option>Cidade</option>
                            </select>
                        </div>
                    </div><br/>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <select class="form-control" name="logradouro">
                                <option value="">Logradouro</option>
                                <?php foreach ($this->view->lograrouros as $value): ?>
                                    <option value="<?php echo $value->id_logradouro; ?>"><?php echo $value->nome_logradouro; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <input class="form-control" name="complemento" type="text" placeholder="Digite Complemento do Endereço" value="">
                        </div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <input class="form-control" name="numero" type="text" placeholder="Número" value="">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <input class="form-control" name="cep" id="cep" type="text" placeholder="Digite o CEP" value="">
                        </div>
                    </div>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-8">
                            <select class="form-control" name="bairro" id="cmbBairro">
                                <option>Bairro</option>
                            </select>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" id="div_btn_add_bairro">
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#add_bairro" id="btn_adc_bairro" title="Clique aqui para Adicinar o Bairro caso não exista na lista ao lado."><span class="glyphicon glyphicon-plus" id="gly_btn_adc_bai"></span></button>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" id="div_radio">
                            <label class="radio-inline">
                                <input type="radio" name="tipoEndereco" value="1">Casa
                            </label>    
                            <label class="radio-inline">
                                <input type="radio" name="tipoEndereco" value="2">Trabalho
                            </label>    
                        </div>
                    </div> 
                </div>
                <div class="row col-lg-3 col-md-3 col-sm-3 col-xs-3" id="div_botoes_cad_end">
                    <div class="form-group">
                        <div class="" id="div_btn_cad_end">
                            <button type="submit" class="btn btn-success" id="btn_login_entrar">Cadastrar</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="" id="">
                            <a class="btn btn-primary" href="/" id="btn_login_entrar">Voltar</a>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-8 col-md-8 col-sm-8 col-xs-8" id="div_msgs_error_credito">
                    <div class="form-group">
                        <div class="retorno">
                        </div>
                    </div>
                </div>    
            </div>

        </form>    
    </aside>
</section>

<div class="modal fade" id="add_bairro" tabindex="-1" role="dialog" aria-labelledby="add_bairro">
    <div class="modal-dialog" role="document">
        <form class="form-login" action="/cadastrar/bairro" method="post" id="form_cad_bairro">
            <div class="modal-content" id="div_modal_content">
                <div class="modal-header modal_header">
                    <h4 class="modal-title" id="exampleModalLabel">Adicionar Bairro</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group div_form_modal">
                        <select class="form-control" name="sigla_uf" id="cmbUf">
                            <option value="">UF</option>
                            <?php foreach ($this->view->ufs as $value): ?>
                                <option value="<?php echo $value->id_uf; ?>"><?php echo $value->sigla_uf; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group div_form_modal">
                        <select class="form-control" name="nome_cidade" id="cmbCidadeBairro">
                            <option>Cidade</option>
                        </select>
                    </div>
                    <div class="form-group div_form_modal">
                        <input class="form-control" name="nome_bairro" id="nome_bairro_modal" type="text" placeholder="Digite o Nome do Bairro" value="">
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group left" id="div_retorno_erro_modal">
                        <div id="retorno">
                        </div>
                    </div>
                    <div class="form-group" id="div_btns_cad_bairro">
                        <button type="submit" class="btn btn-primary" id="btn_bairro_cad">Salvar</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn_fechar_modal_cad_bairro">Fechar</button>
                    </div>    
                </div>
            </div>
        </form>    
    </div>
</div>