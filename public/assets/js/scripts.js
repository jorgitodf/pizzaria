$(document).ready(function () {
    
    //BUSCAR DADOS CATEGORIA PARA PREENCHER MENU NO HOME CLIENTE
    var buscar_menu = $("#menu_cardapio").attr("data-toggle");
        $.ajax({
            type: "POST",
            url: "/menu/buscar",
            data: {buscar_menu: buscar_menu},
            dataType: 'json',
            success: function (retorno) {
                if (retorno.status === 'error' ) {
                    Reset();
                } else if (retorno.status === 'success') {
                    var option = '<option value="">Filtrar Menu</option>';
                    $.each(retorno.message, function(i, obj) {
                        option += '<option value="'+ obj.id_categoria + '">' + obj.categoria + '</option>';
                    });
                    $('#menu').html(option); 
                }
                else {
                    alert(retorno);
                }
            },
            fail: function(){
                alert('ERRO: Falha ao carregar o script.');
            }
        });

    //CAPTURA O VALOR DA CATEGORIA AO SER SELECIONADA COM O MOUSE MENU NO HOME CLIENTE
    $("#menu").change(function(){
        var categoria = $("#menu").val();
        
    });
        
        
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
                        $('.retorno').html('<div class="alert alert-success msgSuccess" id="msgEndCadSucesso">' + retorno.message + '</div>');
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
   
    //CADASTRO DE BAIRRO MODAL
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
                        $('#retorno').html('<div class="alert alert-danger msgError" id="msgErroCadBairo">' + retorno.message + '</div>');
                    } else if (retorno.status === 'success'){
                        $('#retorno').html('<div class="alert alert-success msgSuccess" id="">' + retorno.message + '</div>');
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
    
    //BOTÃO FECHAR NO MODAL DE CADASTRO DE BAIRRO 
    $('#btn_fechar_modal_cad_bairro').click(function () {
        $("#cmbUf").val("");
        $("#cmbCidadeBairro").val("");
        $("#nome_bairro_modal").val("");
        $(".msgError").html("");
        $(".msgError").css("display", "none");
        $(".msgSuccess").html("");
        $(".msgSuccess").css("display", "none");
        var idcidade = $("#cmbCidade").val();
        $.ajax({
            type: "POST",
            url: "/cidade/buscar",
            data: {nome_cidade: idcidade},
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
 
});