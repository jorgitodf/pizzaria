<?php

namespace Core;

class Container {
    
    public static function newController($controller) {
        $objController = "App\\Controllers\\" . $controller;
        if (file_exists( __DIR__ . "/../app/Controllers/{$controller}.php")) {
            return new $objController;
        } else {
            echo "O Controller <b>{$controller}</b> Ainda Não Existe !!";
            exit;
        }
    }
    
    public static function getModel($model) {
        $objModel = "App\\Models\\" . $model;
        if (file_exists( __DIR__ . "/../app/Models/{$model}.php")) {
            return new $objModel(DataBase::getConexao());
        } else {
            echo "O Model <b>{$model}</b> Ainda Não Existe !!";
            exit;
        }
    }
    
    public static function pageNotFound() {
        if (file_exists(__DIR__ . "/../app/Views/404.php")) {
            return require_once __DIR__ . "/../app/Views/404.php";
        } else {
            echo "<h1>Erro 404: O Arquivo da Page Not Found</h1>";
        }
    }
    
    public static function getImagem() {
        if (file_exists(__DIR__ . "/../storage/imagens/pizza_quem_somos.jpg")) {
            return require_once __DIR__ . "/../storage/imagens/pizza_quem_somos.jpg";
        } else {
            echo "<h1>Erro 404: O Arquivo da Page Not Found</h1>";
        }
    }
    
    public static function verificaErroDataBaseConnection($code, $db) {
        if ($code == 1049) {
            $msgErro = "<h3>O Banco de Dados <b>{$db}</b> não Existe... </h3><br/>";
        } elseif ($code == 1045) {
            $msgErro = "<h3>O Usuário ou a Senha do Banco de Dados não Confere(m)...</h3><br/>";
        }
        return $msgErro;
    }
    
}
