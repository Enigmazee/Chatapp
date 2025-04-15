<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
$error = "";
$email = $_SESSION['username'];
 $pwd = $_SESSION['password'];
if (isset($_POST['pwd']) && $_POST['pwd'] != $pwd) {
	$error ="Incorrect Old Password!";
	}
else{	
	if (isset($_POST['password']) && $_POST['password'] != "" ){
		if ($_POST['password'] == $_POST['pswrd']){
		$password = $_POST['password'];
		$sql = "UPDATE users SET pwd ='$password' WHERE email ='$email'";
		mysqli_query($mainconn, $sql);
		header('Location: change2.php');
		}
		else { $error ="The new passwords do not match!";
		}
	}
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

<form style="background-color:#ddd;font-family:Century Gothic; font-weight:bold" method="post" action="" ><fieldset>
    <legend>Change Password</legend><br />
  Enter Old Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pwd" maxlength="20"><br/><br/>
  Enter New Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="20"><br/><br/>
  Confirm New Password: <input type="password" name="pswrd" maxlength="20">
  <br/><br/><div style="color:#F00;font-family:Century Gothic;font-weight:bold; font-size:15px;"><?php echo"$error" ?></div><br/><br/>
  <input style="font-family:Century Gothic;font-weight:bold; font-size:15px" type="submit" value="Submit" >
</fieldset></form>

</body>
</html>