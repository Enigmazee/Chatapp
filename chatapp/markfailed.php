<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
echo'<form method="post" action="" ><fieldset><legend>Failed Backup Job Date</legend>
	Date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="date" name="date" maxlength="30" required placeholder="Enter Backup Date"><br/><br/>
    <input type="reset" value="Reset"  >
  <input type="submit" value="Submit"  >
</fieldset></form>';
if (isset($_POST["date"]) && $_POST["date"] != ""){
$bdate = $_POST["date"];
/*$ip = $_POST["ip"];
$created_by = $_SESSION['id'];
$created_date = date('Y-m-d H:i:s');
$del_flg = "N";*/

$sql = "SELECT a.id,a.location_id,b.name,b.ip from backup_details a left outer join backup_location b on a.location_id = b.id left outer join backup_header c on a.header_id = c.id WHERE a.successful = 'Y' and c.backup_date = '$bdate'" ;
$result = mysqli_query($mainconn, $sql);
/*
mysqli_query($mainconn, $sql);
header('Location: addbackup2.php');
*/
if (mysqli_query($mainconn, $sql)) {
    if (mysqli_num_rows($result) > 0) {
    // output data of each row
	echo'<form method="post" action="" ><fieldset><legend>Mark Failed Backup Job for '.$bdate. '</legend>
<select style="background-color:white;font-family:Century Gothic;font-weight:bold;font-size:15px" name="selection"><option value="">Select Backup</option>';
    while($row = mysqli_fetch_assoc($result)) {
        echo'<option value ="' . $row["id"]. '"> ' . $row["name"] .' - '. $row["ip"] .'</option>';
    }
	echo '</select><br/><br/>
  Comments: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="comments" cols="30" rows="4" wrap="hard" style="outline:none;" spellcheck="true" required placeholder="Enter your comments here"></textarea><br/><br/>
  Actions: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="actions" cols="30" rows="4" wrap="hard" style="outline:none;" spellcheck="true" required placeholder="Enter steps taken to resolve failure"></textarea><br/><br/>
    <input type="reset" value="Reset"  >
  <input type="submit" value="Submit"  >
</fieldset></form>';
} else {
    echo "<h1 style='background-color:#CCC'>No backups to delete!</h1>".$bdate;
}
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($mainconn);
}


}

if (isset ($_POST['selection']) && $_POST['selection'] != ""){
	$selection = $_POST['selection'];
	$comments = $_POST['comments'];
	$actions = $_POST['actions'];
	$sql = "UPDATE backup_details SET successful = 'N',comments = '$comments', actions = '$actions' WHERE id = '$selection'";
	$result = mysqli_query($mainconn, $sql);
	header('Location: markfailed2.php');
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


<script> 
function btn_reset() { 
	setTimeout(parent.msgframe.location.reload(true), 3000);
	} 
</script>
</body>
</html>