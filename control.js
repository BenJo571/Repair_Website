

$(document).delegate('#btn_Resgister_Save', 'click', function (event) {

    var User_ID = $('#User_ID').val();
    var FirstName = $('#firstname').val();
    var LastName = $('#lastmame').val();
    var Email = $('#email').val();
    var Password = $('#password').val();


    Fn_SignUp(User_ID, FirstName, LastName, Email, Password)



    //$("#exampleModalCenter").modal({ show: true }); 

});



$(document).delegate('#btn_Resgister_Owner', 'click', function (event) {

    var User_ID = $('#User_ID').val();
    var User_Owner_Type = $('#User_Owner_Type').val();
    var User_Total_Money = $('#User_Total_Money').val();
    var FirstName = $('#firstname').val();
    var LastName = $('#lastmame').val();
    var Email = $('#email').val();
    var Password = $('#password').val();


    Fn_Resgister_Owner(User_ID, User_Owner_Type, User_Total_Money, FirstName, LastName, Email, Password)



    //$("#exampleModalCenter").modal({ show: true }); 

});



$(document).delegate('.loopOwner', 'change', function (event) {






    $('.txt_Owner_Type').val($('.Owner_' + $(this).val()).attr('rid'));

    $('#txt_Unit_OT').val($('.Owner_' + $(this).val()).attr('pid'));

    //$("#exampleModalCenter").modal({ show: true });

});



$(document).delegate('.btnEdit_customerrequest', 'click', function (event) {



    var tid = $(this).attr('tid');


    $('.openifram').attr('src', '../frm_service.aspx?tid=' + tid);



});


$(document).delegate('#btn_login', 'click', function (event) {

    var Username = $('.txt_username').val();
    var Password = $('.txt_password').val();


    Fn_CheckLogin(Username, Password);

});


$(document).delegate('#btn_insertservice', 'click', function (event) {

    var ID_User = $('.txt_ID_User').val();
    var FirstName = $('.txt_FirstName').val();
    var LastName = $('.txt_LastName').val();
    var PhoneNumber = $('.txt_PhoneNumber').val();
    var Department = $('.txt_Department').val();
    var Email = $('.txt_Email').val();
    var Problem = $('.txt_Problem').val();
    var Repair_Start_Date = $('.txt_Date').val();
    //   var Repair_ID_Owner = $('.txt_ID_Owner').val();



    Fn_Insertservice(ID_User, FirstName, LastName, PhoneNumber, Department, Email, Problem, Repair_Start_Date)

});



$(document).delegate('#btn_updateservice', 'click', function (event) {




    var Repair_IDTickets = $('.txtDocID').text();
    var Repair_ID_User = $('.txt_ID_User').val();
    var Repair_FirstName = $('.txt_FirstName').val();
    var Repair_LastName = $('.txt_LastName').val();
    var Repair_PhoneNumber = $('.txt_PhoneNumber').val();
    var Repair_Department = $('.txt_Department').val();
    var Repair_Email = $('.txt_Email').val();
    var Repair_Problem = $('.txt_Problem').val();
    var Repair_ID_Owner = $('.txt_ID_Owner').val();
    var Repair_Comment = $('.txt_Comment').val();
    var Repair_Start_Date = $('.txt_Date').val(); //เก็บค่าเป็น ID
    var Repair_Completedate = $('.txt_Completedate').val();
    var Repair_Total_OT_Hours = $('.Total_OT_Hours').val();
    var Repair_Total_Money = $('.txt_Total_Money').val();
    var Repair_Unit_OT = $('#txt_Unit_OT').val();
    var Repair_Total_Working_Hours = $('.Total_Working_Hours').val();



    Fn_updfrom(Repair_IDTickets, Repair_ID_User, Repair_FirstName, Repair_LastName, Repair_PhoneNumber, Repair_Department, Repair_Email, Repair_Problem, Repair_ID_Owner, Repair_Comment, Repair_Start_Date, Repair_Completedate, Repair_Total_OT_Hours, Repair_Total_Money, Repair_Total_Working_Hours, Repair_Unit_OT)



});





$(document).delegate('#btn_deletefrmservice', 'click', function (event) {




    var Repair_IDTickets = $('.txtDocID').text();



    Fn_delfrm(Repair_IDTickets)



});
//////////////////////////////////////////

/*sssssssssssssss แก้ไขรายการ ปปปป 12/02/033 
 
 */
//////////////////////////////////////////



function Fn_SignUp(User_ID,FirstName, LastName, Email, Password) {

    var data_post = JSON.stringify({
        'User_ID': User_ID,
        'FirstName': FirstName,
        'LastName': LastName,
        'Email': Email,
        'Password': Password


    });

            //alert(data_post)


    $.ajax({
        type: "POST",
        url: "login.aspx/Sv_SignUp",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            alertline("บันทึกข้อมูลเรียบร้อย")

            if (data.d == "True") {

                window.location.replace("login.aspx");


            }
            else {

                alert("ไม่สามารถบันทึกข้อมูลได้");
            }

        },
        error: function (data) {

           // Fn_InsertLog(data.d)
           //alert('false ' + data.d);
        }
    });


}


function Fn_Resgister_Owner(User_ID, User_Owner_Type, User_Total_Money, FirstName, LastName, Email, Password) {

    var data_post = JSON.stringify({

        'User_ID': User_ID,
        'User_Owner_Type': User_Owner_Type,
        'User_Total_Money': User_Total_Money,
        'FirstName': FirstName,
        'LastName': LastName,
        'Email': Email,
        'Password': Password


    });

    alert("บันทึกข้อมูลผู้ใช้งานใหม่เรียบร้อย")


    $.ajax({
        type: "POST",
        url: "index.aspx/Sv_Resgister_Owner",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            alertline("บันทึกข้อมูลเรียบร้อย")

            if (data.d == "True") {

                window.location.replace("index.aspx");


            }
            else {

                alert("ไม่สามารถบันทึกข้อมูลได้");
            }

        },
        error: function (data) {

            // Fn_InsertLog(data.d)
            alert('false ' + data.d);
        }
    });


}






function Fn_CheckLogin(Username, Password) {

    var data_post = JSON.stringify({
        'Username': Username,
        'Password': Password
    });


    $.ajax({
        type: "POST",
        url: "login.aspx/Sv_CheckLogin",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {



            if (data.d.length > 0) {

                alert(data.d[0].User_Type)

                if (data.d[0].User_Type == "Super_Admin") {
                    window.location.replace("main/index.aspx");

                } else if (data.d[0].User_Type == "Admin") {
                    window.location.replace("main/index.aspx");

                } else if (data.d[0].User_Type == "Technician") {
                    window.location.replace("main/index.aspx");

                } else {
                    window.location.replace("main/index.aspx");
                }

            }
            else {

                alert("ไม่พบรหัสพนักงานนี้ในระบบ");
            }

        },
        error: function (data) {

            Fn_InsertLog(data.d)
            alert('false ' + data.d);
        }
    });


}




function Fn_ByRepairItem(DocID) {

    var data_post = JSON.stringify({
        'Repair_IDTickets': DocID
    });
    //alert(DocID)

    $.ajax({
        type: "POST",
        url: "frm_service.aspx/Sv_ByRepairItem",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            

            if (data.d.length > 0) {

                $('#box2').show();

                $('.txtDocID').text(DocID);

                $('#btn_insertservice').hide();
                $('#btn_updateservice').show();
                $('#btn_deletefrmservice').show();


                $('.txt_ID_User').val(data.d[0].Repair_ID_User); //เพิ่มข้อมูลต่อจากบรรทัดนี้
                $('.txt_FirstName').val(data.d[0].Repair_FirstName);
                $('.txt_LastName').val(data.d[0].Repair_LastName);
                $('.txt_PhoneNumber').val(data.d[0].Repair_PhoneNumber);
                // $('.txt_Department').val(data.d[0].Repair_Department); 
                $('.txt_Email').val(data.d[0].Repair_Email);
                $('.txt_Problem').val(data.d[0].Repair_Problem);
                $('.txt_ID_Owner').val(data.d[0].Repair_ID_Owner);
                $('.txt_Owner_FirstName').val(data.d[0].Repair_Owner_FirstName);
                $('.txt_Owner_LastName').val(data.d[0].Repair_Owner_LastName);

                if (data.d[0].Repair_Date == "") {

                    Repair_Date = "";
                } else {
                    //Repair_Date = data.d[0].Repair_Date.format("YYYY-MM-DD HH:mm")
                    Repair_Date = moment(data.d[0].Repair_Date).format("YYYY-MM-DD HH:mm");
                }


                //alert(data.d[0].Repair_Completedate)
                if (data.d[0].Repair_Completedate == "") {

                    Repair_Completedate = "";
                } else {
                    //Repair_Completedate = data.d[0].Repair_Completedate.format("YYYY-MM-DD HH:mm")
                    Repair_Completedate = moment(data.d[0].Repair_Completedate).format("YYYY-MM-DD HH:mm");
                }


                $('.txt_Date').val(Repair_Date);
                $('.txt_Completedate').val(Repair_Completedate);




                $('.txt_Department option[value="' + data.d[0].Repair_Department + '"]').attr('selected', true);


                $('.txt_Owner_Type option[value="' + data.d[0].Repair_ID_Owner + '"]').attr('selected', true);

                $('.txt_Owner_Type').val($('.Owner_' + data.d[0].Repair_ID_Owner).attr('rid'));



                $('#reservationdatetime').datetimepicker({
                    icons: {
                        time: 'far fa-clock'
                    }, pick12HourFormat: false
                    , format: 'YYYY-MM-DD HH:mm'
                });

                $('#reservationdatetime2').datetimepicker({
                    icons: {
                        time: 'far fa-clock'
                    }
                    , pick12HourFormat: false
                    , format: 'YYYY-MM-DD HH:mm'
                });

                $('.Total_Working_Hours').val(data.d[0].Repair_Total_Working_Hours);



                $('.Total_OT_Hours').val(data.d[0].Repair_Total_OT_Hours);



                $('#txt_Unit_OT').val(data.d[0].Repair_Unit_OT);

                //alert(data.d[0].Repair_Unit_OT);

                $('.txt_OT_OT').text(data.d[0].Repair_Unit_OT);

                $('.txt_Total_Money').val(data.d[0].Repair_Total_Money);

                if ($('#User_Type_sess').val() == "User") {
                    $('.txt_ID_User').prop("disabled", true);
                    $('.txt_FirstName').prop("disabled", true);
                    $('.txt_LastName').prop("disabled", true);
                    $('.txt_PhoneNumber').prop("disabled", true); 
                    $('.txt_Email').prop("disabled", true);
                    $('.txt_Problem').prop("disabled", true);
                    $('.txt_ID_Owner').prop("disabled", true);
                    $('.txt_Owner_FirstName').prop("disabled", true);
                    $('.txt_Owner_LastName').prop("disabled", true);
                    $('.txt_Owner_Type').prop("disabled", true);
                    $('.txt_Date').prop("disabled", true);
                    $('.txt_Completedate').prop("disabled", true);
                    $('.Total_Working_Hours').prop("disabled", true);
                    $('.Working_Hours').prop("disabled", true);
                    $('.Total_OT_Hours').prop("disabled", true);
                    $('.txt_Total_Money').prop("disabled", true);

                } else if ($('#User_Type_sess').val() == "Admin") {
                    $('.txt_ID_User').prop("disabled", false);
                } else {
                    $('.txt_ID_User').prop("disabled", false);
                } 


            }
            else {

                alert("ไม่สามารถแก้ไขข้อมูลได้");
            }

        },
        error: function (data) {

            Fn_InsertLog(data.d)
            alert('false ' + data.d);
        }
    });


}



function Fn_GetDatatable() {

    var data_post = JSON.stringify({
        //   'Username': Username,
        //  'Password': Password
    });


    $.ajax({
        type: "POST",
        url: "index.aspx/Sv_GetDatatable",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {


            var tableReport = $('#MyTableTiket').DataTable({
                'paging': true,

                'searching': true,
                'destroy': true,
                'ordering': false,
                'info': true,
                'bPaginate': false,
                'bLengthChange': false,
                'bDeferRender': false,
                'autoWidth': false,
                'iDisplayLength': 100,

                // "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "excel", "print", "colvis"],

                data: data.d,

                'columnDefs': [{
                    'targets': 0,
                    'searchable': false,
                    'orderable': false,
                    'className': 'dt-body-center'

                }],



                columns: [{
                    data: 'Repair_IDTickets',
                }, {
                    data: 'Repair_Date'
                }, {
                    data: 'Repair_ID_User'
                }, {
                    data: 'Repair_FirstName'
                }, {
                    data: 'Repair_LastName'
                }, {
                    data: 'Repair_PhoneNumber'
                }, {
                    data: 'Repair_Department'
                }, {
                    data: 'Repair_Problem'
                }, {
                    data: 'Repair_ID_Owner'
                }, {
                    data: 'Repair_Start_Date'
                }, {
                    data: 'Repair_Completedate'
                }, {
                    data: 'Repair_Comment'
                }, {
                    data: 'Repair_Statuss'
                }, {
                    data: 'Repair_Email'
                }, {

                    data: 'Repair_Total_OT_Hours',
                    'render': function (data, type, full, meta) {

                        if (data > 0) {
                            return data + "ชม.";
                        } else {
                            return "";

                        }
                    }
                }, {

                    data: 'Repair_Action'
                }





                ]

                //  }).buttons().container().appendTo('#MyTableReport_wrapper .col-md-6:eq(0)');
            });

        },
        error: function (data) {

            Fn_InsertLog(data.d)
            alert('false ' + data.d);
        }
    });


}



function Fn_GetDatatableByUser(UserID) {

    var data_post = JSON.stringify({
        'UserID': UserID

    });
    alert(data_post)

    $.ajax({
        type: "POST",
        url: "index.aspx/Sv_GetDatatableByUser",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {




            var tableReport = $('#MyTableTiket').DataTable({
                'paging': true,

                'searching': true,
                'destroy': true,
                'ordering': false,
                'info': true,
                'bPaginate': false,
                'bLengthChange': false,
                'bDeferRender': false,
                'autoWidth': false,
                'iDisplayLength': 100,

                // "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "excel", "print", "colvis"],

                data: data.d,

                'columnDefs': [{
                    'targets': 0,
                    'searchable': false,
                    'orderable': false,
                    'className': 'dt-body-center'

                }],



                columns: [{
                    data: 'Repair_IDTickets',
                }, {
                    data: 'Repair_Date'
                }, {
                    data: 'Repair_ID_User'
                }, {
                    data: 'Repair_FirstName'
                }, {
                    data: 'Repair_LastName'
                }, {
                    data: 'Repair_PhoneNumber'
                }, {
                    data: 'Repair_Department'
                }, {
                    data: 'Repair_Problem'
                }, {
                    data: 'Repair_ID_Owner'
                }, {
                    data: 'Repair_Start_Date'
                }, {
                    data: 'Repair_Completedate'
                }, {
                    data: 'Repair_Comment'
                }, {
                    data: 'Repair_Statuss'
                }, {
                    data: 'Repair_Email'
                }, {
                    data: 'Repair_Total_OT_Hours',
                    'render': function (data, type, full, meta) {

                        if (data > 0) {
                            return data + "ชม.";
                        } else {
                            return "";

                        }
                    }
                }, {
                    data: 'Repair_Action'
                }

                ]

                //  }).buttons().container().appendTo('#MyTableReport_wrapper .col-md-6:eq(0)');
            });

        },
        error: function (data) {


            alert('false ' + data.d);
        }
    });


}



function Fn_GetDatatableByTechnicain(UserID) {

    var data_post = JSON.stringify({
        'UserID': UserID

    });

    alert(data_post)

    $.ajax({
        type: "POST",
        url: "index.aspx/Sv_GetDatatableByTechnicain",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {


            var tableReport = $('#MyTableTiket').DataTable({
                'paging': true,

                'searching': true,
                'destroy': true,
                'ordering': false,
                'info': true,
                'bPaginate': false,
                'bLengthChange': false,
                'bDeferRender': false,
                'autoWidth': false,
                'iDisplayLength': 100,

                // "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "excel", "print", "colvis"],

                data: data.d,

                'columnDefs': [{
                    'targets': 0,
                    'searchable': false,
                    'orderable': false,
                    'className': 'dt-body-center'

                }],



                columns: [{
                    data: 'Repair_IDTickets',
                }, {
                    data: 'Repair_Date',
                    'render': function (data, type, full, meta) {

                        if (data != "") {
                            return Repair_Date = moment(data).format("YYYY-MM-DD HH:mm");
                        } else {
                            return "";

                        }
                    }
                }, {
                    data: 'Repair_ID_User'
                }, {
                    data: 'Repair_FirstName'
                }, {
                    data: 'Repair_LastName'
                }, {
                    data: 'Repair_PhoneNumber'
                }, {
                    data: 'Repair_Department'
                }, {
                    data: 'Repair_Problem'
                }, {
                    data: 'Repair_ID_Owner'
                }, {
                    data: 'Repair_Start_Date',
                    'render': function (data, type, full, meta) {

                        if (data != "") {
                            return Repair_Date = moment(data).format("YYYY-MM-DD HH:mm");
                        } else {
                            return "";

                        }
                    }
                }, {
                    data: 'Repair_Completedate',
                    'render': function (data, type, full, meta) {

                        if (data != "") {
                            return Repair_Date = moment(data).format("YYYY-MM-DD HH:mm");
                        } else {
                            return "";

                        }
                    }
                }, {
                    data: 'Repair_Comment'
                }, {
                    data: 'Repair_Statuss'
                }, {
                    data: 'Repair_Email'
                }, {
                    data: 'Repair_Total_OT_Hours',
                    'render': function (data, type, full, meta) {

                        if (data > 0) {
                            return data + "ชม.";
                        } else {
                            return "";

                        }
                    }

                }, {
                    data: 'Repair_Action'
                }


                    //},




                ]

                //  }).buttons().container().appendTo('#MyTableReport_wrapper .col-md-6:eq(0)');
            });

        },
        error: function (data) {

            
            alert('false ' + data.d);
        }
    });


}




function Fn_Insertservice(ID_User, FirstName, LastName, PhoneNumber, Department, Email, Problem, Repair_Start_Date) {

    var data_post = JSON.stringify({

        'ID_User': ID_User,
        'FirstName': FirstName,
        'LastName': LastName,
        'PhoneNumber': PhoneNumber,
        'Department': Department,
        'Email': Email,
        'Problem': Problem,
        'Repair_Start_Date': Repair_Start_Date

        


    });

    //alert(data_post)


    $.ajax({
        type: "POST",
        url: "frm_service.aspx/Sv_Insertservice",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            alertline("บันทึกข้อมูลเรียบร้อย")








            if (data.d == "True") {

                window.location.replace("main/index.aspx");


            }
            else {

                alert("ไม่สามารถบันทึกข้อมูลได้");
            }

        },
        error: function (data) {

            Fn_InsertLog(data.d)
            alert('false ' + data.d);
        }
    });


}



function Fn_updfrom(IDTickets, ID_User, FirstName, LastName, PhoneNumber, Department, Email, Problem, Repair_ID_Owner, Repair_Comment, Repair_Start_Date, Completedate, Repair_Total_OT_Hours, Repair_Total_Money, Repair_Total_Working_Hours, Repair_Unit_OT) {


    if (Completedate !== "") {

        Repair_statuss = "C";

    }
    else {
        Repair_statuss = "B";
    }



    var data_post = JSON.stringify({
        'IDTickets': IDTickets,
        'ID_User': ID_User,
        'FirstName': FirstName,
        'LastName': LastName,
        'PhoneNumber': PhoneNumber,
        'Department': Department,
        'Email': Email,
        'Problem': Problem,
        'Repair_ID_Owner': Repair_ID_Owner,
        'Comment': Repair_Comment,
        'Repair_statuss': Repair_statuss,
        'Repair_Start_Date': Repair_Start_Date,
        'Completedate': Completedate,
        'Repair_Total_OT_Hours': Repair_Total_OT_Hours,
        'Repair_Total_Money': Repair_Total_Money,
        'Repair_Unit_OT': Repair_Unit_OT,
        'Repair_Total_Working_Hours': Repair_Total_Working_Hours



    });
    // alert(Completedate)






    $.ajax({
        type: "POST",
        url: "frm_service.aspx/Sv_updfrom2",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            alertline("อัปเดตข้อมูลเรียบร้อย")
            data

            if (data.d.length > 0) {

                alert("บันทึกข้อมูลแก้ไขสำเร็จ")

                parent.window.location.replace("main/index.aspx");


            }
            else {

                alert("บันทึกข้อมูลไม่สำเร็จ");
            }

        },
        error: function (data) {


            alert('false ' + data.d);
        }
    });


} //ฟังก์ชัน Update



function Fn_delfrm(IDTickets) {

    var data_post = JSON.stringify({
        'Repair_IDTickets': IDTickets

    });




    $.ajax({
        type: "POST",
        url: "frm_service.aspx/Sv_deletefrmservice",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            alertline("ลบข้อมูลเรียบร้อย")
            data


            if (data.d.length > 0) {

                parent.window.location.replace("main/index.aspx");

            }
            else {

                alert("ไม่พบรหัสพนักงานนี้ในระบบ");
            }

        },
        error: function (data) {

            Fn_delfrmLog(data.d)
            alert('false ' + data.d);
        }
    });


} //ฟังก์ชัน Delete



function loopOwner() {

    var data_post = JSON.stringify({
        //   'Username': Username,
        //  'Password': Password
    });


    $.ajax({
        type: "POST",
        url: "frm_service.aspx/Sv_loopOwner",
        data: data_post,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            var lists = '<option value="">เลือกช่าง </option>';

            for (var i = 0; i < data.d.length; i++) {

                lists += '<option  class="Owner_' + data.d[i].Repair_ID_Owner + '" rid="' + data.d[i].Repair_Owner_Type + '" pid ="' + data.d[i].Repair_Total_Money + '" value="' + data.d[i].Repair_ID_Owner + '">' + data.d[i].Repair_ID_Owner + ' ' + data.d[i].Repair_Owner_FirstName + ' ' + data.d[i].Repair_Owner_LastName + '</option>';



            }

            $('.loopOwner').html(lists)
        },
        error: function (data) {

            Fn_InsertLog(data.d)
            alert('false ' + data.d);
        }
    });
}


function alertline(TextAlert) {

    token = "Rtk47BqfWc4vAf59zPfVoa1gngHm05B57kqHD0eYRTa";

    // if (SetSelectDIVCODE == "200571") {
    //   token = "R6GADpowqqbnJCKALcV7141ArZ8S2ytzUOqRsU9I8pK";
    //}
    // else if (SetSelectDIVCODE == "200562") {
    // token = "5fZVb7BRnvpv5lw0kvDTtHIx2vD1ZUL80EdrWnbbRXG";
    //}
    var Re = new RegExp("&", "g");
    TextAlert = TextAlert.replace(Re, "-/-");



    if (token != "") {
        var data_post = JSON.stringify({
            'TextAlert': TextAlert,
            'token': token
        });



        $.ajax({
            type: "POST",
            url: "frm_service.aspx/alertline",
            data: data_post,
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

            }

        });

    }

}







