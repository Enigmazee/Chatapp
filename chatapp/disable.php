<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
$email = $_SESSION['username'];
$dump ="";

if ($_SESSION['category'] == "1") {
	header('Location: chat.php');
}
if ($_SESSION['status'] == "0") {
	session_unset();
	session_destroy();
	header('Location: index.php');
}
$sql = "select * from users where status = '1' order by fname, sname desc";
$result = mysqli_query($mainconn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
	echo'<form style="background-color:#ddd;font-family:Century Gothic; font-weight:bold" method="post" action="" ><fieldset><legend>Enable User</legend><br /><select style="background-color:white;font-family:Century Gothic;font-weight:bold;font-size:15px" name="selection"><option value="">Select a User</option>';
    while($row = mysqli_fetch_assoc($result)) {
        echo'<option value ="' . $row["id"]. '"> ' . $row["fname"] .' '. $row["sname"] .'</option>';
    }
	echo '</select>&nbsp;&nbsp;<input style="font-family:Century Gothic;font-weight:bold; font-size:15px"type="submit" value ="Disable" ><br><br><br><br></fieldset></form>';
} else {
    echo "<h1 style='background-color:#CCC'>No enabled users!</h1>";
}

if (isset ($_POST['selection']) && $_POST['selection'] != ""){
	$selection = $_POST['selection'];
	$sql = "UPDATE users SET status = '0' WHERE id = '$selection'";
	$result = mysqli_query($mainconn, $sql);
	header('Location: disable2.php');
}
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
<!--<meta http-equiv="refresh" content="5">-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.h1 {
	text-align:center;
	text-shadow: 15px 15px 15px #888888;

}
.side {border:groove;
		float:left;
		height:350px;
		width:23%;
		background-color:#ddd;
		box-shadow: 5px 5px 5px #888888;
		border: 5px
}
.frame { height:350px;
		width:74%;
		background-color:#FCF;
		background-image: url(images/tweet_chat.png);
		box-shadow: 5px 5px 5px #888888;
		border: 5px
}
body {
	background-color:
	
}
</style>
</head>

<body>
<!--<form method="post">

  <input type="submit" value="Enable">
</form>-->
<!--<div><h1 class="h1">Unilag MIT 2014/2015 Message Board</h1></div>
<div class="side">
</div>
<iframe class="frame"> </iframe><br><br>
<hr>
<form method="post">
  <textarea name="msg" rows="5" cols="185"></textarea>
  <input type="submit" value="Send Message">
</form>-->
</body>
</html>

