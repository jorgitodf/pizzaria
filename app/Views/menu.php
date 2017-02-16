
<nav class="navbar navbar-default" id="nav_bar">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/" id="titulo_site_nav">Pizzaria Novo Sabor</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <?php if (!isset($_SESSION['ccUser']) && empty($_SESSION['ccUser'])): ?>
            <ul class="nav navbar-nav" id="nav_bar_info">
                <li class="dropdown" id="dropdown_menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sobre a Pizzaria</a>
                    <ul class="dropdown-menu" id="dropdown-content">
                        <li><a href="/login/quem-somos">Quem Somos</a></li>
                        <li><a href="/login/termos">Termos e Condições de Uso</a></li>
                        <li><a href="#">Privacidade</a></li>
                    </ul>
                </li>
            </ul>
            <?php else: ?>
            <?php if (isset($this->view->permissao) && $this->view->permissao == 'Admin'): ?>
                <ul class="nav navbar-nav" id="nav_bar_admin">
                    <li class="dropdown" id="dropdown_menu_admin">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administração</a>
                        <ul class="dropdown-menu" id="dropdown-content_admin">
                            <li><a href="/permissoes">Permissões</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav" id="nav_bar_menu_cadastros">
                    <li class="dropdown" id="dropdown_menu_cad">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastros</a>
                        <ul class="dropdown-menu" id="dropdown-content_menu_cad">
                            <li><a href="/produtos">Produtos</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav" id="ul_nav_nome_user_admin">
                    <li>
                        <span><b>Seja bem Vindo(a):</b> <?php echo $_SESSION['ccUser']['nome_completo']; ?></span>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right" id="ul_logout">
                    <li><a href="/login/logout">Logout</a></li>
                </ul>
            <?php elseif ($this->view->permissao == 'Cliente'): ?>
                <ul class="nav navbar-nav" id="ul_nav_nome_user">
                    <li>
                        <span><b>Seja bem Vindo(a):</b> <?php echo $_SESSION['ccUser']['nome_completo']; ?></span>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right" id="ul_logout">
                    <li><a href="/login/logout">Logout</a></li>
                </ul>
            <?php endif; ?>
            <?php endif; ?>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
