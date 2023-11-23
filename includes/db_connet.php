<?php

$dbhost = "localhost";
$username = "root";
$password = "123456";
$dbname = "clinic_mgmt";

$conn = mysqli_connect($dbhost, $username, $password, $dbname);
if (!$conn) {
    echo "connection error" . mysqli_connect_error();
}
##Please change the $dbhost to name of the database service name that from docker-compose.yaml###
