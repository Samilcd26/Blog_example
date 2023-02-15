<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Yeni Sayfa Ekle</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
    <script src="js/nicEdit.js" type="text/javascript"></script>
    <script type="text/javascript">
        bkLib.onDomLoaded(function() {
	    new nicEditor({fullPanel : true,iconsPath : 'resimler/nicEditorIcons.gif'}).panelInstance('sayfaicerik');
        });
    </script>
</head>
<body>
    <?php
    date_default_timezone_set("Europe/Istanbul");
    ?>
    <div class="container">
    <?php 
  include("kontrol.php");
  echo $oturum;
  ?>
        <div class="row">
            <div class="col">
                <p class="h1">Yeni Sayfa Ekle</p>
                <hr class="my-4"/>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <form action="" method="POST">
                    <div class="mb-4">
                        <label for="sayfabaslik" class="form-label">Sayfa Başlığı</label>
                        <input type="text" name="sayfabaslik" id="sayfabaslik" class="form-control" required>
                    </div>
                    <div class="mb-4">
                        <label for="anahtarkelimeler" class="form-label">Anahtar Kelimeler</label>
                        <input type="text" name="anahtarkelimeler" id="anahtarkelimeler" class="form-control">
                    </div>
                    <div class="mb-4">
                        <label for="sayfalink" class="form-label">Sayfa Linki</label>
                        <input type="text" name="sayfalink" id="sayfalink" class="form-control" required>
                    </div>
                    <div class="mb-4">
                        <label for="sayfaicerik" class="form-label">Sayfa İçeriği</label>
                        <textarea name="sayfaicerik" id="sayfaicerik" class="form-control" rows="20" required>
                        </textarea>
                    </div>
                    <div class="mb-4">
                        <label for="yayinlamatarihi" class="form-label">Yayınlama Tarihi</label>
                        <input type="datetime-local" name="yayinlamatarihi" id="yayinlamatarihi"
                        value="<?php echo date("Y-m-d\TH:i"); ?>" class="form-control" required>
                    </div>
                    <div class="mb-4">
                        <label for="guncellemetarihi" class="form-label">Güncelleme Tarihi</label>
                        <input type="datetime-local" name="guncellemetarihi" id="guncellemetarihi"
                        value="<?php echo date("Y-m-d\TH:i"); ?>" class="form-control" readonly>
                    </div>
                    <div class="mb-4">
                        <label for="dil" class="form-label">Sayfa Dili</label>
                        <select name="dil" id="dil" class="form-select" aria-label="Default select example">
                            <option value="TR" selected>Türkçe</option>
                            <option value="EN">English</option>
                          </select>
                    </div>
                    <div class="mb-4">
                        <button type="submit" name="kaydet" id="kaydet" class="btn btn-primary">Kaydet</button>
                        <button type="reset" class="btn btn-secondary">Temizle</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <?php
                    if(isset($_POST["kaydet"])){
                        $sayfabaslik=$_POST["sayfabaslik"];
                        $anahtarkelimeler=$_POST["anahtarkelimeler"];
                        $sayfalink=$_POST["sayfalink"];
                        $sayfaicerik=$_POST["sayfaicerik"];
                        $yayinlamatarihi=$_POST["yayinlamatarihi"];
                        $guncellemetarihi=$_POST["guncellemetarihi"];
                        $dil=$_POST["dil"];
                        include_once("ayarlar.php");
                        try {
                            $db=new PDO("mysql:host=$sunucu;dbname=$vt;charset=$karakter",$kadi,$ksifre);
                            $sorgu="INSERT INTO sayfalartablosu
                            (sayfabaslik,anahtarkelimeler,sayfalink,sayfaicerik,yayinlamatarihi,guncellemetarihi,dil) 
                            VALUES(:sb,:ak,:sl,:si,:yt,:gt,:dil)";
                            $tablo=$db->prepare($sorgu);
                            $tablo->bindParam(":sb",$sayfabaslik,PDO::PARAM_STR);
                            $tablo->bindParam(":ak",$anahtarkelimeler,PDO::PARAM_STR);
                            $tablo->bindParam(":sl",$sayfalink,PDO::PARAM_STR);
                            $tablo->bindParam(":si",$sayfaicerik,PDO::PARAM_STR);
                            $tablo->bindParam(":yt",$yayinlamatarihi,PDO::PARAM_STR);
                            $tablo->bindParam(":gt",$guncellemetarihi,PDO::PARAM_STR);
                            $tablo->bindParam(":dil",$dil,PDO::PARAM_STR);
                            $tablo->execute();
                            echo "<div class=\"alert alert-success\" role=\"alert\">
                            $sayfabaslik sayfası başarı ile kaydedildi.
                          </div>";
                        } catch (PDOException $e) {
                            echo "<div class=\"alert alert-danger\" role=\"alert\">
                            Hata oluştu. Kayıt işlemi başaşarısız oldu.{$e->getMessage()}
                          </div>";
                        }

                    }
                ?>
            </div>
        </div>
    </div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>