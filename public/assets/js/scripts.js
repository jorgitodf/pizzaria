$(document).ready(function () {

    $("#sigla_uf").change(function(e){
        var sigla_uf = $("#sigla_uf").val();
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/uf/buscar",
            data: {sigla_uf: sigla_uf},
            dataType: 'json',
            success: function (retorno) {
                if (retorno.status === 'error' ) {
                    Reset();
                } else if (retorno.status === 'success') {
                    var option = '<option>Cidade</option>';
                    $.each(retorno.message, function(i, obj) {
                        option += '<option value="' + obj.id_cidade + '">' + obj.nome_cidade + '</option>';
                    });
                    $('#cmbCidade').html(option).show(); 
                }
                else {
                    alert(retorno);
                }
            },
            fail: function(){
                alert('ERRO: Falha ao carregar o script.');
            }
        });
    });
    
    $("#cmbCidade").change(function(e){
        var nome_cidade = $("#cmbCidade").val();
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/cidade/buscar",
            data: {nome_cidade: nome_cidade},
            dataType: 'json',
            success: function (retorno) {
                if (retorno.status === 'error' ) {
                    Reset();
                    alert(retorno.message);
                } else if (retorno.status === 'success') {
                    var option = '<option>Bairro</option>';
                    $.each(retorno.message, function(i, obj) {
                        option += '<option value="' + obj.id_bairro + '">' + obj.nome_bairro + '</option>';
                    });
                    $('#cmbBairro').html(option).show(); 
                }
                else {
                    alert(retorno);
                }
            },
            fail: function(){
                alert('ERRO: Falha ao carregar o script.');
            }
        });
    });
    
    $("#cmbUf").change(function(e){
        var sigla_uf = $("#cmbUf").val();
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/uf/buscar",
            data: {sigla_uf: sigla_uf},
            dataType: 'json',
            success: function (retorno) {
                if (retorno.status === 'error' ) {
                    Reset();
                } else if (retorno.status === 'success') {
                    var option = '<option>Cidade</option>';
                    $.each(retorno.message, function(i, obj) {
                        option += '<option value="' + obj.id_cidade + '">' + obj.nome_cidade + '</option>';
                    });
                    $('#cmbCidadeBairro').html(option).show(); 
                }
                else {
                    alert(retorno);
                }
            },
            fail: function(){
                alert('ERRO: Falha ao carregar o script.');
            }
        });
    });
    
    function Reset(){
        $('#cmbCidade').empty().append('<option>Cidade</option>>');
        $('#cmbBairro').empty().append('<option>Bairro</option>>');
    }


    //CADASTRO DE ENDEREÇO
     $(function () {
        $("#form_cad_endereco").submit(function(e) {
            $(".msgError").html("");
            $(".msgError").css("display", "none");
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: $(this).attr("action"),
                data: $(this).serialize(),
                dataType: 'json',
                success: function (retorno) {
                    if (retorno.status === 'error' ){
                        $('.retorno').html('<div class="alert alert-danger msgError" id="div_ret_cad_end">' + retorno.message + '</div>');
                    } else if (retorno.status === 'success'){
                        //$('.retorno').html('<span class="alert alert-success" id="msgUserCadSucesso">' + retorno.message + '</span>');
                        alert(retorno.message);
                    }
                    else {
                        alert(retorno);
                    }
                },
                fail: function(){
                    alert('ERRO: Falha ao carregar o script.');
                }
            });
        });
    });
   
    //CADASTRO DE BAIRRO
     $(function () {
        $("#form_cad_bairro").submit(function(e) {
            $(".msgError").html("");
            $(".msgError").css("display", "none");
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: $(this).attr("action"),
                data: $(this).serialize(),
                dataType: 'json',
                success: function (retorno) {
                    if (retorno.status === 'error' ){
                        $('#retorno').html('<div class="alert alert-danger msgError" id="">' + retorno.message + '</div>');
                    } else if (retorno.status === 'success'){
                        //$('.retorno').html('<span class="alert alert-success" id="msgUserCadSucesso">' + retorno.message + '</span>');
                        alert(retorno.message);
                    }
                    else {
                        alert(retorno);
                    }
                },
                fail: function(){
                    alert('ERRO: Falha ao carregar o script.');
                }
            });
        });
    });
 
});