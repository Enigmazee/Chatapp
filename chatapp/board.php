<?php require_once('Connections/mainconn.php'); ?>
<?php

$sql = "select u.id,u.fname,u.sname,m.msg,m.msg_time from users u join message m on (u.id=m.user_id) order by msg_time desc";
$result = mysqli_query($mainconn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "<div style='background:powderblue; border-radius: 10px 10px 10px 10px; margin:auto;content-align:left;font-family:Gill Sans MT;opacity:0.94'><div style='text-align:left;color:blue;margin:0px;font-style:italic'>" . $row["fname"]. " " . $row["sname"] ."</div><pre style='border:0px;text-align:justify;width:auto;font-size:16px;font-family:Century Gothic'><strong>" . $row["msg"]. "</strong></pre><div style='text-align:right;color:brown;font-style:italic'> " . $row["msg_time"]. "</div></div><hr><br>";
    }
} else {
    echo "no chat messages yet";
}

mysqli_query($mainconn, $sql);


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
		background-image: url(images/chat%20image%203.jpg);
		box-shadow: 5px 5px 5px #888888;
		border: 5px
}
body {
	background-color:none
	
}
</style>
</head>

<body>
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

