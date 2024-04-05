<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="{{asset('backend/img/logo/logo.png')}}" rel="icon">
  <title>Inventory - Dashboard</title>
  <link rel="stylesheet" href="{{asset('css/app.css')}}">
  <link href="{{asset('backend/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
  <link href="{{asset('backend/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
  <link href="{{asset('backend/css/ruang-admin.min.css')}}" rel="stylesheet">


</head>

<body id="page-top">
  <div id="app">

    <div id="wrapper">
      <!-- Sidebar -->
      <nav id="sidebar" v-show="$route.path === '/' || $route.path === '/register' || $route.path === '/forget'? false: true " style="display: none">
        <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
          <router-link class="sidebar-brand d-flex align-items-center justify-content-center" to="/home">
            <div class="sidebar-brand-icon">
              <img src="{{asset('backend/img/logo/logo2.png')}}">
            </div>
            <div class="sidebar-brand-text mx-3">Admin</div>
          </router-link>
          <hr class="sidebar-divider my-0">
          <li class="nav-item active">
            <router-link class="nav-link" to="/home">
              <i class="fas fa-fw fa-tachometer-alt"></i>
              <span>Dashboard</span></router-link>
          </li>

          <hr class="sidebar-divider">

          <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInventory" aria-expanded="true" aria-controls="collapseInventory">
              <i class="fas fa-list-alt"></i>
              <span>Inventory</span>
            </a>
            <div id="collapseInventory" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                <router-link class="collapse-item" to="/inventory">Inventory</router-link>
              </div>
            </div>
          </li>


        </ul>
      </nav>
      <!-- Sidebar End -->
      <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
          <!-- TopBar -->
          <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top" v-show="$route.path === '/' || $route.path === '/register' || $route.path === '/forget'? false: true " id="topbar" style="display: none">
            <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>
            <ul class="navbar-nav ml-auto">

              <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <img class="img-profile rounded-circle" src="{{asset('backend/img/boy.png')}}" style="max-width: 60px">
                  <span class="ml-2 d-none d-lg-inline text-white small">Admin</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                  <router-link class="dropdown-item" to="/logout">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                  </router-link>
                </div>
              </li>
            </ul>
          </nav>
          <!-- Topbar End -->

          <!-- Container Fluid-->
          <div class="container-fluid" id="container-wrapper">

            <router-view></router-view>

          </div>
          <!---Container Fluid-->
        </div>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>copyright &copy; <script>
                  document.write(new Date().getFullYear());
                </script>

              </span>
            </div>
          </div>
        </footer>
        <!-- Footer -->
      </div>
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="{{asset('js/app.js')}}"></script>
  <script src="{{asset('backend/vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('backend/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset('backend/vendor/jquery-easing/jquery.easing.min.js')}}"></script>
  <script src="{{asset('backend/js/ruang-admin.min.js')}}"></script>
  <script src="{{asset('backend/vendor/chart.js/Chart.min.js')}}"></script>
  <script src="{{asset('backend/js/demo/chart-area-demo.js')}}"></script>
  <script>
    let token = localStorage.getItem('token');
    if (token) {
      $('#sidebar').css("display", "");
      $('#topbar').css("display", "");

    }
  </script>
</body>

</html>