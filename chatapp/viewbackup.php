<?php require_once('Connections/mainconn.php'); ?>
<?php
session_start();
echo'<html><body><form style="border: 0px" method="post" action="" ><fieldset><legend>Select date to view</legend>
	Date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="date" name="date" maxlength="30" required placeholder="Enter Backup Date">
    <input type="reset" value="Reset"  >
  <input type="submit" value="Submit"  >
</fieldset></form></body></html>';
if (isset($_POST["date"]) && $_POST["date"] != ""){
$bdate = $_POST["date"];
$df = date("d-F-Y", strtotime($bdate));
/*$ip = $_POST["ip"];
$created_by = $_SESSION['id'];
$created_date = date('Y-m-d H:i:s');
$del_flg = "N";*/

$sql = "SELECT @rownum:=@rownum + 1 as 'row_number', 
       t.*
FROM ( Select a.text details,case a.successful when 'Y' then 'Yes' when 'N' then 'No' end successful, a.comments,a.actions,b.backup_date, GetUser(b.backup_by) backup_by,GetUser(b.approved_by) approved_by, b.approved_date from backup_details a left outer join backup_header b on a.header_id = b.id where b.del_flg = 'N' and b.backup_date = '$bdate' ) t,
(SELECT @rownum := 0) r ";
$result = mysqli_query($mainconn, $sql);
/*
mysqli_query($mainconn, $sql);
header('Location: addbackup2.php');
*/


if (mysqli_query($mainconn, $sql)) {
    if (mysqli_num_rows($result) > 0) {
    // output data of each row
	echo'<html><body><div><div id="printableArea"><div style="font-family:Century Gothic;font-size:22px;font-style:italic;font-weight:bold;">Consolidated Daily Backup Log for '.$df.'</div><table class = "table"><tr><th>S/N</th><th>BACKUP DETAILS</th><th style="text-align:center">SUCCESSFUL</th><th>COMMENTS</th><th>ACTIONS</th></tr>';
    while($row = mysqli_fetch_assoc($result)) {
        echo'<tr><td>' . $row["row_number"]. '</td><td>' . $row["details"]. '</td><td style="text-align:center">' . $row["successful"] .'</td><td>'. $row["comments"] .'</td><td>'. $row["actions"] .'</td></tr>';
        $bk_user = $row["backup_by"];
        $ap_user = $row["approved_by"];
    }
    echo '</table><br/><br/><div style="font-family:Century Gothic;font-size:15px;font-style:italic;font-weight:bold;">Backup by: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '.$bk_user.'<br/> Approved by: &nbsp;&nbsp;'.$ap_user.' </div></div><br/><br/><button onclick="printPage()">Print this page</button><script> function printPage() {
     window.print();
} </script></div></body></html>';
} else {
    echo "<h1 style='background-color:#CCC'>No backup records for " .$df;
    echo "</h1>";
}
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($mainconn);
}


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

table, th, td	{
	border: 1px solid black;
	border-collapse: collapse;
}
table {
	width: 100%;
}
th {
	text-align: left;
	font-size: 15px;
	background-color: grey;
	font-color: white;
}

th, td {
	padding: 5px;
	font-family:Century Gothic;
}

td {
    font-size: 13px;
}

tr:nth-child(odd) {
background-color: lightgrey;
}

@media print {
   * {
    visibility: hidden;
  }
  #printableArea, #printableArea * {
    visibility: visible;
  }
  #printableArea {
    position: absolute;
    left: 0;
    top: 0;
  }
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