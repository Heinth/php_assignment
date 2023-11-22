<?php
include("includes/db_connet.php");
include("includes/functions.php");
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT u.*, p.* FROM user u, person p WHERE p.personalCode='$id' AND p.personalCode = u.personalCode";
    $res = mysqli_query($conn, $query);
    $result = mysqli_fetch_assoc($res);

    if (isset($_POST["btn_submit"]) && isset($_GET['edit']) && isset($_GET['id'])) {
        $name = $_POST["name"];
        $user_code = $_POST["user_code"];
        $personal_code = $_POST["personal_code"];
        $personal_type = $_POST["personal_type"];
        $specialization = $_POST["specialization"];
        $address = $_POST["address"];
        $register_date = date("Y-m-d h:i:s");
        $password = $_POST["password"];
        $query1 = "UPDATE user
            SET
                userCode = '$user_code',
                password = '$password'
            WHERE
                personalCode = '$personal_code'
        ";
        $query2 = "UPDATE person
            SET
                personType = '$personal_type',
                name = '$name',
                specializing = '$specialization',
                address = '$address'            
            WHERE
                personalCode = '$personal_code'
        ";

        $res1 = mysqli_query($conn, $query1);
        $res2 = mysqli_query($conn, $query2);
        if ($res1 && $res2) {
            $message = "Update Successfully.";
            echo "<script type='text/javascript'>alert('$message');</script>";
            echo "<script type='text/javascript'>
            window.location = '/users.php';
            </script>";
        } else {
            $error = mysqli_error($conn);
            $message = "Update Failed! Try Again.";
            echo "<script type='text/javascript'>alert('$message');</script>";
            echo "<script type='text/javascript'>
            window.location = '/users.php';
            </script>";
        }
    }
} else {
    header('location:/index.php');
}



?>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>Clinic Management System</title>
</head>

<body>

    <?php include_once("includes/navbar.php"); ?>
    <main>
        <div class="site-section">
            <div class="container">
                <div class="pb-3">

                    <div class="row justify-content-between align-items-center">
                        <h2>User Information</h2>
                        <button class="btn btn-primary"><a class="text-decoration-none text-white" href="/user-detail-form.php?id=<?= $result["personalCode"]  ?>&edit">
                                Edit Info
                            </a>
                        </button>
                    </div>
                </div>
                <?php if (isset($_GET["edit"])) { ?>
                    <form action="/user-detail-form.php?id=<?= $result["personalCode"]  ?>&edit" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input name="name" value="<?= $result['name'] ?>" type="text" class="form-control" placeholder="Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">User Code</label>
                            <input name="user_code" value="<?= $result['userCode'] ?>" type="text" class="form-control" placeholder="User Code" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Personal Code</label>
                            <input readonly name="personal_code" value="<?= $result['personalCode'] ?>" type="text" class="form-control" placeholder="Personal Code" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" value="<?= $result['password'] ?>" type="text" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Personal Type</label>
                            <input name="personal_type" value="<?= $result['personType'] ?>" type="text" class="form-control" placeholder="Personal Type" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialization</label>
                            <input name="specialization" value="<?= $result['specializing'] ?>" type="text" class="form-control" placeholder="Specialization" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea name="address" class="form-control" name="" rows="10" placeholder="Address" required><?= $result['address'] ?></textarea>
                        </div>
                        <div class="row align-items-center justify-content-end">
                            <a href="/users.php" class="btn btn-danger mr-3 text-decoration-none text-white">Back</a>
                            <button type="submit" class="btn btn-success" name="btn_submit">Update</button>
                        </div>
                    </form>
                <?php } else { ?>
                    <form action="/user-detail-form.php?id=<?= $result["personalCode"]  ?>&edit" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input readonly name="name" value="<?= $result['name'] ?>" type="text" class="form-control" placeholder="Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">User Code</label>
                            <input readonly name="user_code" value="<?= $result['userCode'] ?>" type="text" class="form-control" placeholder="User Code" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Personal Code</label>
                            <input readonly name="personal_code" value="<?= $result['personalCode'] ?>" type="text" class="form-control" placeholder="Personal Code" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input readonly name="password" value="<?= $result['password'] ?>" type="text" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Personal Type</label>
                            <input readonly name="personal_type" value="<?= $result['personType'] ?>" type="text" class="form-control" placeholder="Personal Type" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Specialization</label>
                            <input readonly name="specialization" value="<?= $result['specializing'] ?>" type="text" class="form-control" placeholder="Specialization" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea readonly name="address" class="form-control" name="" rows="10" placeholder="Address" required><?= $result['address'] ?></textarea>
                        </div>
                        <div class="row align-items-center justify-content-end">
                            <a href="/users.php" class="btn btn-danger mr-3 text-decoration-none text-white">Back</a>
                        </div>
                    </form>
                <?php } ?>
            </div>
        </div>
    </main>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>