<?php
include("includes/db_connet.php");
include("includes/functions.php");
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM patient WHERE patientId='$id'";
    $res = mysqli_query($conn, $query);
    $result = mysqli_fetch_assoc($res);

    if (isset($_POST["btn_submit"]) && isset($_GET['edit']) && isset($_GET['id'])) {
        $name = $_POST["name"];
        $father_name = $_POST["father_name"];
        $patient_code = $_POST["patient_code"];
        $dob = $_POST["dob"];
        $age = $_POST["age"];
        $gender = $_POST["gender"];
        $blood_group = $_POST["blood_group"];
        $allergy = $_POST["allergy"];
        $address = $_POST["address"];
        $register_date = date("Y-m-d h:i:s");
        $query = "UPDATE patient
                    SET
                    patientCode = '$patient_code',
                    Name = '$name',
                    fatherName = '$father_name',
                    dateOfBirth = '$dob',
                    age = '$age',
                    gender = '$gender',
                    bloodGroup = '$blood_group',
                    allergy = '$allergy',
                    address = '$address',
                    registeredDate = '$register_date'
                    WHERE patientId='$id'
                ";

        $res = mysqli_query($conn, $query);
        if ($res) {
            $message = "Patient Update Successfully.";
            echo "<script type='text/javascript'>alert('$message');</script>";
            echo "<script type='text/javascript'>
                window.location = '/index.php';
                </script>";
        } else {
            $error = mysqli_error($conn);
            $message = "Patient Update Failed! Try Again.";
            echo "<script type='text/javascript'>alert('$error');</script>";
            echo "<script type='text/javascript'>
                window.location = '/index.php';
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
                        <h2>Patient Information</h2>
                        <button class="btn btn-primary"><a class="text-decoration-none text-white" href="/patient-detail-form.php?id=<?= $result["patientId"]  ?>&edit">
                                Edit Info
                            </a>
                        </button>
                    </div>
                </div>
                <?php if (isset($_GET["edit"])) { ?>
                    <form action="/patient-detail-form.php?id=<?= $result["patientId"]  ?>&edit" method="post">
                        <div class="mb-3">
                            <label class="form-label">Patient Code</label>
                            <input readonly name="patient_code" type="text" class="form-control" value="<?php echo $result["patientCode"] ?>" placeholder="Patient Code" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input name="name" type="text" class="form-control" value="<?php echo $result["Name"] ?>" placeholder="Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Father Name</label>
                            <input name="father_name" type="text" class="form-control" value="<?php echo $result["fatherName"] ?>" placeholder="Father Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Datwe of Birth</label>
                            <input name="dob" type="date" class="form-control" value="<?php echo $result["dateOfBirth"] ?>" placeholder="Datwe of Birth" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Age</label>
                            <input name="age" type="number" min="0" class="form-control" value="<?php echo $result["age"] ?>" placeholder="Age" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <input name="gender" type="text" class="form-control" value="<?php echo $result["gender"] ?>" placeholder="Gender" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Blood_group</label>
                            <input name="blood_group" type="text" class="form-control" value="<?php echo $result["bloodGroup"] ?>" placeholder="Blood_group" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Allergy</label>
                            <textarea name="allergy" class="form-control" name="" rows="10" placeholder="Allergy" required><?php echo $result["allergy"] ?></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea name="address" class="form-control" name="" rows="10" placeholder="Address" required><?php echo $result["address"] ?></textarea>
                        </div>
                        <div class="row align-items-center justify-content-end">
                            <a href="/index.php" class="btn btn-danger mr-3 text-decoration-none text-white">Back</a>
                            <button type="submit" class="btn btn-success" name="btn_submit">Update</button>
                        </div>
                    </form>
                <?php } else { ?>
                    <form action="/patient-detail-form.php?id=<?= $result["patientId"]  ?>&edit" method="post">
                        <div class="mb-3">
                            <label class="form-label">Patient Code</label>
                            <input readonly name="patient_code" type="text" class="form-control" value="<?php echo $result["patientCode"] ?>" placeholder="Patient Code" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input readonly name="name" type="text" class="form-control" value="<?php echo $result["Name"] ?>" placeholder="Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Father Name</label>
                            <input readonly name="father_name" type="text" class="form-control" value="<?php echo $result["fatherName"] ?>" placeholder="Father Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Datwe of Birth</label>
                            <input readonly name="dob" type="date" class="form-control" value="<?php echo $result["dateOfBirth"] ?>" placeholder="Datwe of Birth" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Age</label>
                            <input readonly name="age" type="number" min="0" class="form-control" value="<?php echo $result["age"] ?>" placeholder="Age" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <input readonly name="gender" type="text" class="form-control" value="<?php echo $result["gender"] ?>" placeholder="Gender" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Blood_group</label>
                            <input readonly name="blood_group" type="text" class="form-control" value="<?php echo $result["bloodGroup"] ?>" placeholder="Blood_group" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Allergy</label>
                            <textarea readonly name="allergy" class="form-control" name="" rows="10" placeholder="Allergy" required><?php echo $result["allergy"] ?></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea readonly name="address" class="form-control" name="" rows="10" placeholder="Address" required><?php echo $result["address"] ?></textarea>
                        </div>
                        <div class="row align-items-center justify-content-end">
                            <a href="/index.php" class="btn btn-danger mr-3 text-decoration-none text-white">Back</a>
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