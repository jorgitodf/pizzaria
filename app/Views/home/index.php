
<h2>Página Home</h2>

<?php 
    foreach ($this->view->cliente  as $key => $value) {
        echo $value->nome;
    }
?>