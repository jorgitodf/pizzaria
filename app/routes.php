<?php
$route[] = ['/', 'HomeController@index'];
$route[] = ['/home', 'HomeController@index'];
$route[] = ['/login', 'LoginController@index'];
$route[] = ['/login/logout', 'LoginController@logout'];
$route[] = ['/login/senha', 'LoginController@recuperarSenha'];
$route[] = ['/cadastrar', 'CadastroController@index'];
$route[] = ['/cadastrar/endereco', 'CadastroController@cadastrarEndereco'];
$route[] = ['/cadastrar/bairro', 'CadastroController@cadastrarBairro'];
$route[] = ['/uf/buscar', 'AjaxController@buscarUf'];
$route[] = ['/cidade/buscar', 'AjaxController@buscarCidade'];
$route[] = ['/permissoes', 'PermissaoController@index'];
$route[] = ['/permissoes/excluir/{id}', 'PermissaoController@excluir'];
$route[] = ['/permissoes/remover/{id}', 'PermissaoController@remover'];
$route[] = ['/permissoes/add', 'PermissaoController@add'];
$route[] = ['/permissoes/adicionar', 'PermissaoController@adicionar'];
$route[] = ['/posts', 'PostsController@index'];
$route[] = ['/posts/show/{id}', 'PostsController@show'];

return $route;