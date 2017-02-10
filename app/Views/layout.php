<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php $this->getPageTitle("|"); ?>Pizzaria Novo Sabor</title>
        <link href="/assets/css/style.css" rel="stylesheet">
        <link rel="icon" href="/favicon.png" type="image/x-icon">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <header id="header">
        <?php
            if (!isset($_SESSION['ccUser']) && empty($_SESSION['ccUser'])) {
                require_once __DIR__ . "/menu.php";
            } else {
                require_once __DIR__ . "/menulog.php";
            }
        ?>
    </header>
    <body>
        <main>    
        <?php $this->content(); ?>	
        </main>
        
        <script src="/assets/js/jquery-3.1.0.min.js"></script>
        <script src="/assets/js/bootstrap.min.js"></script>
        <script src="/assets/js/jquery.maskMoney.js"></script>
        <script src="/assets/js/jquery.maskedinput.js"></script>
        <script type="text/javascript">
            jQuery(function($){
                $("#cpf").mask("999.999.999-99");
                $("#tel_celular").mask("(99) 99999-9999");
            });
            $(function(){
                $("#dropdown_menu").mouseover(function(){
                    $("#dropdown-content").css("display", "block");
                });
            });
            $(function () {
                $("#dropdown-content").mouseleave(function(){
                    $("#dropdown-content").css("display", "none");
                });
            })
        </script>
    </body>
</html>