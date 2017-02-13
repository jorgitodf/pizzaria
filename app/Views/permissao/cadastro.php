
<section class="container col-xs-12 col-lg-12 col-md-12 col-sm-12" id="">
    <aside class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="div_nav_tabs">
            <h2>Permissões</h2>
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#permissoes" data-toggle="tab">Permissões</a></li>
                <li role="presentation"><a href="#grupos" data-toggle="tab">Grupos de Permissões</a></li>
            </ul>
            <div class="tab-content" id="">
                <div id="permissoes" class="tab-pane active in fade">
                    <table class="table table-bordered table-responsive table-hover table-condensed" id="tabela_permissoes">
                        <thead>
                            <tr>
                                <th>Nome da Permissão</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($this->view->permissoes as $linha): ?>
                            <tr>
                                <td><?php echo $linha->nome_parametro;  ?></td>
                                <td><a class="btn btn-primary btn-sm" href="/permissoes/excluir/<?php echo $linha->id_permissao_parametros; ?>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2"><div class=""><a class="btn btn-success" href="/permissoes/add">Adicionar Permissão</a></div></td>
                            </tr>
                        </tfoot>
                    </table> 
                </div>
                <div id="grupos" class="tab-pane in fade">
                    <table class="table table-bordered table-responsive table-hover table-condensed" id="tabela_grupos">
                        <thead>
                            <tr>
                                <th>Nome do Grupo</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($this->view->grupos as $linha): ?>
                            <tr>
                                <td width="520"><?php echo $linha->nome_grupo;  ?></td>
                                <td>
                                    <a class="btn btn-primary btn-sm botao" href="/permissoes/editar/<?php echo $linha->id_permissao_grupo; ?>">Editar</a>
                                    <a class="btn btn-primary btn-sm botao" href="/permissoes/remover/<?php echo $linha->id_permissao_grupo; ?>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2"><div class=""><a class="btn btn-success" href="/permissoes/adicionar">Adicionar Grupo de Permissão</a></div></td>
                            </tr>
                        </tfoot>
                    </table> 

                </div>
            </div>   

        </div>
    </aside>
</section>
