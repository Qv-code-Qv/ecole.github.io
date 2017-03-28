<?php
  try
  {

	$bdd = new PDO('mysql:host=localhost;dbname=univ;charset=utf8','root',''); //Connection

  $dbh = null; // deconnection 
  }
  catch(Exception $e)
  {
  die('Erreur : '.$e->getMessage());
  }

	?>
