<?php
include_once('db.php');
$db = new DB();
$array	= explode(",",$_POST['ids']);
$db->update_order($array);
?>