<?php require_once('Connections/mainconn.php'); ?>
<?php
if (isset($_POST["firstname"]) && $_POST["firstname"] != ""){
$firstname = $_POST["firstname"];
$surname = $_POST["surname"];
$email = $_POST["email"];
$password = $_POST["password"];
$squest = $_POST["squest"];
$sans = $_POST["sans"];
$status = "0";
$category ="1";

$sql = "INSERT INTO users (fname, sname, pwd, email, squest, sans, status, category)
VALUES ('$firstname', '$surname', '$password', '$email', '$squest', '$sans', '$status', '$category')";

mysqli_query($mainconn, $sql);
header('Location: signup2.php');
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

<form method="post" action="" ><fieldset><legend>Sign Up Here</legend>
  Firstname: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="firstname" maxlength="30" required placeholder="firstname"><br/><br/>
  Surname: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="surname" maxlength="30" placeholder="surname"required><br/><br/>
  Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name="email" maxlength="30" placeholder="email"required><br/><br/>
  Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="20" placeholder="password"required><br/><br/>
  Security Question: <input type="text" name="squest" maxlength="50" required placeholder="security question"><br/><br/>
  Security Answer: &nbsp;&nbsp;<input type="text" name="sans" maxlength="30" required placeholder="security answer"><br/><br/>
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