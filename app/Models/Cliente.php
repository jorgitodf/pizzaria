<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;
use Core\Helpers;
use PDO;
use Core\Container;

class Cliente extends BaseModel {
    
    protected $table = "tb_cliente";
    private $cpf;
    private $tipo_cliente;
    private $nome_completo;
    private $data_nascimento;
    private $email;
    private $senha;
    private $data_cadastro;
    private $userInfo = array();
    private $userEnderecoInfo;
    private $enderecoLogradouroInfo;
    private $modelPermissoes;
    private $modelEndereco;
    private $modelLogradouro;
    private $modelBairro;
    private $modelCidade;
    private $modelUf;

    public function __construct($pdo, $cpf, $tipo_cliente, $nome_completo, $data_nascimento, $email, $senha, $data_cadastro) {
        parent::__construct($pdo);
        $this->cpf = $cpf;
        $this->tipo_cliente = $tipo_cliente;
        $this->nome_completo = $nome_completo;
        $this->data_nascimento = $data_nascimento;
        $this->email = $email;
        $this->senha = $senha;
        $this->data_cadastro = $data_cadastro;
        $this->modelPermissoes = Container::getModel("Permissoes");
        $this->modelEndereco = Container::getModel("Endereco");
        $this->modelLogradouro = Container::getModel("Logradouro");
        $this->modelBairro = Container::getModel("Bairro");
        $this->modelCidade = Container::getModel("Cidade");
        $this->modelUf = Container::getModel("Uf");
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

    public function logarUsuario($email) {
        try {
            $query = "SELECT id_cliente, cpf, nome_completo FROM {$this->table} WHERE email = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $email, PDO::PARAM_STR);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $row = $stmt->fetch();
                $_SESSION['ccUser']['id_cliente'] = $row->id_cliente;
                $_SESSION['ccUser']['cpf'] = $row->cpf;
                $_SESSION['ccUser']['nome_completo'] = $row->nome_completo;
                return true;
            } 
            return false;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
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

    public function getClienteEnderecoById($id) {
        try {
            $query = "SELECT cli.id_cliente as id, cli.nome_completo as nome, log.nome_logradouro as log, end.complemento as compl, 
            end.numero as num, bai.nome_bairro as bai, cid.nome_cidade as cid, uf.sigla_uf as uf FROM tb_cliente as cli JOIN tb_endereco as end ON 
            (end.fk_id_cliente = cli.id_cliente) JOIN tb_logradouro as log ON (log.id_logradouro = end.fk_id_logradouro)
            JOIN tb_bairro as bai ON (bai.id_bairro = end.fk_id_bairro) JOIN tb_cidade as cid ON (cid.id_cidade = bai.fk_id_cidade)
            JOIN tb_uf as uf ON (cid.fk_id_uf = uf.id_uf) WHERE cli.id_cliente = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $row = $stmt->fetchAll();
                $stmt->closeCursor();
                return $row;
            }
            return false;
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
    
    public function setLoggedUser() {
        if (isset($_SESSION['ccUser']) && !empty($_SESSION['ccUser'])) {
            try {
                $query = "SELECT id_cliente, cpf, tipo_cliente, nome_completo, data_nascimento, email, data_cadastro, fk_id_permissao_grupo"
                        . " FROM {$this->table} WHERE id_cliente = ?";
                $stmt = $this->pdo->prepare($query);
                $stmt->bindValue(1, $_SESSION['ccUser']['id_cliente'], PDO::PARAM_INT);
                $stmt->execute();
                if($stmt->rowCount() > 0) {
                    $this->userInfo = $stmt->fetch();
                    $this->modelPermissoes->setGrupo($this->userInfo->fk_id_permissao_grupo);
                    $this->modelEndereco->setEndereco($this->userInfo->id_cliente);
                    $this->modelLogradouro->setLogradouro($this->getIdLogradouroInEndereco());
                    $this->modelBairro->setBairro($this->getIdBairroInEndereco());
                    $this->modelCidade->setCidade($this->getIdCidadeBairro());
                    $this->modelUf->setUf($this->getIdUfCidade());
                    $stmt->closeCursor();
                }
            } catch (PDOException $exc) {
                if ($exc->getCode() == '42S02') {
                    echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
                }
                exit;
            }
        }
    }
    
    public function getPermissaoGrupo() {
        if (isset($this->userInfo->fk_id_permissao_grupo)) {
            return $this->userInfo->fk_id_permissao_grupo;
        } else {
            return false;
        }
    }
    
    public function possuiPermissao($name) {
        return $this->modelPermissoes->possuiPermissao($name);
    }

    public function getUserInfo() {
        if (isset($this->userInfo)) {
            return $this->userInfo;
        } else {
            return false;
        }
    }
    
    public function getIdLogradouroInEndereco() {
        if (isset($this->modelEndereco->getEnderecoUser()->fk_id_logradouro)) {
            return $this->modelEndereco->getEnderecoUser()->fk_id_logradouro;
        } else {
            return false;
        }
    }
    
    public function getIdBairroInEndereco() {
        if (isset($this->modelEndereco->getEnderecoUser()->fk_id_bairro)) {
            return $this->modelEndereco->getEnderecoUser()->fk_id_bairro;
        } else {
            return false;
        }
    }

    public function getUserEnderecoInfo() {
        if (isset($this->userEnderecoInfo)) {
            return $this->userEnderecoInfo;
        } else {
            return false;
        }
    }
    
    public function getEnderecoLogradouroInfo() {
        if (isset($this->enderecoLogradouroInfo)) {
            return $this->enderecoLogradouroInfo;
        } else {
            return false;
        }
    }
    
    public function getIdUfCidade() {
        if (isset($this->modelCidade->getCidadeBairro()->fk_id_uf)) {
            return $this->modelCidade->getCidadeBairro()->fk_id_uf;
        } else {
            return false;
        }
    }
    
    public function getIdCidadeBairro() {
        if (isset($this->modelBairro->getBairroCidade()->fk_id_cidade)) {
            return $this->modelBairro->getBairroCidade()->fk_id_cidade;
        } else {
            return false;
        }
    }
    
    public function getIdUser() {
        if (isset($this->userInfo->id_cliente)) {
            return $this->userInfo->id_cliente;
        } else {
            return false;
        }
    }    
    
    public function getUserInfoUser() {
        $array = array();
        if (isset($this->userInfo)) {
            $array['id_cliente'] = $this->userInfo->id_cliente;
            $array['cpf'] = $this->userInfo->cpf;
            $array['nome_completo'] = $this->userInfo->nome_completo;
            $array['data_nascimento'] = $this->userInfo->data_nascimento;
            $array['email'] = $this->userInfo->email;
            $array['nome_logradouro'] = $this->modelLogradouro->getLogradouroBairro()->nome_logradouro;
            $array['complemento'] = $this->modelEndereco->getEnderecoUser()->complemento;
            $array['numero'] = $this->modelEndereco->getEnderecoUser()->numero;
            $array['cep'] = $this->modelEndereco->getEnderecoUser()->cep;
            $array['nome_bairro'] = $this->modelBairro->getBairroCidade()->nome_bairro;
            $array['nome_cidade'] = $this->modelCidade->getCidadeBairro()->nome_cidade;
            $array['sigla_uf'] = $this->modelUf->getUfCidade()->sigla_uf;
            return $array;
        }
    }
    
    public function findUserInGrupo($id) {
        try {
            $stmt = $this->pdo->prepare("SELECT COUNT(id_cliente) AS user FROM {$this->table} WHERE fk_id_permissao_grupo = ?");
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch();
            if($row->user == 0) {
                return false;
                $stmt->closeCursor();
            } else {
                return true;
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }  
    }
    
}
