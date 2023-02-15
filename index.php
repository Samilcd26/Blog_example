<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Ana Sayfa</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <script src='main.js'></script>
</head>
<body>
<div class="container">
<button onclick="document.getElementById('id01').style.display='block'" class="buttonum lgn">Giriş</button>

<div id="id01" class="modal">
  
  <form class="modal-content mdl-con animate" action="giris.php" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="resimler/avatar.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Kullanıcı Adı</b></label>
      <input type="text" placeholder="Kullanıcı Adı Giriniz" name="uname" required>

      <label for="psw"><b>Şifre</b></label>
      <input type="password" placeholder="Şifre Giriniz" name="psw" required>
        
      <button type="submit" class="buttonum">Giriş</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Beni Hatırla
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="buttonum cancelbtn">Vazgeç</button>
      <span class="psw">Şifremi <a href="#">Unuttum!</a></span>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>