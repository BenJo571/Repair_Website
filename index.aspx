<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="loadindexPage" %> <html style="height: auto;">

<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Seacon | CarParking</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="../dist/css/adminlte.min.css">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kanit&subset=thai" rel="stylesheet">
	<style>
		.page_title_font {
			font-family: 'Kanit', sans-serif;
			width: 100% !important;
			margin: 0px !important;
		}

		.sidebar-mini.sidebar-collapse .main-sidebar,
		.sidebar-mini.sidebar-collapse .main-sidebar::before {
			margin-left: 0;
			width: 0.6rem;
		}

		.sidebar-mini.sidebar-collapse .content-wrapper,
		.sidebar-mini.sidebar-collapse .main-footer,
		.sidebar-mini.sidebar-collapse .main-header {
			margin-left: 0.6rem !important;
		}

		.dataTables_paginate {
			float: right !important;
		}

		.dataTables_filter {
			float: right !important;
			padding-top: 25px;
		}

		.mainPdfx {
			display: none;
		}

		.m {
			display: none;
		}

		.nav-pills .nav-link.active,
		.nav-pills .show>.nav-link {
			color: #fff;
			background-color: #314bfe;
			height: 150px;
			width: 120px;
			border-radius: 50px;
			margin: 20px;
			text-align: center;
			border: 8px solid #ddd;
			font-size: 24px;
			font-weight: bold;
		}

		.nav-pills .nav-link {
			color: #6c757d;
			height: 150px;
			width: 120px;
			border-radius: 50px;
			text-align: center;
			margin: 20px;
			border: 8px solid #ddd;
			font-size: 24px;
			font-weight: bold;
		}

		.INVBOX {
			width: 220px;
			border: 1px solid #ddd;
			float: left;
			padding: 5px;
		}

		.modal-lg {
			max-width: 80% !important
		}

		.modal-lm {
			max-width: 70% !important
		}

		.modal-backdrop.show {
			opacity: .70 !important
		}

		.group-start td {
			background-color: #6e8fb2;
			font-size: 16px;
			color: #fff;
		}

		.auto-style1 {
			height: 8px;
		}



		 /* The Modal (background) */
    .modal {
        display: none;
        /* Hidden by default */
        position: fixed;
        /* Stay in place */
        z-index: 1;
        /* Sit on top */
        left: 0;
        top: 0;
        width: 100%;
        /* Full width */
        height: 100%;
        /* Full height */
        overflow: auto;
        /* Enable scroll if needed */
        background-color: rgba(0, 0, 0, 0.4);
        /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
      /*  background-color: deepskyblue;*/
        margin: 10% auto;
        /* 10% from the top and centered */
        padding: 20px;
        border: 1px left #888;
        width: 80%;
        /* Could be more or less, depending on screen size */
    }

    /* Style the input fields */
    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

	</style>
</head>

<body class="sidebar-mini sidebar-collapse" style="height: auto;font-family: Helvetica;">



<input type="hidden" id="User_ID_sess" value="<%=Session["User_ID"] %>">
<input type="hidden" id="User_FirstName_sess" value="<%=Session["User_FirstName"] %>">
<input type="hidden" id="User_LastName_sess" value="<%=Session["User_LastName"] %>">
<input type="hidden" id="User_Department_sess" value="<%=Session["User_Department"] %>">
<input type="hidden" id="User_Email_sess" value="<%=Session["User_Email"] %>">
<input type="hidden" id="User_Type_sess" value="<%=Session["User_Type"] %>">
<input type="hidden" id="User_PhoneNumber_sess" value="<%=Session["User_PhoneNumber"] %>">


	<div style="position: fixed;width: 100%;height: 100%;z-index: 99999999999; top: 0; display: none;" class="LoadPagecheck">
		<div style=" background-image: url('bgopacity.png'); width:100%;height:100%;position:absolute;z-index:99;text-align:center;">
			<p style="margin-top: 13%;"></p>
			<h3 style="color:#202fe4;background-color: #fff;"> คุณต้องใช้<br><br>ในการใช้งาน</h3>
			<p></p>
		</div>
	</div>
	
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<!-- SEARCH FORM -->
			<!-- Right navbar links -->
		</nav>
		<!-- /.navbar -->
		<!-- Main Sidebar Container -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header" style="
    padding-bottom: 0px;
">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6"> <span style="
    /* margin-top: 0px; */
    display: inline-block;
    padding-top: 11px;
    font-size: 26px;
    letter-spacing: 8px;
">-<span style="font-weight:bold; color:#06F">R</span>epair SDC</span><span style="color:#F00; font-size: 26px;"> ( Develop )</span><img id="MenuControl_brand" class="img-responsive logo" src="https://www.seacon.co.th/wp-content/themes/sage/dist/images/06.2_seacon-fam_13.png?fbclid=IwAR0a50knEtVrkshzaSj1_Ao5O8ioykm5bZJAJIdz8LUbmeaBzc4L6xpCV60" style="
    height: 50px;
    float: left;
        margin-right: 10px;
"> </div>
						<div class="col-sm-6">
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<section class="content page_title_font">
					<div class="container-fluid">
					<!-- /.card -->
					<div  class="card card-primary card-outline">
						<right>
						<a style="background-color:red; height:10%; margin: 19px; float: right; " class="btn btn-primary" href="http://localhost/Service2/Homepage.aspx">ออกจากระบบ</a>

						</right>
							<div class="row" style="margin-bottom:10px;">
							<div class="panel panel-default" style="
    margin: 20px;
    width: 100%;
">
								<div class="panel-body" style="
    width: 100%;
">
									<div class="form-inline" role="form" id="">
										<div class="col-md-1" style="
    width: 330px;
">
											<div class="input-group " style="
    width: 250px !important;
"> </div>
										</div>
									</div>
								</div>
							</div>
						</div> <div class="card-header" style="padding:0px;">
							<h3 class="card-title" style="display:none"> <i class="fas fa-edit"></i> Tabs Custom Content Examples </h3>
						</div>
						<div class="card-body">
							<!--
            <div class="tab-custom-content">
              <p class="lead mb-0">Custom Content goes here</p>
            </div>
            -->
							<div class="tab-content" id="custom-content-above-tabContent">
								<div class="tab-pane fade active show" id="custom-rent" role="tabpanel" aria-labelledby="custom-rent-tab">
									<div style="
                    float: left;
                   
                    /* height: 155px; */
                    margin: 10px;
                    ">
										<h2>Schedule a Repair (<span style="color:#06F" class="txtTitle"></span>)</h2>
									</div>
									<div style="clear: both;">
									</div>
									<div style="clear:both">
									</div>
									<div class="containerx">
												<!-- ปุ่ม นะจ๊ะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะ-->
												<a class="btn btn-primary" href="http://localhost/Service2/frm_service.aspx">กรอกข้อมูล</a>

												<button data-toggle="modal" data-target="#Register_Owner" class="btn btn-primary Register_Owner" style="display:none" type="button">เพิ่มข้อมูลผู้ใช้งาน</button>
												<div class="table-responsive">
													<table id="MyTableTiket" class="table table-bordred table-striped">
														<thead>
															<tr>
																<!---     <th class="auto-style1">
                                                      <input type="checkbox" name="select_all" value="1" id="MyTableTiket-select-all"> Date</th>--->
																<!--   <th>MyGroup</th>  -->
																<th class="auto-style1">IDTickets</th>
																<th class="auto-style1">Date</th>
																<th class="auto-style1">ID_User</th>
																<th class="auto-style1">FirstName</th>
																<th class="auto-style1">LastName</th>
																<th class="auto-style1">PhoneNumber</th>
																<th class="auto-style1">Department</th>
																<th class="auto-style1">Problem</th>
																<th class="auto-style1">ID_Owner</th>
																<th class="auto-style1">Start_Date</th>
																<th class="auto-style1">Completedate</th>
																<th class="auto-style1">Comment</th>
																<th class="auto-style1">Status</th>
																<th class="auto-style1">Email</th>
																<th class="auto-style1">Total_OT_Hours</th>
																<th class="auto-style1">Action</th>
															</tr>
														<tbody>
															<td valign="top" colspan="14" class="dataTables_Body">
																<center> ไม่มีรายการ </center>
															</td>
														</tbody>
													</table>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
									</div>
								</div>			
							</div>
						</div>
			</section>
				
						
					</div>
					
				</div>
	<div>
		</div>
		<footer class="main-footer">

		</footer>
		<div>
		<div id="sidebar-overlay"></div>
	</div>
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="../plugins/jszip/jszip.min.js"></script>
	<script src="../plugins/pdfmake/pdfmake.min.js"></script>
	<script src="../plugins/pdfmake/vfs_fonts.js"></script>
	<script src="../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="../plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<script src="../plugins/datatables/dataTables.rowGroup.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	<!-- DataTables -->
	<script src="../plugins/moment/moment.js"></script>
	<script src="../plugins/xlsx/0.13.5/xlsx.full.min.js"></script>
	<script src="../plugins/xlsx/0.13.5/jszip.js"></script>
	<script src="../js/control.js"></script>
	<script src="../dist/js/adminlte.min.js"></script>
	<script>

        if ($('#User_Type_sess').val() == "User") {
            $('.txtTitle').text('User');

            Fn_GetDatatableByUser($('#User_ID_sess').val());

        } else if ($('#User_Type_sess').val() == "Super_Admin") {
            $('.txtTitle').text('Super Admin');
            $('.Register_Owner').show();
            Fn_GetDatatable();

        } else if ($('#User_Type_sess').val() == "Admin") {
            $('.txtTitle').text('Admin');

            Fn_GetDatatableByAdmin($('#User_ID_sess').val());

        } else if ($('#User_Type_sess').val() == "Technicain") {
            $('.txtTitle').text('Technicain');

            Fn_GetDatatableByTechnicain($('#User_ID_sess').val());

        }


    </script>
	<div id="result"> </div>
</body>

<div style="z-index:99999" class="modal fade" id="openEdit_customerrequest" role="dialog">
        <div class="modal-dialog modal-xl">
         <div class="modal-content" style="height:95%; width:105%">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title" ><span>Update</span></h4>
            </div>
            <div class="modal-body">
				<iframe class="openifram" src="" height="100%" width="100%" frameborder="0"></iframe>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
  </div> 

</html>

<div style="z-index:99999" class="modal fade" id="Register_Owner" role="dialog">
        <div class="modal-dialog modal-lg">
         <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" ><span>Register</span></h4>
              <button type="button" class="close" data-dismiss="modal">×</button>
              
            </div>
            <div class="modal-body">
            <div>
              <label for="username">Owner_ID : </label><input type="text" id="User_ID" name="user_id" required="">
			  <label for="username">Owner_Type : </label><input type="text" id="User_Owner_Type" name="onwer_type" required="">
			  <label for="username">Total_Money : </label><input type="text" id="User_Total_Money" name="total_money" required="">
              <label for="username">FirstName : </label><input type="text" id="firstname" name="firstname" required="">
              <label for="username">LastName : </label><input type="text" id="lastmame" name="lastname" required="">
              <label for="username">E-Mail : </label><input type="text" id="email" name="email" required="">
              <label for="password">Password : </label><input type="password" id="password" name="password" required="">
            </div>
            </div>
            <div class="modal-footer">
              <button type="button" id="btn btn-default" data-dismiss="modal" style="background-color:red;color:azure"">Close</button>
              <button type="button" id="btn_Resgister_Owner" style="background-color:seagreen;color:azure">Save</button>
            </div>
          </div>
          
        </div>
  </div> 




