
<section class="container col-lg-12 col-sm-12 col-md-12 col-xs-12">
    <aside class="row-fluid">
        <form class="form-login" id="form_cad_produto" action="/produto/cadastrar" method="post" enctype="multipart/form-data">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" id="div_form_cad_produtos">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="div_form_cad_produtos_header">
                    <p>Cadastro de Produtos</p>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 cor_cinza_claro" id="div_form_cad_produtos_body">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="div_form_cad_produtos_left">
                        <div class="form-group">
                            <input type="text" class="form-control" name="nome_produto" id="nome_produto" placeholder="Informe o Nome do Produto">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="4" name="descricao_produto" id="descricao_produto" placeholder="Informe a Descrição do Produto"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="volume" id="volume" placeholder="Informe o Volume do Produto">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="tamanho" id="tamanho" placeholder="Informe o Tamamho do Produto">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="div_form_cad_produtos_right">
                        <div class="form-group">
                            <input type="text" class="form-control" name="preco_compra" id="preco_compra" placeholder="Informe o Preço da Compra do Produto">
                        </div>
                        <div class="form-group">
                            <input type="number" min="1" class="form-control" name="quantidade" id="quantidade" placeholder="Informe a Quantidade Comprada do Produto">
                        </div>
                        <div class="form-group" id="div_categoria">
                            <select class="form-control" name="categoria" id="categoria" data-toggle="buscar_categoria">
                                <option value="">Selecionar Categoria</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="data_compra" id="data_compra" placeholder="Informe a Data da Compra do Produto">
                        </div>
                        <div class="form-group">
                            <input type="file" class="form-control" name="imagem" id="imagem">
                        </div>
                        <div class="form-group retorno" id="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 cor_cinza_claro">
                    <div class="form-group" id="div_btn_cad_prod">
                        <button type="submit" class="btn btn-success btn-sm" id="btn_cad_produtos">Cadastrar</button>
                    </div>
                </div>
            </div>
        </form>    
    </aside>
</section>
