<?php

namespace App\Models;

use Core\BaseModel;


class Cidade extends BaseModel
{
    protected $table = "tb_cidade";
    private $nome_cidade;

    /**
     * Cidade constructor.
     * @param $nome_cidade
     */
    public function __construct($pdo, $nome_cidade)
    {
        parent::__construct($pdo);
        $this->nome_cidade = $nome_cidade;
    }


}