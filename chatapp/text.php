<?php require_once('Connections/mainconn.php'); ?>
<?php
if (!isset($_SESSION)) {
  session_start();
}
if (isset($_POST["msg"]) && $_POST["msg"] != ""){
$mssg = mysqli_real_escape_string($mainconn,$_POST["msg"]);
$usr = $_SESSION['id'];


$sql = "INSERT INTO message (user_id, msg)
VALUES ($usr, '$mssg')";

mysqli_query($mainconn, $sql);
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

<form  style="height:100%; width:100%" onsubmit="btn_reset()" method="post">
  <textarea name="msg" cols="185" rows="4" wrap="hard" style="outline:none;" spellcheck="true" placeholder="Enter message here!"></textarea>
  <input type="submit" value="Send Message"  >
</form>
<script> 
function btn_reset() { 
	setTimeout(parent.msgframe.location.reload(true), 3000);
	} 
</script>
</body>
</html>