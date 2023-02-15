<?php
date_default_timezone_set("Europe/Istanbul");
setlocale(LC_ALL, 'tr_TR.UTF-8', 'tr_TR', 'tr', 'turkish');
include("ayarlar.php");
if(!empty($_REQUEST["sn"])&& is_numeric($_REQUEST["sn"])){
    $sn=$_REQUEST["sn"];
    try {
        $db=new PDO("mysql:host=$sunucu;dbname=$vt;charset=$karakter",$kadi,$ksifre);
        $sorgu="SELECT * FROM sayfalartablosu WHERE sayfano=:sn";
        $tablo=$db->prepare($sorgu);
        $tablo->bindParam(":sn",$sn,PDO::PARAM_INT);
        $tablo->execute();
        if($tablo->rowCount()==1){
            foreach ($tablo as $satir) {
                $sn=$satir["sayfano"];
                $sb=$satir["sayfabaslik"];
                $ak=$satir["anahtarkelimeler"];
                $sl=$satir["sayfalink"];
                $si=$satir["sayfaicerik"];
                $yt=strtotime($satir["yayinlamatarihi"]);
                $gt=strtotime($satir["guncellemetarihi"]);
                $guntar=iconv('latin5','utf-8',strftime("%d %B %Y %A %H:%M",$gt));
                $dil=$satir["dil"];
            }
        }else{
            $hata=TRUE;
        }
    } catch (PDOException $ex) {
        $hata=TRUE;
    }
}else{
    die(header("location:hata.php"));
}
$sayfa = <<< EOPAGE
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Sayfa Listesi</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <meta name="keywords" content="$ak">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <script src='main.js'></script>
</head>
<body>

<div class="container">
<header>
    <div class="row">
        <div class="col">
            <p class="h1">$sb</p>
        </div>
    </div>
</header>
    <div class="row">
        <div class="col">
            <p class="tarih">$guntar</p>
        </div>
    </div>

    <div class="row">
        <div class="col">
            $si
        </div>
    </div>
    <div class="duzenle">  <a class="btn btn-link" href="sayfaduzen.php?sn=$sn">
    <i class="far fa-edit fa-2x"> Sayfayı Düzenle</i>
    </a></div>
<footer class="page-footer font-small blue">
    <div class="row">
        <div class="col">
        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2021 Copyright:
        </div>
        <!-- Copyright -->
        </div>
    </div>
</footer>

</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
EOPAGE;
echo $sayfa;
?>