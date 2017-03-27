<?php
// Hachage du mot de passe
$pass_hache = sha1($_POST['pass']);

// Vérification des identifiants

$dbh1 = mysql_connect($hostname, $username, $password);
$dbh2 = mysql_connect($hostname, $username, $password, true);


$req1 = $bdd1 ->prepare('SELECT id FROM prof WHERE nom = :nom AND pass = :pass');
$req1->execute(array(
    'pseudo' => $pseudo,
    'pass' => $pass_hache));

$resultat = $req->fetch();

$req2 = $bdd2 ->prepare('SELECT id FROM prof WHERE nom = :nom AND pass = :pass');
$req2->execute(array(
    'pseudo' => $pseudo,
    'pass' => $pass_hache));

$resultat = $req->fetch();

if ($resultat1 OR $resultat2)
{

  session_start();
  $_SESSION['id'] = $resultat['id'];
  $_SESSION['pseudo'] = $pseudo;
  echo 'Vous êtes connecté !';

}
else
{
    echo 'Mauvais identifiant ou mot de passe !';
}
