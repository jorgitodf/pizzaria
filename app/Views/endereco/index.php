
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
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control" name="bairro" type="text" placeholder="Informe o Bairro" value="">
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
                        <div class="retorno" id=""></div>
                    </div>
                </div>    
            </div>

        </form>    
    </aside>
</section>
