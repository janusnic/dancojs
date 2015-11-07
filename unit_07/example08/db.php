<?php
class DB{
	function __construct(){
		$con = mysql_connect('localhost','root','') or die('Database connection error.');
		mysql_select_db('codexworld',$con) or die('Database selection error.');
	}
	
	function get_rows(){
		$query = mysql_query("SELECT * FROM `images` ORDER BY `order` ASC") or die(mysql_error());
		while($row = mysql_fetch_assoc($query))
		{
			$rows[] = $row;
		}
		return $rows;
	}
	
	function update_order($id_array){
		$count = 1;
		foreach ($id_array as $id){
			$update = mysql_query("UPDATE `images` SET `order` = $count WHERE id = $id");
			$count ++;	
		}
		return true;
	}
}
?>