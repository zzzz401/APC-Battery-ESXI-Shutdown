<?php
$to = "afl@aidan-law.com";
$subject = "Network POWER FAILURE Detected";
$message = "
<html>
<head>
<title>Network POWER FAILURE Detected</title>
</head>
<body>
<p>Network is Shutting Down!</p>
<p>Time of Failure: ".date('F j, Y, g:i a')."</p>
</body>
</html>
";
$headers  = 'From: BatteryDaemon@NetAlert.xyz'."\r\n";
$headers .= 'MIME-Version: 1.0'."\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1'."\r\n";
$headers .= 'X-Priority: 1'."\r\n";
$headers .= 'X-MSMail-Priority: High'."\r\n";
$headers .= 'Importance: High'."\r\n";
mail($to, $subject, $message, $headers);
?>
