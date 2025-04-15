<?php require_once('Connections/mainconn.php'); ?>
<?php
$error = "";
if (isset($_POST["email"]) && $_POST["email"] != ""){
$email = $_POST["email"];

session_start();

$sql = "SELECT * from users WHERE email='$email'";
$result = mysqli_query($mainconn, $sql);
$row = mysqli_fetch_assoc($result);

if (mysqli_num_rows($result) == 0) {
	$error = "Username does not exist";
	session_unset();
	session_destroy();
	}
	else {$_SESSION['username'] = $email;
		  $_SESSION['squest'] = $row["squest"];
		  $_SESSION['sans'] = $row["sans"];
		  $_SESSION['pass'] = $row["pwd"];
		  header('Location: recover2.php');
		 
		  /*$error = "You are now Logged in<br><a href = 'main.php' >Click here to Chat</a>";
		  $goto = "main.php";*/
	}mysqli_query($mainconn, $sql);

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

<form method="post" action="" ><fieldset><legend>Recover Password</legend><br />
  Enter Username: <input type="email" name="email" maxlength="30" required placeholder="Email"><br/><br/>
  <input type="submit" value="Submit"  ><br /><p style="color:#F00"><?php echo"$error" ?></p>
</fieldset></form>
<script> 
function btn_reset() { 
	setTimeout(parent.msgframe.location.reload(true), 3000);
	} 
</script>
</body>
</html>