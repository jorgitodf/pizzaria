$(document).ready(function () {
    
    $(function () {
        $("#sigla_uf").blur(function(e){
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
        function Reset(){
            $('#cmbCidade').empty().append('<option>Cidade</option>>');
        }
    });

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
   
   
 
});