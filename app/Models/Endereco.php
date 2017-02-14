<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;
use Core\Helpers;

class Endereco extends BaseModel
{
    protected $table = "tb_endereco";
    private $complemento;
    private $numero;
    private $cep;
    private $idUser;
    private $uf;
    private $cidade;
    private $bairro;
    private $logradouroCad;
    private $tipoEndereco;
    private $endereco = array();

    /**
     * @param type $pdo
     * @param type $complemento
     * @param type $numero
     * @param type $cep
     * @param type $uf
     * @param type $cidade
     * @param type $logradouroCad
     * @param type $bairro
     * @param type $tipoEndereco
     */
    public function __construct($pdo, $complemento, $numero, $cep, $uf, $cidade, $logradouroCad, $bairro, $tipoEndereco)
    {
        parent::__construct($pdo);
        $this->complemento = $complemento;
        $this->numero = $numero;
        $this->cep = $cep;
        $this->uf = $uf;
        $this->cidade = $cidade;
        $this->logradouroCad = $logradouroCad;
        $this->bairro = $bairro;
        $this->tipoEndereco = $tipoEndereco;
    }
    
    /**
     * @return type
     */
    public function getTable() {
        return $this->table;
    }
    
    public function getComplemento() {
        return $this->complemento;
    }

    public function getNumero() {
        return $this->numero;
    }

    public function getCep() {
        return $this->cep;
    }

    /**
     * @param type $complemento
     * @return type
     */
    public function setComplemento($complemento) {
        if (Helpers::validaComplemento($complemento) == true) {
            return Helpers::validaComplemento($complemento);
        } else {
            $this->complemento = $complemento;
        }
    }

    /**
     * @param type $numero
     * @return type
     */
    public function setNumero($numero) {
        if (Helpers::validaNumero($numero) == true) {
            return Helpers::validaNumero($numero);
        } else {
            $this->numero = $numero;
        }
    }

    /**
     * @param type $cep
     * @return type
     */
    public function setCep($cep) {
        if (Helpers::validaCep($cep) == true) {
            return Helpers::validaCep($cep);
        } else {
            $this->cep = $cep;
        }
    }

        
    /**
     * @param $id
     * @return array
     */
    public function setEndereco($idUser) {
        $this->idUser = $idUser;
        try {
            $query = "SELECT * FROM {$this->table} WHERE fk_id_cliente = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->idUser, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $this->endereco = $stmt->fetch();
                $stmt->closeCursor();
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function getEnderecoUser() {
        if (isset($this->endereco)) {
            return $this->endereco;
        } else {
            return false;
        }
    }

    
    
    public function getUf() {
        return $this->uf;
    }

    /**
     * @param type $uf
     * @return type
     */
    public function setUf($uf) {
        if (Helpers::validaUf($uf) == true) {
            return Helpers::validaUf($uf);
        } else {
            $this->uf = $uf;
        }
    }

    /**
     * @return type
     */
    public function getCidade() {
        return $this->cidade;
    }

    /**
     * @param type $cidade
     * @return type
     */
    public function setCidade($cidade) {
        if (Helpers::validaCidade($cidade) == true) {
            return Helpers::validaCidade($cidade);
        } else {
            $this->cidade = $cidade;
        }
    }

    public function getLogradouroCad() {
        return $this->logradouroCad;
    }

    /**
     * @param type $logradouroCad
     * @return type
     */
    public function setLogradouroCad($logradouroCad) {
        if (Helpers::validaLogradouroCad($logradouroCad) == true) {
            return Helpers::validaLogradouroCad($logradouroCad);
        } else {
            $this->logradouroCad = $logradouroCad;;
        }
    }
    
    /**
     * @return type
     */
    public function getBairro() {
        return $this->bairro;
    }
    /**
     * @param type $bairro
     * @return type
     */
    public function setBairro($bairro) {
        if (Helpers::validaBairro($bairro) == true) {
            return Helpers::validaBairro($bairro);
        } else {
            $this->bairro = $bairro;
        }
    }
    
    public function getTipoEndereco() {
        return $this->tipoEndereco;
    }

    /**
     * @param type $tipoEndereco
     * @return type
     */
    public function setTipoEndereco($tipoEndereco) {
        if (Helpers::validaTipoEndereco($tipoEndereco) == true) {
            return Helpers::validaTipoEndereco($tipoEndereco);
        } else {
            $this->tipoEndereco = $tipoEndereco;;
        }
    }

    public function cadastrarEndereco($idCliente) {
        $tipo_endereco = "";
        if ($this->tipoEndereco == 1) {
            $tipo_endereco = 'Casa';
        } else {
            $tipo_endereco = 'Trabalho';
        }
        try {
            $this->pdo->beginTransaction();
            $query = "INSERT INTO {$this->table} (complemento, numero, cep, fk_id_bairro, fk_id_logradouro, fk_id_cliente, tipo_endereco) "
                . "VALUES (?,?,?,?,?,?,?)";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $this->complemento, PDO::PARAM_STR);
            $stmt->bindValue(2, $this->numero, PDO::PARAM_INT);
            $stmt->bindValue(3, Helpers::formataCep($this->cep), PDO::PARAM_INT);
            $stmt->bindValue(4, $this->bairro, PDO::PARAM_INT);
            $stmt->bindValue(5, $this->logradouroCad, PDO::PARAM_INT);
            $stmt->bindValue(6, $idCliente, PDO::PARAM_INT);
            $stmt->bindValue(7, $tipo_endereco, PDO::PARAM_STR);
            $stmt->execute();
            $this->pdo->commit();
            return 1;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            if ($exc->getCode() == '42S02') {
                return "A Tabela <b>{$this->table}</b> Ainda Não Existe..";
            } else {
                return $exc->getMessage();
            }
        }
    }
}