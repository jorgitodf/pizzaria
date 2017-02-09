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


    /**
     * @return mixed
     */
    public function getNomeCompleto()
    {
        return $this->nome_completo;
    }

    /**
     * @param $nome_completo
     * @return array
     */
    public function setNomeCompleto($nome_completo)
    {
        if (Helpers::validaNomeCadastro($nome_completo)) {
            return Helpers::validaNomeCadastro($nome_completo);
        } else {
            $this->nome_completo = $nome_completo;
        }
    }

    /**
     * @return mixed
     */
    public function getTipoCliente()
    {
        return $this->tipo_cliente;
    }

    /**
     * @param mixed $tipo_cliente
     */
    public function setTipoCliente($tipo_cliente)
    {
        $this->tipo_cliente = $tipo_cliente;
    }

    /**
     * @return mixed
     */
    public function getDataCadastro()
    {
        return $this->data_cadastro;
    }

    /**
     * @param mixed $data_cadastro
     */
    public function setDataCadastro($data_cadastro)
    {
        $this->data_cadastro = $data_cadastro;
    }


    /**
     * @param $email
     * @return array|mixed
     */
    public function setEmail($email)
    {
        if (Helpers::validaEmail($email)['erroEmail'] == true) {
            return Helpers::validaEmail($email);
        } elseif ($this->verificaExisteEmail($email)['emailExiste'] == true) {
            return $this->verificaExisteEmail($email);
        } else {
            $this->email = $email;
        }
    }

    /**
     * @return mixed
     */
    public function getEmail() {
        return $this->email;
    }

    /**
     * @param $senha
     * @return array
     */
    public function setSenha($senha) {
        if (Helpers::validaSenha($senha)['erroSenha'] == true) {
            return Helpers::validaSenha($senha);
        } else {
            $this->senha = $senha;
        }
    }

    /**
     * @return mixed
     */
    public function getSenha() {
        return $this->senha;
    }

    public function addCliente() {
        try {
            $this->pdo->beginTransaction();
            $senhaCryp = Helpers::cryptySenha($this->senha);
            $dataCadastro = Helpers::retornaHora('dataAtual');
            $stmt = $this->pdo->prepare("INSERT INTO tb_cliente (tipo_cliente, nome_completo, email, senha, data_cadastro, 
                    fk_id_permissao_grupo) VALUES (?,?,?,?,?,?)");
            $stmt->bindValue(1, 'Cliente', PDO::PARAM_STR);
            $stmt->bindValue(2, $this->nome_completo, PDO::PARAM_STR);
            $stmt->bindValue(3, $this->email, PDO::PARAM_STR);
            $stmt->bindValue(4, $senhaCryp, PDO::PARAM_STR);
            $stmt->bindValue(5, $dataCadastro, PDO::PARAM_STR);
            $stmt->bindValue(6, 2, PDO::PARAM_INT);
            $stmt->execute();
            $this->pdo->commit();
            return true;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            return $exc->getMessage();
        }
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
            } elseif ($result[0]->email == $email) {
                $array['emailExiste'] = "E-mail já Cadastrado!";
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
