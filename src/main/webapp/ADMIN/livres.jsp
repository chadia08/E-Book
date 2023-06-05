<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>books</title>
	 <script src="https://kit.fontawesome.com/45e38e596f.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<style type="text/css">
			<%@ include file="/min2.css" %>
			<%@ include file="/all.min.css" %>
</style>
</head>

<body id="page-top">
<%
	HttpSession sess = request.getSession(false);
    String mail =(String) sess.getAttribute("emailadmin");
 %>
    
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost:3306/ebook"  user="root"  password=""/>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-book"></i>
                </div>
                <div class="sidebar-brand-text mx-3">E-BOOK</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/library/dashboard.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-book"></i>
                    <span>Books</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Books:</h6>
                        <a class="collapse-item" href="#">add</a>
                        <a class="collapse-item" href="#">update</a>
                        <a class="collapse-item" href="#">delete</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-user"></i>
                    <span>Users</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">users</h6>
                        <a class="collapse-item" href="#">show list</a>
                        <a class="collapse-item" href="#">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                         <!-- Nav Item - Tables -->
                        <a class="nav-link" href="tables.html"></a>
                    </div>
                </div>
            </li>

           
           

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Notifications
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2023</div>
                                        <span class="font-weight-bold">Lorem ipsum dolor sit amet consectetur adipisicing!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2023</div>
                                        Quos ipsa labore mollitia assumenda odit? Ipsum, iusto
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2023</div>
                                        veritatis natus ea eius vitae laboriosam dolor
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All notifications</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate"> Error molestiae, voluptatum autem dolorem ex alias, veniam unde exercitationem, tenetur ea recusandae nisi suscipit?</div>
                                        <div class="small text-gray-500">chadia · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate"> Optio, doloremque libero. Magni accusamus qui debitis.</div>
                                        <div class="small text-gray-500">Mohsin · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Lorem ipsum dolor sit, amet consectetur adipisicing elit.</div>
                                        <div class="small text-gray-500">chadia · 2d</div>
                                    </div>
                                </a>
                                
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                      <!---------------------------- Dropdown - User Information ------------------------>
                             <li class="nav-item dropdown" id="userDropdown">
						    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
						    	<span class="mr-2 d-none d-lg-inline text-gray-600 small">admin@gmail.com</span>
						        <img class="img-profile rounded-circle" src="https://img.freepik.com/vecteurs-premium/profil-avatar-homme-icone-ronde_24640-14044.jpg">
						    </a>
						    <ul class="dropdown-menu">
						      <li><a class="dropdown-item" href="#"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile</a></li>
						      <li><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>Settings</a></li>
						      <li><hr class="dropdown-divider"></li>
						      <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a></li>
						    </ul>
						 </li>
                   
                        </ul>

                </nav>
                <!-- End of Topbar -->

        <!------------------------------------------- Begin Page Content -------------------------------------------->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Books</h1>
                    </div>
                     <form class='align-items-end row row-cols-sm-auto row-cols-md-auto row-cols-lg-auto g-3  mb-4 d-flex '  action='searchbook' method='POST'>
		      			<div class="col-12 title">
							<h5>Liste des Livres :</h5>
					 	</div>
					  	<div class="col-12 ">
					    	<div class="input-group">
					      		<input type="text" class="form-control form-control-sm" placeholder="Search" name='id_livre' >
					      		<button type="submit" class="btn btn-dark btn-sm rounded-end">search</button>			    
					      		<div class="col-3">
					      			<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModalajouterlivre" class="btn btn-primary btn-sm ms-4 pl-2 pr-2">Add</button>
					      		</div>
			    			</div>
			  			</div>
					</form>
                    <div class="table-responsive">
       					 <table class="table table-striped table-hover table-sm">
          					<thead class="bg-dark text-light">
            					<tr>
              						<th>Id</th>
              						<th>Titre</th>
              						<th>Auteur</th>
              						<th>Categorie</th>
              						<th>Nombre de pages</th>
              						<th>Prix</th>
              						<th>Actions</th>
            					</tr>
          					</thead>
          					<sql:query dataSource="${db}" var="res">  SELECT * from livre;  </sql:query> 
          
          					<tbody>
            					<c:forEach var="book" items="${res.rows}">
									<tr>
										<td><c:out value="${book.id_livre}" /></td>
										<td><c:out value="${book.titre}" /></td>
										<td><c:out value="${book.auteur}" /></td>
										<td><c:out value="${book.categorie}" /></td>
										<td><c:out value="${book.nbpages}" /></td>
										<td><c:out value="${book.prix}" /></td>
              							<td>
              								<a href="editbook?id_livre=<c:out value='${book.id_livre}' />" class='link-primary' ><i class="fas fa-pen"></i></a>
              								<a href="deletebook?id_livre=<c:out value='${book.id_livre}' />" class="text-danger me-3 ms-3"> <i class="fas fa-trash"> </i> </a>
              							</td>
           							</tr>
            					</c:forEach>
            
         					</tbody>
        				</table>
      				</div>
			</div>
      
    </main>
  </div>
</div>

		<!----------------------------------- modal----------------------------------------------->
					
					<form action="insertbook" method="post" accept-charset="utf-8" >
					<div class="modal fade" id="exampleModalajouterlivre" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">ADD BOOK</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <div  class="row g-3" >
					  <div class="col-md-2">
					    <label for="validationDefault01" class="form-label">Id</label>
					    <input type="text" class="form-control" id="validationDefault01"  lang='fr'   name='id_livre' required>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault02" class="form-label">Titre</label>
					    <input type="text" class="form-control" id="validationDefault02" lang='fr'   name='titre' required>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault03" class="form-label">Auteur</label>
					    <input type="text" class="form-control" id="validationDefault03"  lang='fr'  name='auteur' required>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault04" class="form-label">Categorie</label>
					    <select class="form-select" aria-label="Default select example"  lang='fr'  name='categorie' id='validationDefault04'>
					  <option selected>Choisir...</option>
					  <option value="Litterature et fiction">Litterature et fiction</option>
					  <option value="Litterature sentimentale">Litterature sentimentale</option>
					  <option value="Essais et documents.">Essais et documents</option>
					  <option value="Policier et thriller">Policier et thriller</option>
					  <option value="Biographies">Biographies</option>
					  <option value="Commerce et finance">Commerce et finance</option>
					  <option value="Science">Science</option>
					  <option value="Fantasy">Fantasy</option>
					</select>
					  </div>
					  <div class="col-md-3">
					    <label for="validationDefault05" class="form-label">Nombre de pages</label>
					    <input type="text" class="form-control" id="validationDefault05" lang='fr'  name='nbpages' >
					  </div>  
					  <div class="col-md-12">
					    <label for="exampleFormControlTextarea1">Description</label>
					    <textarea class="form-control" id="exampleFormControlTextarea1" lang='fr'    name='description' rows="3"></textarea>
					  </div>
					  <div class="col-md-4">
					    <label for="validationDefault03" class="form-label">Image</label>
					    <input type="text" class="form-control" id="validationDefault06"  lang='fr'  name='auteur' required>
					  </div>
					  <div class="col-md-3">
					    <label for="validationDefault05" class="form-label">Prix</label>
					    <input type="text" class="form-control" id="validationDefault06" lang='fr'  name='prix' >
					  </div>
					</div>
					
					      </div>
					      <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">Confirmer</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					
					</form>
                    
          

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; E-BOOK 2023</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
	    if (urlParams.has('msg')) {
				 Swal.fire({
	  		icon: 'success',
	  		title: 'The Book has been added successfully',
	  		text: urlParams.get('msg')
	});
    </script>
    
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js"></script>
    <script src="jquery.easing.min.js"></script>
    <script src="sb-admin-2.min.js"></script>
   
</body>
</html>