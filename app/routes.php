<?php
$route[] = ['/', 'HomeController@index'];
$route[] = ['/home', 'HomeController@index'];
$route[] = ['/login', 'LoginController@index'];
$route[] = ['/login/quem-somos', 'LoginController@ver'];
$route[] = ['/login/termos', 'LoginController@verTermo'];
$route[] = ['/login/logout', 'LoginController@logout'];
$route[] = ['/login/senha', 'LoginController@recuperarSenha'];
$route[] = ['/produtos', 'ProdutoController@index'];
$route[] = ['/cadastrar', 'CadastroController@index'];
$route[] = ['/cadastrar/endereco', 'CadastroController@cadastrarEndereco'];
$route[] = ['/cadastrar/bairro', 'CadastroController@cadastrarBairro'];
$route[] = ['/uf/buscar', 'AjaxController@buscarUf'];
$route[] = ['/menu/buscar', 'AjaxController@buscarMenu'];
$route[] = ['/menu/buscar-produtos', 'AjaxController@buscarProdutosByCategoria'];
$route[] = ['/cidade/buscar', 'AjaxController@buscarCidade'];
$route[] = ['/permissoes', 'PermissaoController@index'];
$route[] = ['/permissoes/excluir/{id}', 'PermissaoController@excluir'];
$route[] = ['/permissoes/remover/{id}', 'PermissaoController@remover'];
$route[] = ['/permissoes/add', 'PermissaoController@add'];
$route[] = ['/permissoes/adicionar', 'PermissaoController@adicionar'];
$route[] = ['/permissoes/editar/{id}', 'PermissaoController@editar_grupo'];
$route[] = ['/posts', 'PostsController@index'];
$route[] = ['/posts/show/{id}', 'PostsController@show'];

return $route;