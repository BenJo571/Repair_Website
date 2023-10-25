<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About_us.aspx.cs" Inherits="About_us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UFT-8"/>
    <meta name="viewport" content="width-device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <style>

        .navbar{
            display: flex;
            background-color: black;
            color: white;
        }

        .logo{
            width: 20px;
        }

        ul{
            width: 100%;    
            display: flex;
            justify-content:flex-start ;
            align-items: center ;
            list-style: none;
        }
        ul li{
            margin:0 1rem;   
        }

        body{
            margin: 0;
            padding: 0;
        }
    
        ul li a {
            text-decoration: none;
            color:white;
            font-size:20px;
        }
        .pic{
            width: 45%;
        }

        header{
            height: 500px;
            display: flex;
            border: 1px solid ;
            justify-content: center;
            align-items: center;
            background-image:url(https://img.freepik.com/free-photo/perspective-exterior-nobody-empty-box_1258-260.jpg);
        }
        .headerinfo{

            width: 500px;
            display:contents;
            border: 15px double black;
            justify-content: center;
            align-items: center;
            height: 300px;
            margin: 50px;
            padding: 3rem;
            background-image:url(https://img.freepik.com/free-photo/perspective-exterior-nobody-empty-box_1258-260.jpg);
         }

        input{
            display: block;
        }
    
        h1{
            font-family: candy;
        }

        a{
            font-family: candy;
        }

        label{
            font-family: candy;
        
        }

        footer{
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: black;
            color: white;
            text-align: center;
	        height: 20%;
            font-size:25px;
        }
        p,h3{
            font-family: candy;
            color: white;
            font-size:20px;
        }
        h2{
            font-family:Arial;
            color:white;
        }
        body {
            font-family: Candy;
            font-size: 20px;
        }

        .aboutus-section {
            padding: 90px;
        }
        .aboutus-title {
            font-size: 30px;
            letter-spacing: 0;
            line-height: 32px;
            margin: 0 0 39px;
            padding: 0 0 11px;
            position: relative;
            text-transform: uppercase;
            color: white;
        }
        .aboutus-title::after {
            background: #fdb801 none repeat scroll 0 0;
            bottom: 0;
            content: "";
            height: 2px;
            left: 0;
            position: absolute;
            width: 54px;
        }
        .aboutus-text {
            color: white;
            font-size: 20px;
            line-height: 25px;
            margin: 0 0 35px;
        }

        a:hover, a:active {
            color: #ffb901;
            text-decoration: none;
            outline: 0;
        }
        .aboutus-more {
            border: 1px solid #fdb801;
            border-radius: 25px;
            color: #fdb801;
            display: inline-block;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0;
            padding: 7px 20px;
            text-transform: uppercase;
        }
        .feature .feature-box .iconset {
            background: #fff none repeat scroll 0 0;
            float: left;
            position: relative;
            width: 18%;
    }
        .feature .feature-box .iconset::after {
            background: #fdb801 none repeat scroll 0 0;
            content: "";
            height: 150%;
            left: 43%;
            position: absolute;
            top: 100%;
            width: 1px;
        }

        .feature .feature-box .feature-content h4 {
            color: white;
            font-family: candy;
            font-size: 30px;
            letter-spacing: 0;
            line-height: 22px;
            margin: 0 0 5px;
        }
        .feature .feature-box .feature-content {
            float: left;
            padding-left: 28px;
            width: 78%;
        }
        .feature .feature-box .feature-content h4 {
            color: white;
            font-family: candy;
            font-size: 50px;
            letter-spacing: 0;
            line-height: 22px;
            margin: 0 0 5px;
        }
        .feature .feature-box .feature-content p {
            color: white;
            font-size: 20px;
            line-height: 50px;
        }
        .iconset {
            color : #f4b841;
            font: size 40px;
            border: 1px solid #fdb801;
            border-radius: 100px;
            color: #fdb801;
            font-size: 30px;
            height: 70px;
            line-height: 70px;
            text-align: center;
            width: 70px;
        }
</style>

</head>
    <section class="navbar">
 <div class="logo"></div>
    <p><img class="pic" src="data:image/png;base64,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"/></p>
    <ul>
       <li><a href="http://localhost/Service2/Homepage.aspx">หน้าแรก</a></li>
	   <li><a href="http://localhost/Service2/login.aspx">แจ้งซ่อม / อัปเดต</a></li>
	   <li><a href="http://localhost/Service2/Contact.aspx">ติดต่อ</a></li>
	   <li><a href="http://localhost/Service2/About_us.aspx">เกี่ยวกับเรา</a></li>
    </ul>
</section>
<body>
    <div style="border:10px solid ;background-color:#37517e;height:600px ;"/>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <div class="aboutus-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="aboutus">
                        <h2 class="aboutus-title">About Us</h2>
                        <p class="aboutus-text">ระบบแจ้งซ่อมออนไลน์ เป็นโปรแกรมสำหรับ จัดการงานซ่อมบำรุงออนไลน์ ภายในองค์กร สามารถบริหารจัดการงานซ่อมบำรุง บันทึกข้อมูลการทำงาน รับแจ้งซ่อมจากผู้ใช้งาน บันทึกทะเบียนอุปกรณ์ประวัติและระบบรายงานที่สรุปข้อมูลต่าง ๆ ที่เกี่ยวกับการซ่อมบำรุง</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="aboutus-banner">
       <img style="width: 95%; transform: translateY(-15%);" src="https://lh3.googleusercontent.com/pw/AJFCJaW8b_9Sk4TCidhFZuLHWi_ZTlAXPb_GqIH0TtRiVMq9Vx4jZXmnOtk2P9jrOHtXJkFqNPyhZRIXlKrt77U1P251NiHYmpsPYGIXMFWzkt03tmYfSNuNVx88AfHb0EFqrEMrwqx6KkO0knzQOwhFe6fzs76YY2yaYpKfQqv76ioMCptU9QiYH1J7j0itx9Z5xxlI7mXXOz0yjSwfZ05D690EWHZ8EJ3IXZTatoaXrHElMsd4oLsq-XLTrlyOenUoNPee2YENv-TMmhUEIC5BtQsikIf0Y_ivXbNIE1LQSi4WzKPxm2hjS2eOPcq0sTi1crNbf7PaOclnJurXwIbGXtueij9fYJ5SFKYUciQ6DZKKYjp8KovpdKTtDJW5QE-4HXchvBp7lG7soCC7fzR8fjE5K5BrrHAcETpv2U60-guZil3amKKZnoAinTLgi2DGoAFcjWP6VC-9JoQXKwktHE1axdDDSNj0wNRu2vOmjc2tHgR8Em6_mRgSPUOFx7xZpWtfoyt0L-bolI_f5QSmiIegiQ1CvKTnnc2QPZJrbsLg3GYji3R5OGurdV0LfIqlbPQFtQD5LpW0xsJD8HGtKoSE4W0U2tKVDGs8KQ1IjOEnVKZeyNULYaRRYZtt39idSD-FQw0bhKCo00nd7Jzh6JHs9m1y7q-glGRWuQdsApty52cYBbksH-a_XCxOILKSpAZM-pfVtarJA6iI1ESlBKydA1nNtGPn2TWD2mVHjGQYbu1sy07hwnT2b8-_iB_Zk0ADT8A8t9ha5bYtDSNp5_8k6QiNDeQEChcHF4tyilWKblq71D3Jk86tSwdAhqJ524RaDNsVqorIaaXUh2XEB0XcAAsk0gmBjUgWoeIGaXR-kSrJ7loLjFlU4AffGH0wgw4KNnn5jmknx9nz_XArxg=w274-h630-s-no?authuser=0">

                    </div>
                </div>
                <div class="col-md-5 col-sm-6 col-xs-12">
                    <div class="feature">
                        <div class="feature-box">
                            <div class="clearfix">
                                <div class="iconset">
                                    <span class="glyphicon glyphicon-cog icon"></span>
                                </div>
                                <div class="feature-content">
                                    <h4>Work with heart</h4>
                                    <p>ทำงานด้วยใจ</p>
                                </div>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="clearfix">
                                <div class="iconset">
                                    <span class="glyphicon glyphicon-cog icon"></span>
                                </div>
                                <div class="feature-content">
                                    <h4>Reliable services</h4>
                                    <p>บริการไว้ใจได้</p>
                                </div>
                            </div>
                        </div>
                        <div class="feature-box">
                            <div class="clearfix">
                                <div class="iconset">
                                    <span class="glyphicon glyphicon-cog icon"></span>
                                </div>
                                <div class="feature-content">
                                    <h4>Great support</h4>
                                    <p>ซัพพอร์ตดี</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<footer>&copy;2023
        <div class="footer-content"></div>
        <h3>เกี่ยวกับเรา</h3>
        <p>เว็บไซต์นี้จัดทำขึ้นเพื่อใช้ในการแจ้งซ่อม และติดตามความคืบหน้าของงาน</p>
    </footer>
