<?php

namespace App\Models;

use Core\BaseModel;
use Exception;
use Core\Helpers;
use PDO;

class Login extends BaseModel
{
    protected $table = "tb_cliente";
    private $email;
    private $senha;

    public function __construct($pdo,$email, $senha) {
        parent::__construct($pdo);
        $this->email = $email;
        $this->senha = $senha;
    }

    public function getTable() {
        return $this->table;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param $email
     * @return array
     */
    public function setEmail($email)
    {
        if (Helpers::validaEmail($email)['erroEmail'] == true) {
            return Helpers::validaEmail($email);
        } elseif ($this->verificaExisteEmail($email)['erroSemCadastro'] == true) {
            return $this->verificaExisteEmail($email);
        } else {
            $this->email = $email;
        }
    }

    /**
     * @return mixed
     */
    public function getSenha()
    {
        return $this->senha;
    }

    /**
     * @param $senha
     * @return array
     */
    public function setSenha($senha)
    {
        if (Helpers::validaSenha($senha)['erroSenha'] == true) {
            return Helpers::validaSenha($senha);
        } elseif ($this->confereSenhaEmail($senha)['erroSenhaNaoConfere'] == true) {
            return $this->confereSenhaEmail($senha);
        } else {
            $this->senha = $senha;
        }
    }

    public function verificaExisteEmail($email) {
        try {
            $query = "SELECT email FROM {$this->table} WHERE email = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $email, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $stmt->closeCursor();
            if (empty($result[0]->email)) {
                $array['erroSemCadastro'] = "<div class='alert alert-danger' id='msg_erro_email_nao_cadastrado' role='alert'>E-mail não Cadastrado no Sistema. Faça o seu cadastro!</div>";
            }
            return $array;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }

    public function confereSenhaEmail($senha) {
        try {
            $query = "SELECT email, senha FROM {$this->table} WHERE email = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->email, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $stmt->closeCursor();
            if ($result[0]->email && (Helpers::consultaSenhaCrypty($senha, $result[0]->senha) != true)) {
                $array['erroSenhaNaoConfere'] = "<div class='alert alert-danger' role='alert' id='msg_erro_senha_nao_confere'>A senha digitada não confere com a senha Cadastrada!!</div>";
            }
            return $array;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }

}