<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
if (isset($_POST["name"]) && $_POST["name"] != ""){
$name = $_POST["name"];
$ip = $_POST["ip"];
$created_by = $_SESSION['id'];
$created_date = date('Y-m-d H:i:s');
$del_flg = "N";

$sql = "INSERT INTO backup_location (name, ip, created_by, created_date, del_flg) VALUES 
('$name', '$ip', '$created_by','$created_date', '$del_flg')" ;

/*
mysqli_query($mainconn, $sql);
header('Location: addbackup2.php');
*/
if (mysqli_query($mainconn, $sql)) {
    header('Location: addbackup2.php');
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($mainconn);
}


}
/*$url='board.php';
   echo '<META HTTP-EQUIV=REFRESH CONTENT="1; '.$url.'">';*/
/*}*/

/*if (mysqli_query($mainconn, $sql)) {
    $last_id = mysqli_insert_id($mainconn);
    echo "";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($mainconn);
}

*/mysqli_close($mainconn);
?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.h1 {
	text-align:center;
	text-shadow: 15px 15px 15px #888888;

}
.side {border:groove;
		float:left;
		height:430px;
		width:23%;
		background-color:#ddd;
		box-shadow: 5px 5px 5px #888888;
		border: 5px
}
.frame { height:430px;
		width:74%;
		background-color:#FCF;
		background-image: url(images/tweet_chat.png);
		box-shadow: 5px 5px 5px #888888;
		border: 5px
}

</style>
</head>

<body>

<form method="post" action="" ><fieldset><legend>Add New Backup Job</legend>
  Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" maxlength="30" required placeholder="Backup Name"><br/><br/>
  IP: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="ip" maxlength="30" placeholder="IP Address"required><br/><br/>
    <input type="reset" value="Reset"  >
  <input type="submit" value="Submit"  >
</fieldset></form>
<script> 
function btn_reset() { 
	setTimeout(parent.msgframe.location.reload(true), 3000);
	} 
</script>
</body>
</html>