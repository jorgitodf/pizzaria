<?php

namespace App\Models;

use Core\BaseModel;
use PDO;
use PDOException;

class Endereco extends BaseModel
{
    protected $table = "tb_endereco";
    private $complemento;
    private $numero;
    private $cep;
    private $idUser;
    private $endereco = array();

    /**
     * Endereco constructor.
     * @param $complemento
     * @param $numero
     * @param $cep
     */
    public function __construct($pdo, $complemento, $numero, $cep)
    {
        parent::__construct($pdo);
        $this->complemento = $complemento;
        $this->numero = $numero;
        $this->cep = $cep;
    }
    
    /**
     * @return type
     */
    public function getTable() {
        return $this->table;
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
    

}