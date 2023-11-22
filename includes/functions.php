<?php

function getAllPatients($conn)
{
    $res = mysqli_query($conn, "SELECT * FROM patient");
    $result = mysqli_fetch_all($res, MYSQLI_ASSOC);
    return $result;
}
function getAllPersons($conn)
{
    $res = mysqli_query($conn, "SELECT * FROM person");
    $result = mysqli_fetch_all($res, MYSQLI_ASSOC);
    return $result;
}
function getAllUsers($conn)
{
    $res = mysqli_query($conn, "SELECT u.*, p.* FROM user u, person p WHERE p.personalCode = u.personalCode");
    // $res = mysqli_query($conn, "SELECT u.*, ur.*, r.*, p.* FROM user u, userRole ur, role r, person p WHERE ur.UID = u.UID AND ur.roleId = r.roleId AND p.personalCode = u.personalCode");
    $result = mysqli_fetch_all($res, MYSQLI_ASSOC);
    return $result;
}
