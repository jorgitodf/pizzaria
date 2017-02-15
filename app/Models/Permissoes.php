<?php

namespace App\Models;

use Core\BaseModel;
use PDOException;
use PDO;
use Core\Helpers;
use Core\Container;

class Permissoes extends BaseModel {
    
    protected $tablePg = "tb_permissao_grupo";
    protected $tablePp = "tb_permissao_parametros";
    private $nome_permissao;
    private $idGrupo;
    private $nome_grupo;
    private $parametros_permissao = array();
    private $parametros;
    private $nome_parametro;

    public function __construct($pdo, $nome_grupo, $parametros, $nome_permissao, $parametros_permissao) {
        parent::__construct($pdo);
        $this->nome_grupo = $nome_grupo;
        $this->parametros = $parametros;
        $this->nome_permissao = $nome_permissao;
        $this->parametros_permissao = $parametros_permissao;
    }
    
    /**
     * @return type
     */
    public function getNome_permissao() {
        return $this->nome_permissao;
    }
    
    /**
     * @param type $nome_permissao
     * @return type
     */
    public function setNome_permissao($nome_permissao) {
        if (Helpers::validaNomePermissao($nome_permissao)['erroNomePermissao'] == true) {
            return Helpers::validaNomePermissao($nome_permissao);
        } else {
            $this->nome_permissao = $nome_permissao;
        }
    }
    
    public function getNome_grupo() {
        return $this->nome_grupo;
    }

    public function getParametros_permissao() {
        return $this->parametros_permissao;
    }
    
    /**
     * @param type $nome_grupo
     * @return type
     */
    public function setNome_grupo($nome_grupo) {
        if (Helpers::validaNomeGrupoPermissao($nome_grupo)['erroNomeGrupo'] == true) {
            return Helpers::validaNomeGrupoPermissao($nome_grupo);
        } else {
            $this->nome_grupo = $nome_grupo;
        }
    }
    
    /**
     * @param type $parametros_permissao
     * @return type
     */
    public function setParametros_permissao($parametros_permissao) {
        if (Helpers::validaNomeParametrosGrupoPermissao($parametros_permissao)['erroParametros'] == true) {
            return Helpers::validaNomeParametrosGrupoPermissao($parametros_permissao);
        } else {
            $this->parametros_permissao = $parametros_permissao;
        }
    }

    public function getGrupo($id) {
        try {
            $query = "SELECT * FROM {$this->tablePg} WHERE id_permissao_grupo = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $row = $stmt->fetch();
                $row->parametros = explode(',', $row->parametros);
                $stmt->closeCursor();
            }
            return $row;
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->tablePg}</b> Ainda Não Existe..";
            }
            exit;
        }
    }

    public function setGrupo($id) {
        $this->idGrupo = $id;
        $this->permissoes = array();
        try {
            $query = "SELECT * FROM {$this->tablePg} WHERE id_permissao_grupo = ?";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $row = $stmt->fetchAll();
                if (empty($row[0]->parametros)) {
                    $row[0]->parametros = '0';
                }
                //$params = $row->parametros;
                $query = "SELECT nome_parametro FROM {$this->tablePp} WHERE id_permissao_parametros IN (?)";
                $stmt = $this->pdo->prepare($query);
                $stmt->bindValue(1, $row[0]->parametros, PDO::PARAM_INT);
                $stmt->execute();
                if ($stmt->rowCount() > 0) {
                    foreach ($stmt->fetchAll() as $item) {
                        $this->permissoes[] = $item->nome_parametro;
                    }
                } else {
                    $this->permissoes[] = "noPermission";
                }
                $stmt->closeCursor();
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->tablePg}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function possuiPermissao($name) {
        if (in_array($name, $this->permissoes)) {
            return true;
        } else {
            return false;
        }
    }
    
    public function getListaPermissoes() {
        $array = array();
        try {
            $query = "SELECT * FROM {$this->tablePp}";
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $array = $stmt->fetchAll();
                $stmt->closeCursor();
                return $array;
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->tablePp}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function getListaGrupos() {
        $array = array();
        try {
            $query = "SELECT * FROM {$this->tablePg}";
            $stmt = $this->pdo->prepare($query);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $array = $stmt->fetchAll();
                $stmt->closeCursor();
                return $array;
            }
        } catch (PDOException $exc) {
            if ($exc->getCode() == '42S02') {
                echo "A Tabela <b>{$this->tablePp}</b> Ainda Não Existe..";
            }
            exit;
        }
    }
    
    public function addNovaPermissao() {
        try {
            $this->pdo->beginTransaction();
            $stmt = $this->pdo->prepare("INSERT INTO {$this->tablePp} (nome_parametro) VALUES (?)");
            $stmt->bindValue(1, $this->nome_permissao, PDO::PARAM_STR);
            $stmt->execute();
            $this->pdo->commit();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            return $exc->getMessage();
        }
    }
    
    public function addNovoGrupo() {
        $parametros = implode(',', $this->parametros_permissao);
        try {
            $this->pdo->beginTransaction();
            $stmt = $this->pdo->prepare("INSERT INTO {$this->tablePg} (nome_grupo, parametros) VALUES (?,?)");
            $stmt->bindValue(1, $this->nome_grupo, PDO::PARAM_STR);
            $stmt->bindValue(2, $parametros, PDO::PARAM_STR);
            $stmt->execute();
            $this->pdo->commit();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            return $exc->getMessage();
        }
    }
    
    public function editarGrupo($id) {
        $parametros = implode(',', $this->parametros_permissao);
        try {
            $this->pdo->beginTransaction();
            $stmt = $this->pdo->prepare("UPDATE {$this->tablePg} SET nome_grupo = ?, parametros = ? WHERE id_permissao_grupo = ?");
            $stmt->bindValue(1, $this->nome_grupo, PDO::PARAM_STR);
            $stmt->bindValue(2, $parametros, PDO::PARAM_STR);
            $stmt->bindValue(3, $id, PDO::PARAM_INT);
            $stmt->execute();
            $this->pdo->commit();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            return $exc->getMessage();
        }
    }
    
    public function deletePermissao($id) {
        try {
            $this->pdo->beginTransaction();
            $stmt = $this->pdo->prepare("DELETE FROM {$this->tablePp} WHERE id_permissao_parametros = ?");
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
            $this->pdo->commit();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $exc) {
            $this->pdo->rollback();
            return $exc->getMessage();
        }
    }
    
    public function deleteGrupo($id) {
        $this->modelCliente = Container::getModel("Cliente");
        if ($this->modelCliente->findUserInGrupo($id) == false) {
            try {
                $this->pdo->beginTransaction();
                $stmt = $this->pdo->prepare("DELETE FROM {$this->tablePg} WHERE id_permissao_grupo = ?");
                $stmt->bindValue(1, $id, PDO::PARAM_INT);
                $stmt->execute();
                $this->pdo->commit();
                $stmt->closeCursor();
                return true;
            } catch (PDOException $exc) {
                $this->pdo->rollback();
                return $exc->getMessage();
            } 
        }
        return false;
    }
}
