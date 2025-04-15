<?php require_once('Connections/mainconn.php'); ?>
<?php
if (!isset($_SESSION)) {
  session_start();
  $_SESSION['loggedin'] = "false";
}
 $username = $password = $error = $goto = ""; 

if (isset($_POST["username"])){
$username = mysqli_real_escape_string($mainconn,$_POST["username"]);
$password = $_POST["password"];
if ($username == "" || $password == ""){
	$error = "Username or Password not entered";
	$goto = "";
	session_unset();
	session_destroy();
	}
	else{
$sql = "SELECT * from users WHERE email='$username' AND pwd='$password'";
$result = mysqli_query($mainconn, $sql);


if (mysqli_num_rows($result) == 0) {
	$error = "Username/Password invalid";
	$goto = "";
	session_unset();
	session_destroy();
	}
	else {
		$sql = "SELECT * from users WHERE email='$username' AND pwd='$password'";
		$result = mysqli_query($mainconn, $sql);
		$row = mysqli_fetch_assoc($result);
		if ( $row["status"] != "1"){
			$error = "User disabled, please contact admin";}
			else {
		$_SESSION['id'] = $row["id"];
		$_SESSION['status'] = $row["status"];
		$_SESSION['category'] = $row["category"];
		$_SESSION['username'] = $username;
		  $_SESSION['password'] = $password;
		  $_SESSION['loggedin'] = "true";
		  header('Location: main.php');
			}
		  /*$error = "You are now Logged in<br><a href = 'main.php' >Click here to Chat</a>";
		  $goto = "main.php";*/
	}mysqli_query($mainconn, $sql);
	}

}
/*$url='main.php';
   echo '<META HTTP-EQUIV=REFRESH CONTENT="1; '.$url.'">';
}*/

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
<script>
function register(){
	window.open("signup.php","_blank","location=yes,status=yes,scrollbars=yes,width=400,height=500");
}
function recover(){
	window.open("recover.php","_blank","location=yes,status=yes,scrollbars=yes,width=400,height=500");
}
</script>
<style type="text/css">
.h1 {
	text-align:center;
	text-shadow: 15px 15px 15px #888888;

}
.lside {border:groove;
		float:right;
		height:430px;
		width:23%;
		background-color:#ddd;
		box-shadow: 5px 5px 5px #888888;
		border: 0.5px;
		text-align:center;
		font-size:16px;
		font-family:Century Gothic;
		font-weight:bold
}
.frame { height:430px;
		width:76.5%;
		background-color:#FCF;
		background-image: url(images/production.jpg);
		box-shadow: 5px 5px 5px #888888;
		border: 0.5px;
		float:left
}
body {
	background-color:lightblue
	
}
</style>
</head>

<body>
<div>
<h1 class="h1">Welcome to ABC Corp. Workbench</h1></div>

<div class="frame"> </div>
<div class="lside"><form method="post" action=''><fieldset><legend>Please Login Here</legend><br /><br />
<div style="font-weight: normal; float:left">Username:</div> <div style="float:left"><input type="text" name="username" placeholder="Email"/></div><br /><br />
<div style="font-weight: normal; float:left">Password   :</div>  <div style="float:left"><input type="password" name="password" placeholder="Password"/></div> 
<br /><br />
<input type="submit" value="Login" /></fieldset><div style="color:#F00"><?php echo"$error" ?></div><br /><hr /><div>Forgot Password? <a href="#" onclick="recover()">Recover</a></div><br /><div>Not yet a member? <a href="#" onclick="register()">Sign up</a></div>
</form></div>
<hr>
</body>
</html>

