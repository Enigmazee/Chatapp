<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
$error = "";
$email = $_SESSION['username'];
 $squest = $_SESSION['squest'];
 $sans =  $_SESSION['sans'];
if (isset($_POST['sanse']) && $_POST['sanse'] != $sans) {
$error = "Invalid Security answer";
}
elseif (isset($_POST['sanse']) && $_POST['sanse'] = $sans){
	$_SESSION['validated'] = "true";
header('Location: recover3.php');
	}

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
  Username: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name="email" maxlength="30" <?php echo "value='$email' "?> disabled="disabled"><br/><br/>
  Security Question: <p style="color:#F00"><?php echo "$squest"?> </p><br/><br/>
  Security Answer: &nbsp;&nbsp;<input type="password" name="sanse" maxlength="30"><br/><br/>
  <input type="submit" value="Submit"  ><br /><p style="color:#F00"><?php echo"$error" ?></p>
</fieldset></form>
<script> 
function btn_reset() { 
	setTimeout(parent.msgframe.location.reload(true), 3000);
	} 
</script>
</body>
</html>