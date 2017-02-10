<?php
/**
 * Created by PhpStorm.
 * User: jorgito.paiva
 * Date: 10/02/2017
 * Time: 16:29
 */

namespace App\Models;

use Core\BaseModel;

class Endereco extends BaseModel
{
    protected $table = "tb_endereco";
    private $complemento;
    private $numero;
    private $cep;

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
}