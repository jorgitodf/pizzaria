<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;
use Core\Helpers;
use PDO;

class Cliente extends BaseModel {
    
    protected $table = "tb_cliente";
    private $cpf;
    private $tipo_cliente;
    private $nome_completo;
    private $data_nascimento;
    private $email;
    private $senha;
    private $data_cadastro;

    public function __construct($pdo, $cpf, $tipo_cliente, $nome_completo, $data_nascimento, $email, $senha, $data_cadastro) {
        parent::__construct($pdo);    
        $this->cpf = $cpf;
        $this->tipo_cliente = $tipo_cliente;
        $this->nome_completo = $nome_completo;
        $this->data_nascimento = $data_nascimento;
        $this->email = $email;
        $this->senha = $senha;
        $this->data_cadastro = $data_cadastro;
    }
    
    public function getTable() {
        return $this->table;
    }
    

    public function setEmail($email) {
        if (Helpers::validaEmail($email)['erroEmail'] == true) {
            return Helpers::validaEmail($email);
        } else {
            $this->email = $email;
        }
    }
    public function getEmail() {
        return $this->email;
    }
    
    public function setSenha($senha) {
        if (Helpers::validaSenha($senha)['erroSenha'] == true) {
            return Helpers::validaSenha($senha);
        } else {
            $this->senha = $senha;
        }
    }
    public function getSenha() {
        return $this->senha;
    }


    
    public function getAllClientes() {
        try {
            $query = "SELECT * FROM {$this->table}";
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $stmt->closeCursor();
            return $result;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe.."; 
            }
            exit;
        }
    }
    
    public function verificaExisteEmail() {
        try {
            $query = "SELECT email, senha FROM {$this->table} WHERE email = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->email, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $stmt->closeCursor();
            if (empty($result[0]->email)) {
                $array['erroSemCadastro'] = "<div class='alert alert-danger' id='msg_erro_email_nao_cadastrado' role='alert'>E-mail não Cadastrado no Sistema. Faça o seu cadastro!</div>";
            } elseif ($result[0]->email && ($result[0]->senha != $this->senha)) {
                $array['erroSenha'] = "<div class='alert alert-danger' role='alert' id='msg_erro_senha_nao_confere'>A senha digitada não confere com a senha Cadastrada!!</div>";
            }
            return $array;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe.."; 
            }
            exit;
        }
    }
    
    public function isLogged() {
        if(isset($_SESSION['ccUser']) && !empty($_SESSION['ccUser'])) {
            return true;
        } else {
            return false;
        }
    }
    
}
