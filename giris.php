<?php
session_start();
include("ayarlar.php");

if(!empty($_POST["uname"])&&!empty($_POST["psw"])){
    $uname=$_POST["uname"];
    $psw=$_POST["psw"];
    $psw=md5($psw);
    
    try {
        $db=new PDO("mysql:host=$sunucu;dbname=$vt;charset=$karakter",$kadi,$ksifre);
        $sorgu="SELECT * FROM kullanicitablosu 
        WHERE kullaniciadi=:uname AND kullanicisifre=:psw";
        
        $tablo=$db->prepare($sorgu);
        $tablo->bindParam(":uname",$uname,PDO::PARAM_STR);
        $tablo->bindParam(":psw",$psw,PDO::PARAM_STR);
        $tablo->execute();
        if($tablo->rowCount()==1){
            foreach ($tablo as $satir) {
                if(($satir["kullaniciadi"]==$uname) && ($satir["kullanicisifre"]==$psw)){
                    $_SESSION["kul_bil"]=$uname;
                    die(header("location:sayfalistesi.php"));
                }else{
                    
                    die(header("location:index.php"));
                }
            }
        }else{
            die(header("location:index.php"));
        }
    } catch (PDOException $ex) {
        
        $db=new PDO("mysql:host=$sunucu;dbname=$vt;charset=$karakter",$kadi,$ksifre);
        echo "$conn";
       // die(header("location:index.php"));
    }
}else{
    die(header("location:index.php"));
}
?>