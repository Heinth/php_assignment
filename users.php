<?php
include("includes/db_connet.php");
include("includes/functions.php");

$users = getAllUsers($conn);
$users_count = count($users);
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
            <h2>Users List</h2>
            <button class="btn btn-success"><a class="text-decoration-none text-white" href="/user-form.php">
                Add User
              </a>
            </button>
          </div>
        </div>
        <div class="row justify-content-center">
          <table class="table responsive">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">User Code</th>
                <th scope="col">Personal Code</th>
                <th scope="col">Person Type</th>
                <th scope="col">Specialization</th>
                <th scope="col">Address</th>
                <th scope="col">Registered Date</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php if ($users_count > 0) : ?>
                <?php foreach ($users as $row) : ?>
                  <tr>
                    <th scope="row">
                      <?php echo $row['UID'] ?>
                    </th>
                    <td>
                      <?php echo $row['name'] ?>
                    </td>
                    <td>
                      <?php echo $row['userCode'] ?>
                    </td>
                    <td>
                      <?php echo $row['personalCode'] ?>
                    </td>
                    <td>
                      <?php echo $row['personType'] ?>
                    </td>
                    <td>
                      <?php echo $row['specializing'] ?>
                    </td>
                    <td>
                      <?php echo $row['address'] ?>
                    </td>
                    <td>
                      <?php echo $row['registeredSince'] ?>
                    </td>
                    <td>
                      <a href="/user-detail-form.php?id=<?= $row['personalCode'] ?>" class="btn btn-primary mr-3 text-decoration-none text-white">Details</a>
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