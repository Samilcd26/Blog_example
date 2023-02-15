<?php
include("kontrol.php");
include_once("ayarlar.php");

if(!empty($_POST["sayfano"])&&is_numeric($_POST["sayfano"])){
    $sn=$_POST["sayfano"];
    try {
        $db=new PDO("mysql:host=$sunucu;dbname=$vt;charset=$karakter",$kadi,$ksifre);
        $sorgu="DELETE FROM sayfalartablosu WHERE sayfano=:sn";
        $tablo=$db->prepare($sorgu);
        $tablo->bindParam(":sn",$sn,PDO::PARAM_INT);
        $tablo->execute();
        die(header("location:sayfalistesi.php"));
    } catch (PDOException $ex) {
        die(header("location:sayfalistesi.php"));
    }
}else{
    die(header("location:sayfalistesi.php"));
}
?>