<?php 
echo 'Apache with PHP is working.<br/>';

try {
    $db = new PDO('mysql:host=mysql;dbname=mysql', 'root', '');
    echo 'Database connection established <br />';
} catch (PDOException $e) {
    echo 'Database connection failed <br />';
    echo $e->getMessage();
}
