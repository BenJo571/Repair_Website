<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frm_service.aspx.cs" Inherits="frm_service" %> <html style="height: auto;">

<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Seacon | CarParking</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<style>
		body {
			background-image: url("https://img.freepik.com/premium-photo/3d-illustration-close-up-black-orange-cyber-armor-neon-lights-abstract-graphics-style-computer-games_116124-7998.jpg?w=2000&fbclid=IwAR0Boc09gjkbDY2liVhs20OBteoJL0uqezi62RHaeZsRsdbFh-gawifepnU");
		}

		.register {
			background: -webkit-linear-gradient(left, #5F9EA0, #00c6ff);
			margin-top: 3%;
			padding: 3%;
		}

		.register-left {
			text-align: center;
			color: #fff;
			margin-top: 4%;
		}

		.register-left input {
			border: none;
			border-radius: 1.5rem;
			padding: 2%;
			width: 60%;
			background: #f8f9fa;
			font-weight: bold;
			color: #383d41;
			margin-top: 30%;
			margin-bottom: 3%;
			cursor: pointer;
		}

		.register-right {
			background: #f8f9fa;
			border-top-left-radius: 10% 50%;
			border-bottom-left-radius: 10% 50%;
		}

		.register-left img {
			margin-top: 15%;
			margin-bottom: 5%;
			width: 25%;
			-webkit-animation: mover 2s infinite alternate;
			animation: mover 1s infinite alternate;
		}

		@-webkit-keyframes mover {
			0% {
				transform: translateY(0);
			}

			100% {
				transform: translateY(-20px);
			}
		}

		@keyframes mover {
			0% {
				transform: translateY(0);
			}

			100% {
				transform: translateY(-20px);
			}
		}

		.register-left p {
			font-weight: lighter;
			padding: 12%;
			margin-top: -9%;
		}

		.register .register-form {
			padding: 10%;
			margin-top: 10%;
		}

		.btnRegister {
			float: left;
			margin-top: 10%;
			border-radius: 1.5rem;
			padding: 2%;
			background: #00BFFF;
			color: #fff;
			font-weight: 600;
			width: 25%;
			text-align:center;
			cursor: pointer;
		}

		.btnRegisteri {
			float: left;
			margin-top: 10%;
			border: none;
			border-radius: 1.5rem;
			padding: 2%;
			background: #CC3300;
			color: #fff;
			font-weight: 600;
			width: 25%;
			cursor: pointer;
		}

		.register .nav-tabs {
			margin-top: 3%;
			border: none;
			background: #87CEFA;
			border-radius: 1.5rem;
			width: 28%;
			float: right;
		}

		.register .nav-tabs .nav-link {
			padding: 2%;
			height: 34px;
			font-weight: 600;
			color: #fff;
			border-top-right-radius: 1.5rem;
			border-bottom-right-radius: 1.5rem;
		}

		.register .nav-tabs .nav-link:hover {
			border: none;
		}

		.register .nav-tabs .nav-link.active {
			width: 100px;
			color: #000000;
			border: 2px solid #87CEFA;
			border-top-left-radius: 1.5rem;
			border-bottom-left-radius: 1.5rem;
		}

		.register-heading {
			text-align: center;
			margin-top: 8%;
			margin-bottom: -15%;
			color: #495057;
		}
	</style>
	<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
	<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/adminlte.min.css">
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
	</style>
</head>
<script type="text/javascript">
</script>

<body class="sidebar-mini sidebar-collapse" style="height: auto;font-family: Helvetica;">
	<input type="hidden" id="User_ID_sess" value="<%=Session["User_ID"] %>">
	<input type="hidden" id="User_FirstName_sess" value="<%=Session["User_FirstName"] %>">
	<input type="hidden" id="User_LastName_sess" value="<%=Session["User_LastName"] %>">
	<input type="hidden" id="User_Department_sess" value="<%=Session["User_Department"] %>">
	<input type="hidden" id="User_Email_sess" value="<%=Session["User_Email"] %>">
	<input type="hidden" id="User_Type_sess" value="<%=Session["User_Type"] %>">
	<input type="hidden" id="User_PhoneNumber_sess" value="<%=Session["User_PhoneNumber"] %>">
	<input type="hidden" id="txt_Unit_OT" value="">
	<div class="container register shadow-lg p-3 mb-5 bg-body rounded ">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://www.nganyiam.com/uploads/9641156d8ad6ab9a.jpg" alt="">
				<h3>Welcome.</h3>
			</div>
			<div class="col-md-9 register-right">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
				</ul>
				<!-- information -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<h3 class="register-heading">Information</h3>
						<div class="row register-form">
							<h1 class="txtDocID"></h1>
							<div class="col-md-12">
								<h1>ⓘ กรอกรายละเอียด</h1>
							</div>
							<div class="form-group">
								<div class="form-group">
									<label>ID_User</label>
									<input type="text" class="form-control txt_ID_User" placeholder="ID_User" value="">
								</div>
								<div class="form-group">
									<label>FirstName</label>
									<input type="text" class="form-control txt_FirstName" placeholder="First Name : *" value="">
								</div>
								<div class="form-group">
									<label>LastName</label>
									<input type="text" class="form-control txt_LastName" placeholder="Last Name : *" value="">
								</div>
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<label>PhoneNumber</label>
									<input type="text" class="form-control txt_PhoneNumber" placeholder="Phone Number : *" value="">
								</div>
								<div class="form-group">
									<label>Department </label>
									<select class="form-control txt_Department">
										<option value="">Select a department </option>
										<option value="การตลาด">การตลาด</option>
										<option value="พัฒนาธุรกิจ">พัฒนาธุรกิจ</option>
										<option value="ปฏิบัติการ">ปฏิบัติการ</option>
										<option value="บัญชี-การเงิน">บัญชี-การเงิน</option>
										<option value="กฎหมาย">กฎหมาย</option>
										<option value="บุคคล">บุคคล</option>
									</select>
								</div>
								<div class="form-group">
									<label>Email</label>
									<input type="text" name="txt_Email" class="form-control txt_Email" placeholder=" E-mail : *" value="">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>Problem</label>
									<textarea type="" class="form-control txt_Problem" placeholder="Problem : *" value=""></textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<a class="btnRegister" id="btn_insertservice" style="display:none;">Submit</a>
								</div>
							</div>
							<div class="col-md-12" id="box2" style="display:none;">
								<div class="form-group">
									<h1>👤<span style="color:#000000" class="txtTitle"></span></h1>
									<label>Owner</label>
									<select class="form-control txt_ID_Owner loopOwner" placeholder="เลือกช่าง" value="">
										<option value="">เลือกช่าง </option>
										<option value="Marketing">ช่าง1</option>
										<option value="Sales">ช่าง2</option>
										<option value="Finance">ช่าง3</option>
										<option value="Human Resources">ช่าง4</option>
									</select>
								</div>
								<div class="form-group">
									<label>Owner_Type</label>
									<input type="text" class="form-control txt_Owner_Type" placeholder="Owner_Type" value="">
								</div>
								<div class="form-group">
									<label>Start_Date</label>
									<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
										<input type="text" class="form-control txt_Date" data-target="#reservationdatetime">
										<div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>Complete_Date</label>
									<div class="input-group date" id="reservationdatetime2" data-target-input="nearest">
										<input type="text" class="form-control txt_Completedate" data-target="#reservationdatetime2">
										<div class="input-group-append" data-target="#reservationdatetime2" data-toggle="datetimepicker">
											<div class="input-group-text" onclick="caldatediff()"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-4">
											<div class="form-group">
												<label>Total_Working_Hours</label>
												<input type="number" id="Total_Working_Hours" class="form-control Total_Working_Hours" placeholder="Total_Working_Hours" value="">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Total_OT_Hours</label>
												<input type="number" id="Total_OT_Hours" class="form-control form-control Total_OT_Hours" value="0" min="0">
											</div>
										</div>

										<lable>**8 ชั่วโมงเท่ากับการทำงานปกติ 1 วัน**</lable>
									</div>
									<div class="row" style="margin-top: 10px;">

									<div class="col-md-12">
										<div class="form-group">
											<label>Total_Money</label>
									<input type="text" class="form-control txt_Total_Money" placeholder=" ฿ " value="">
										</div>
									</div>
										<lable> ชั่วโมง_OT = <span class="txt_OT_OT">***</span> ต่อชั่วโมง</lable>
										</div>
									<div class="row" style="margin-top: 10px;">
									<div class="col-md-12">
										<div class="form-group">
											<label>Comment</label>
											<textarea type="" class="form-control txt_Comment" placeholder="Comment : *" value=""></textarea>
										</div>
									</div>
										</div>
								</div>
								<div class="col-md-6"></div>
								<div class="col-md-6">
									<div class="form-group">
										<a class="btnRegister" id="btn_updateservice" style="display:none;">Update</a>
										<a class="btnRegisteri" id="btn_deletefrmservice" style="display:none;">Delete</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<script src="plugins/daterangepicker/moment.min.js"></script>
	<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script src="https://adminlte.io/themes/v3/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="plugins/jszip/jszip.min.js"></script>
	<script src="plugins/pdfmake/pdfmake.min.js"></script>
	<script src="plugins/pdfmake/vfs_fonts.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<script src="plugins/datatables/dataTables.rowGroup.min.js"></script>
	<script src="dist/js/demo.js"></script>
	<script src="plugins/xlsx/0.13.5/xlsx.full.min.js"></script>
	<script src="plugins/xlsx/0.13.5/jszip.js"></script>
	<script src="js/control.js"></script>
	<script src="dist/js/adminlte.min.js"></script>
	<script>

		if ($('#User_Type_sess').val() == "User") {
			$('.txtTitle').text('กำหนดวัน/เวลา');
		} else {
            $('.txtTitle').text('ผู้ดำเนินงาน');
		}
		
	
		
        $('#reservationdatetime').datetimepicker({
            icons: {
                time: 'far fa-clock'
            },
            pick12HourFormat: false,
            format: 'YYYY-MM-DD HH:mm'
        });
        $('#reservationdatetime2').datetimepicker({
            icons: {
                time: 'far fa-clock'
            },
            pick12HourFormat: false,
            format: 'YYYY-MM-DD HH:mm'
        });

        function getUrlVars() {
            var vars = {};
            var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
                vars[key] = value;
            });
            return vars;
        };

		var DocID = getUrlVars()["tid"];

		alert(DocID)

		$('#btn_insertservice').show();
        if (DocID === undefined || DocID === null || DocID == "undefined") {
            var User_FirstName_sess = $('#User_FirstName_sess').val();
            var User_LastName_sess = $('#User_LastName_sess').val();
            var User_ID_sess = $('#User_ID_sess').val();
            var User_Email_sess = $('#User_Email_sess').val();
            var User_Department_sess = $('#User_Department_sess').val();
            var User_PhoneNumber_sess = $('#User_PhoneNumber_sess').val();

			$('.txt_FirstName').val(User_FirstName_sess);
            $('.txt_LastName').val(User_LastName_sess);
            $('.txt_ID_User').val(User_ID_sess);
            $('.txt_Email').val(User_Email_sess);
            $('.txt_Department').val(User_Department_sess);
            $('.txt_PhoneNumber').val(User_PhoneNumber_sess);
            loopOwner();
        } else {
            loopOwner();
            Fn_ByRepairItem(DocID);
        }

        function caldatediff() {
            a = $('.txt_Date').val() + ":00";
            a = moment(a).format('YYYY-MM-DD HH:mm:ss');
            b = $('.txt_Completedate').val() + ":00";
            b = moment(b).format('YYYY-MM-DD HH:mm:ss');

            // var a = moment($('.txt_Date').val()).format('DD/MM/YYYY');
            //var a = moment("20/05/2023").format('DD/MM/YYYY');
            //var a = moment($('.txt_Date').val(), "DD MM YYYY hh:mm:ss");
            //var b = moment($('.txt_Completedate').val(), "DD MM YYYY hh:mm:ss");
            //   var a = moment($('.txt_Date').val()).format('LLLL');
            //   var b = moment($('.txt_Completedate').val()).format('LLLL');

            var Total_Working_Hours = (moment(b).diff(moment(a), 'days') * 8);

			if (Total_Working_Hours >= 8) {
				Total_OT_Hours = Total_Working_Hours - 8
                $('.Total_OT_Hours').val(Total_OT_Hours);
				$('.Total_Working_Hours').val(Total_Working_Hours);
			} else {
				Total_OT_Hours = "No_OT";
                $('.Total_Working_Hours').val("0");
			}
        e = $('#txt_Unit_OT').val(); //กำหนดค่า e เป็นค่า ราคาของการทำ OT/ชั่วโมง เช่น ชั่วโมงละ 60 บาท 
        Unit_OT = e * Total_OT_Hours; // กำหนด Unit_OT เพื่อเป็นตัวแปร และ คิดเงินชั่วโมง OT โดยนำ Unit_OT * Total_OT_Hours
        $('.txt_Total_Money').val(Unit_OT); //นำค่าตัวแปร Unit_OT นำค่าย้อนกลับไปเพื่อแสดงผลในช่อง Total_Money ในแบบฟอร์ม
        }
            


    </script>
	<div id="result"> </div>
</body>

body>

