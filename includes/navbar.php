<?php
$org_uri = $_SERVER['REQUEST_URI'];
$uri = ltrim($org_uri, '/');
$uri = preg_replace('/\.php$/', '', $uri);
?>

<aside class="sidebar">
    <div class="toggle">
        <a href="#" class="burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
            <span></span>
        </a>
    </div>
    <div class="side-inner">

        <div class="profile">
            <img src="images/person_profile.jpg" alt="Image" class="img-fluid">
            <h3 class="name">Debby Williams</h3>
            <span class="country">New York, USA</span>
        </div>

        <div class="counter d-flex justify-content-center">
            <!-- <div class="row justify-content-center"> -->
            <div class="col">
                <strong class="number">892</strong>
                <span class="number-label">Posts</span>
            </div>
            <div class="col">
                <strong class="number">22.5k</strong>
                <span class="number-label">Followers</span>
            </div>
            <div class="col">
                <strong class="number">150</strong>
                <span class="number-label">Following</span>
            </div>
            <!-- </div> -->
        </div>

        <div class="nav-menu">
            <ul>
                <li class="<?= $uri === 'index' || $org_uri === "/" ? 'active' : '' ?>"><a href="/"><span class="icon-home mr-3"></span>Patients List</a></li>
                <li class="<?= $uri === 'users' ? 'active' : '' ?>"><a href="/users.php"><span class="icon-home mr-3"></span>Employee List</a></li>
            </ul>
        </div>
    </div>

</aside>