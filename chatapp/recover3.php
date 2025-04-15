<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
$error = "";
$email = $_SESSION['username'];
 $squest = $_SESSION['squest'];
if ($_SESSION['validated'] = "true") {
	if (isset($_POST['password']) && $_POST['password'] != "" ){
		if ($_POST['password'] == $_POST['pswrd']){
		$password = $_POST['password'];
		$sql = "UPDATE users SET pwd ='$password' WHERE email ='$email'";
		mysqli_query($mainconn, $sql);
		header('Location: recover4.php');}
		else { $error ="The passwords do not match!";
		}
		}
}
else {
	header('Location: recover.php');
	session_unset();
	session_destroy();
}
mysqli_close($mainconn);
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

<form method="post" action="" ><fieldset><legend>Recover Password</legend><br />
  Enter New Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="20"><br/><br/>
  Confirm New Password: <input type="password" name="pswrd" maxlength="20">
  <br/><br/><div style="color:#F00"><?php echo"$error" ?></div><br/><br/>
  <input type="submit" value="Submit" >
</fieldset></form>

</body>
</html>