<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UFT-8"/>
    <meta name="viewport" content="width-device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com_font-awesome_4.7.0_css_font-awesome.min.css"/>
    
    <style>
        .container{
            display: flex;
            border: 50px solid red ;
}    
    

        .navbar{
            display: flex;
            background-color: black;
            color: white;
    }

        .logo{
            width: 20px;
       
    }

        ul {
            width: 100%;    
            display: flex;
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
            font-size:30px;
    
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
            display:10;
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
            font-family: 'Angsana New';
            font-size:50px;
        }
        a{
            font-family: 'Angsana New';
        }

        label{
            font-family: 'Angsana New';
        }
        footer{
            position: inherit;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: black;
            color: white;
            text-align: center;
            font-size:25px;
            height:5%;
   
    }
        p{
            font-family: 'Angsana New';
            color: aliceblue;
            font-size:25px;
        }
        h3{
            font-family:'Angsana New';
            color:white;
            font-size:25px;
        }
        h2{
            font-family:Arial;
            color:white;
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




    <div style="border:10px solid ;background-color:#d8d4b8;height:600px ;">
        
        
        <div style="border: 10px solid #d8d4b8;display:flex;">
            <img style="border: 10px solid #d8d4b8;width:30%" src="https://service-clouds.com/assets/img/2.png"/>
            <h1 style="border: 5px solid #d8d4b8 ;width: 20%;height:10%;text-align: center;color: black;">ระบบแจ้งซ่อม</h1><br/>
            <h2 style="border: 5px solid #d8d4b8;color: grey;width: 800px;">ระบบแจ้งซ่อมออนไลน์ เป็นระบบที่บริการเกี่ยวกับรับงานแจ้งซ่อมบำรุงภายในบริษัท
                                                                                <br/>
                                                                                บันทึกข้อมูลการซ่อม มีการคำนวณชั่วโมงการทำงานทั้งหมด ชั่วโมงการทำงาน 
                                                                                <br/> 
                                                                                และการใส่ชั่วจำนวนเวลาการทำ OT และคำนวณเงินออกมาให้กับตัวช่าง
                                                                                <br/>
                                                                                การบันทึกระบบทะเบียนอุปกรณ์ ประวัติการซ่อมระบบรายงานการซ่อม ฯลฯ</h2>
            

        </div>

    </div>
    
</body>

    <footer>&copy;2023


    <div class="footer-content"></div>
    <h3>เกี่ยวกับเรา</h3>
    <p>เว็บไซต์นี้จัดทำขึ้นเพื่อใช้ในการแจ้งซ่อม และติดตามความคืบหน้าของงาน</p>
    <ul class="socials">
        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
    </ul>    

    
    </footer>
</html>
