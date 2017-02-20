<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php $this->getPageTitle("|"); ?>Pizzaria Novo Sabor</title>
        <link href="/assets/css/style.css" rel="stylesheet">
        <link href="/assets/js/jquery-ui-1.12.1.custom/jquery-ui.min.css" rel="stylesheet">
        <link rel="icon" href="/favicon.png" type="image/x-icon">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <header id="header">
        <?php $this->menu(); ?>
    </header>
    <body>
        <main id="main_principal">    
        <?php $this->content(); ?>	
        </main>
        
        <script src="/assets/js/jquery-3.1.0.min.js"></script>
        <script src="/assets/js/bootstrap.min.js"></script>
        <script src="/assets/js/jquery.maskMoney.js"></script>
        <script src="/assets/js/jquery.maskedinput.js"></script>
        <script src="/assets/js/scripts.js"></script>
        <script src="/assets/js/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#preco_compra").maskMoney({showSymbol: true, symbol: "R$ ", decimal: ",", thousands: "."});
            });
            jQuery(function($){
                $("#cpf").mask("999.999.999-99");
                $("#tel_celular").mask("(99) 99999-9999");
                $("#cep").mask("99999-999");
            });
            $(function(){
                $("#dropdown_menu_admin").mousemove(function(){
                    $("#dropdown-content_admin").css("display", "block");
                });
            });
            $(function () {
                $("#dropdown-content_admin").mouseleave(function(){
                    $("#dropdown-content_admin").css("display", "none");
                });
            });
            
            $(function(){
                $("#dropdown_menu_cad").mousemove(function(){
                    $("#dropdown-content_menu_cad").css("display", "block");
                });
            });
            $(function(){
                $("#dropdown-content_menu_cad").mouseleave(function(){
                    $("#dropdown-content_menu_cad").css("display", "none");
                });
            });
            
            $(function () {
                $("body").mouseleave(function(){
                    $("#dropdown-content_admin").css("display", "none");
                    $("#dropdown-content_menu_cad").css("display", "none");
                });
            });
            $(function () {
                $("#titulo_site_nav").mouseover(function(){
                    $("#dropdown-content_admin").css("display", "none");
                    $("#dropdown-content_menu_cad").css("display", "none");
                });
                $("#dropdown_menu_cad").mouseover(function(){
                    $("#dropdown-content_admin").css("display", "none");
                });
                $("#dropdown_menu_admin").mouseover(function(){
                    $("#dropdown-content_menu_cad").css("display", "none");
                });
            });
            $(function() { 
                $("#data_compra").datepicker({
                    dateFormat: 'dd/mm/yy', 
                    changeMonth: true,changeYear: true, 
                    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
                    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
                    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
                    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']
                });
            });
        </script>
    </body>
</html>