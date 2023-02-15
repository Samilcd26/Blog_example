<?php
session_start();
$oturum="";
    if(!empty($_SESSION["kul_bil"])){
        $oturum="<a href=\"kapat.php\" type=\"button\" class=\"btn btn-warning\">Oturumu Kapat</a>";
    }else{
        die(header("location:index.php"));
    }
?>