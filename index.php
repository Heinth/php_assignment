<?php
include("includes/db_connet.php");
include("includes/functions.php");

$patients = getAllPatients($conn);
$patients_count = count($patients);

$persons = getAllPersons($conn);
$persons_count = count($persons);

$users = getAllUsers($conn);
$users_count = count($users);

$sn = 1;
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
            <h2>Patients List</h2>
            <button class="btn btn-success"><a class="text-decoration-none text-white" href="/patient-form.php">
                Add Patient
              </a>
            </button>
          </div>
        </div>
        <div class="row justify-content-center">
          <table class="table responsive">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Patient Code</th>
                <th scope="col">Patient Name</th>
                <th scope="col">Father Name</th>
                <th scope="col">Date Of Birth</th>
                <th scope="col">Age</th>
                <th scope="col">Gender</th>
                <th scope="col">Blood Group</th>
                <th scope="col">Allergy</th>
                <th scope="col">Address</th>
                <th scope="col">Registered Date</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php if ($patients_count > 0) : ?>
                <?php foreach ($patients as $row) : ?>
                  <tr>
                    <th scope="row"> <?php echo $row['patientId'] ?></th>
                    <td>
                      <?php echo $row['patientCode'] ?>
                    </td>
                    <td>
                      <?php echo $row['Name'] ?>
                    </td>
                    <td>
                      <?php echo $row['fatherName'] ?>
                    </td>
                    <td>
                      <?php echo $row['dateOfBirth'] ?>
                    </td>
                    <td>
                      <?php echo $row['age'] ?>
                    </td>
                    <td>
                      <?php echo $row['gender'] ?>
                    </td>
                    <td>
                      <?php echo $row['bloodGroup'] ?>
                    </td>
                    <td>
                      <?php echo $row['allergy'] ?>
                    </td>
                    <td>
                      <?php echo $row['address'] ?>
                    </td>
                    <td>
                      <?php echo $row['registeredDate'] ?>
                    </td>
                    <td>
                      <a href="/patient-detail-form.php?id=<?= $row['patientId'] ?>" class="btn btn-primary mr-3 text-decoration-none text-white">Details</a>
                    </td>
                  </tr>
                <?php endforeach; ?>
              <?php else : ?>
                <tr>
                  <td colspan="8">
                    <div class="text-danger">No Information Now.</div>
                  </td>
                </tr>
              <?php endif; ?>
            </tbody>
          </table>

        </div>
      </div>
    </div>
  </main>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</body>

</html>