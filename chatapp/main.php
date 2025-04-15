<?php require_once('Connections/mainconn.php'); ?>
<?php
if (!isset($_SESSION)) {
  session_start();
}
if ($_SESSION['loggedin'] != "true"){
		  header('Location: index.php');}
/*if (isset($_POST["msg"]) && $_POST["msg"] != ""){
$mssg = $_POST["msg"];
$usr = "1";*/
$user = $pass = "";
$user = $_SESSION['username'];
$pass = $_SESSION['password'];

$sql = "SELECT * from users WHERE email='$user' AND pwd='$pass'";
$result = mysqli_query($mainconn, $sql);
$row = mysqli_fetch_assoc($result);
$_SESSION['id'] = $row["id"];
$_SESSION['status'] = $row["status"];
$_SESSION['category'] = $row["category"];
if ($row["status"] != "1"){
	header('Location: index.php');
}
$category = $_SESSION['category'];
/*$url='main.php';
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
<html>
<head>

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
		border: 5px;
		text-align:left;
		font-size:25px;
		font-family:Century Gothic;
		
}
.frame { height:430px;
		width:74%;
		background-color:#FCF;
		background-image: url(images/tweet_chat.png);
		box-shadow: 5px 5px 5px #888888;
		border: 5px
}
body {
	background-color:lightblue
	
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 300px;
    background-color: none;
	text-align:left;
		font-size:20px;
}

li a {
    display: block;
    color: #000;
    padding: 8px 0 8px 16px;
    text-decoration: none;
	border-radius: 10px 10px 10px 10px;
}

li a.active {
    background-color: #4CAF50;
    color: white;
}

li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
</style>
</head>

<body>
<div><h1 class="h1">ABC Corp. Message Board</h1></div>
<div class="side"><?php echo "<div style='float:left;'>Welcome, &nbsp;</div><div style='float:left;font-style:italic;color:blue;font-family:bradley hand itc;font-weight:bold'>". $row["fname"]. " !!! </div>"; ?><br /><br /><hr />
<ul>
  <li><a href="board.php" target="msgframe">Reload Chat</a></li>
  <li><a href="main4.php">User Management</a></li>
  <li><a href="main2.php">Backup Administration</a></li>
  <li><a href="main3.php">Tape Management</a></li>
  <li><a href="logout.php" >Log out</a></li>
</ul>
</div>
<iframe class="frame" name="msgframe" src="board.php"> </iframe>
<hr>
<iframe style="width:100%;" frameborder="0" scrolling="no" height="103px" src="text.php"> </iframe><br />
<!--<form method="post">
  <textarea name="msg" rows="4" cols="185" wrap="hard" style="outline:none;" spellcheck="true" placeholder="Enter message here!"></textarea>
  <input type="submit" value="Send Message">
</form>-->
</body>
</html>

