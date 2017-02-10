<?php

namespace App\Models;

use Core\BaseModel;


class Uf extends BaseModel
{
    protected $table = "tb_uf";
    private $sigla_uf;

    /**
     * Uf constructor.
     * @param $sigla_uf
     */
    public function __construct($pdo, $sigla_uf)
    {
        parent::__construct($pdo);
        $this->sigla_uf = $sigla_uf;
    }


}