<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Sayfa Listesi</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
</head>
<body>
<div class="container">
  <?php 
  include("kontrol.php");
  echo $oturum;
  ?>
    <div class="row">
        <div class="col">
            <p class="h1">Sayfa Listesi</p>
            <hr/>
        </div>
    </div>
    <div class="row">
        <div class="col">
        <a href="sayfaekle.php" class="btn btn-primary"><i class="far fa-plus-square"></i> Yeni sayfa ekle</a>
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Sayfa Başlışı</th>
                    <th scope="col">Anahtar Kelimeler</th>
                    <th scope="col">Sayfa Linki</th>
                    <th scope="col">Sayfa içeriği</th>
                    <th scope="col">Yayınlama Tarihi</th>
                    <th scope="col">Güncelleme Tarihi</th>
                    <th scope="col">Dil</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
                    <?php
                    include_once("ayarlar.php");
                    try {
                        $db=new PDO("mysql:host=$sunucu;dbname=$vt;charset=$karakter",$kadi,$ksifre);
                        
                        $sorgu="SELECT COUNT(*) FROM sayfalartablosu";
                        $toplamsatir=$db->query($sorgu)->fetchColumn();
                        $toplamsayfa=ceil($toplamsatir/$listelemesayisi);
                        $sayfa=!empty($_GET["s"])?$_GET["s"]:1;
                        if($sayfa>$toplamsayfa) $sayfa=$toplamsayfa;
                        if($sayfa<1)$sayfa=1;
                        $baslangicindeks=($sayfa-1)*$listelemesayisi;
                        $sorgu="SELECT * FROM sayfalartablosu ORDER BY guncellemetarihi DESC
                        LIMIT :indeks,:satirsayisi";
                        #$tablo=$db->query($sorgu);
                        $tablo=$db->prepare($sorgu);
                        $tablo->bindParam(":indeks",$baslangicindeks,PDO::PARAM_INT);
                        $tablo->bindParam(":satirsayisi",$listelemesayisi,PDO::PARAM_INT);
                        $tablo->execute();
                        $sirano=$baslangicindeks;

                        foreach ($tablo as $satir) {
                            $sirano++;
                            $sn=$satir["sayfano"];
                            $sb=$satir["sayfabaslik"];
                            $ak=$satir["anahtarkelimeler"];
                            $sl=$satir["sayfalink"];
                            $si=$satir["sayfaicerik"];
                            $si=strip_tags($si);#html ve js kodlarını temizler
                            $uzunluk=mb_strlen($si)>300?mb_stripos($si," ",300):300;
                            $si=mb_substr($si,0,$uzunluk)."<a href=\"sayfa.php?sn=$sn\">(Devamını oku)</a>";
                            $yt=$satir["yayinlamatarihi"];
                            $gt=$satir["guncellemetarihi"];
                            $dil=$satir["dil"];
                            echo "<tr>";
                            echo "<th scope=\"row\">$sirano</th>";
                            echo "<td>$sb</td>";
                            echo "<td>$ak</td>";
                            echo "<td>$sl</td>";
                            echo "<td>$si</td>";
                            echo "<td>$yt</td>";
                            echo "<td>$gt</td>";
                            echo "<td>$dil</td>";
                            echo "<td>

                            <a class=\"btn btn-link\" href=\"sayfaduzenle.php?sn=$sn\">
                            <i class=\"far fa-edit fa-2x\"></i>
                            </a>

                            <button type=\"button\" class=\"btn btn-link\" data-bs-toggle=\"modal\" 
                            data-bs-target=\"#uyariModal\" data-bs-whatever=\"$sn\">
                            <i class=\"far fa-trash-alt fa-2x\"></i>
                            </button>

                            </td>";
                            echo "</tr>";
                        }
                    } catch (PDOException $ex) {
                        echo "<div class=\"alert alert-danger\" role=\"alert\">
                            Hata oluştu. Sayfa listeleme başaşarısız oldu.{$e->getMessage()}
                          </div>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col">
        <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="<?php echo "sayfalistesi.php?s=1"; ?>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <?php
    for ($i=1; $i <=$toplamsayfa; $i++) { 
        $stil="class=\"page-item\"";
        if($sayfa==$i) $stil="class=\"page-item active\" aria-current=\"page\"";
        echo "<li $stil><a class=\"page-link\" href=\"sayfalistesi.php?s=$i\">$i</a></li>";
    }
    ?>
    <li class="page-item">
      <a class="page-link" href="<?php echo "sayfalistesi.php?s=$toplamsayfa"; ?>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
        </div>
    </div>
</div>
<div class="modal fade" id="uyariModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Silme Uyarısı</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	  <form action="sayfasil.php" method="POST">
      <div class="modal-body">
          <div class="mb-3">
            <label for="sayfano" class="col-form-label">Bu sayfayı silmek istediğinize emin misiniz?</label>
            <input type="hidden" class="form-control" id="sayfano" name="sayfano">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Vazgeç</button>
        <button type="submit" class="btn btn-primary">Sil</button>
      </div>
	  </form>
    </div>
  </div>
</div>
<script>
var exampleModal = document.getElementById('uyariModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
var button = event.relatedTarget
var deger = button.getAttribute('data-bs-whatever')
var modalBodyInput = exampleModal.querySelector('.modal-body input')
modalBodyInput.value = deger
})
</script>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>