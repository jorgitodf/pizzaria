<?php
/**
 * Created by PhpStorm.
 * User: jorgito.paiva
 * Date: 10/02/2017
 * Time: 16:26
 */

namespace App\Models;

use Core\BaseModel;

class Bairro extends BaseModel
{
    protected $table = "tb_bairro";
    private $nome_bairro;

    /**
     * Bairro constructor.
     * @param $nome_bairro
     */
    public function __construct($pdo, $nome_bairro)
    {
        parent::__construct($pdo);
        $this->nome_bairro = $nome_bairro;
    }
}