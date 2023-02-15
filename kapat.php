<?php
session_start();
unset($_SESSION["kul_bil"]);
session_destroy();
die(header("location:index.php"));
?>