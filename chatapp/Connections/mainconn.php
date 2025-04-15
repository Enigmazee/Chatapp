<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_mainconn = "localhost";
$database_mainconn = "prod";
$username_mainconn = "root";
$password_mainconn = "";
$mainconn = mysqli_connect($hostname_mainconn, $username_mainconn, $password_mainconn, $database_mainconn); 
if (!$mainconn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "";
?>