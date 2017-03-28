<?php

$titre="Connection";
include("connectionBase.php");

// Hachage du mot de passe
$password = sha1($_POST['password']);
$login=$_POST['login'];

// Vérification des identifiants
$req = $bdd->prepare('SELECT * FROM Eleve INNER JOIN prof
on eleve.idprof = prof.idprof WHERE nom  = :nom AND  Mot_De_Passe = :password');
$req->execute(array(
'nom' => $nom,
'password' => $password));

$resultat = $req->fetch();

if(!$resultat)
    {
        echo 'Veuillez reessayer';
        header('refresh:3;../index.html');
        exit();
    }
else
    {

        session_start();


        echo 'Vous etes connecte !';

        //header('refresh:3;');
        exit();
    }

?>
