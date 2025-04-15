<?php require_once('Connections/mainconn.php'); ?>
<?php
if (!isset($_SESSION)) {
  session_start();
  $_SESSION['loggedin'] = "false";
}
	session_unset();
	session_destroy();
		  header('Location: index.php');
		  /*$error = "You are now Logged in<br><a href = 'main.php' >Click here to Chat</a>";
		  $goto = "main.php";*/
/*$url='main.php';
   echo '<META HTTP-EQUIV=REFRESH CONTENT="1; '.$url.'">';
}*/

/*if (mysqli_query($mainconn, $sql)) {
    $last_id = mysqli_insert_id($mainconn);
    echo "";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($mainconn);
}

*/
?> 

