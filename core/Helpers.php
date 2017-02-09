<?php

namespace Core;

abstract class Helpers {
    
    public static function validaSenha($senha) {
        $array = array('erroSenha'=>'');
        if (empty($senha) || $senha = "") {
            $array['erroSenha'] = "Preencha a sua Senha!";
        }
        return $array;
    }
    
    public static function validaEmail($email) {
        $array = array('erroEmail'=>'');
        if (empty($email) || $email = "") {
            $array['erroEmail'] = "Preencha o Campo do E-mail!";
        }
        return $array;
    }

    public static function validaNomeCadastro($nome) {
        $array = array();
        if (empty($nome)) {
            $array['erroNome'] = "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_nome_cliente'>Preencha o seu Nome Completo!</span><br/>";
        } elseif (preg_match('/^[a-z A-Z]+$/', $nome) == false) {
            $array['erroNomeNumero'] = "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_nome_cliente_sem_numeros'>O Campo Nome não aceita Números!</span><br/>";
        }
        return $array;
    }

    public static function validaConfirmaSenha($senha, $senha_confirm) {
        $array = array();
        if (empty($senha_confirm)) {
            $array['erroSenha2'] = "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_senha2_cad_cliente'>Digite a Confirmação da sua Senha!</span><br/>";
        } elseif ($senha != $senha_confirm) {
            $array['erroSenha2'] = "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_senha2_cad_cliente'>As Senhas Não São Iguais!</span><br/>";
        }
        return $array;
    }


    public static function validaCadastroUsuario($tel_celular, $cpf) {
        $array = array();
        if (empty($tel_celular)) {
            $array['erroTelefone'] = "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_telef_cad_cliente'>Digite o seu Número de Telefone!</span><br/>";
        } else {
            $array['tel_celular'] = $tel_celular;
        }
        if (empty($cpf)) {
            $array['erroCpf'] = "<span class='alert alert-danger msg_erro_validacao' role='alert' id='msg_erro_cpf_cad_cliente'>Digite o seu CPF!</span><br/>";
        } else {
            $array['cpf'] = $cpf;
        }
        return $array;
    }
    
    public static function verificaEmailExiste($mail) {
        $modelEmail = Container::getModel("Email");
        $emailExiste = $modelEmail->existeEmail($mail);
        if ($emailExiste == true) {
            return $emailExiste;
        }
    }
    
    public static function limparTelefone($numero) {
        $num = str_replace("-", "", $numero);
        $num1 = str_replace("(", "", $num);
        $num2 = str_replace(")", "", $num1);
        $num3 = str_replace(" ", "", $num2);
        return $num3;
    }
    
    public static function limparCpf($cpf) {
        $cpf1 = str_replace("-", "", $cpf);
        $cpf2 = str_replace(".", "", $cpf1);
        return $cpf2;
    }

    public static function cryptySenha($senha) {
        $custo = '08';
        $salt = 'Cf1f11ePArKlBJomM0F6aJ';
        $hash = crypt($senha, '$2a$' . $custo . '$' . $salt . '$');
        return $hash;
    }

    public static function retornaHora($paramentro) {
        date_default_timezone_set('America/Sao_Paulo');
        if ($paramentro == 'dataAtual') {
            return date("Y-m-d H:i:s");
        }
    }

    public static function consultaSenhaCrypty($senha, $hash) {
        if (crypt($senha, $hash) === $hash) {
            return true;
        } else {
            return false;
        }
    }

}
