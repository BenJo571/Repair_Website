using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using System.IO;
using SeaconClass;
using System.Xml.Linq;
    public partial class loadindexPage : System.Web.UI.Page
    {
[WebMethod]
   public static ListDatatable[] Sv_GetDatatable() {
		  List<ListDatatable> details = new List<ListDatatable>();
        string RepairStatuss = "";
        SqlParameter[] Params =
				 {    
				 // new SqlParameter("@Username", Username),
				  // new SqlParameter("@Password", Password)
				 };
		DataTable dt;
		dt = svDBAccessLayer.ExecuteDataset(svDBConnection.getDB1(), CommandType.StoredProcedure, "spSys_GetDatatable", Params).Tables[0];
		 foreach (DataRow dtrow in dt.Rows)
		 {
            ListDatatable list = new ListDatatable();
            if (dtrow["Repair_Statuss"].ToString() == "A")
            {
                RepairStatuss = "งานใหม่";
            }
            else if (dtrow["Repair_Statuss"].ToString() == "B")
            {
                RepairStatuss = "กำลังดำเนินการ";
            }
            else if (dtrow["Repair_Statuss"].ToString() == "C")
            {
                RepairStatuss = "งานสำเร็จ";
            }
            else
            {
                RepairStatuss = "";
            }

             list.Repair_IDTickets = dtrow["Repair_IDTickets"].ToString();   //มาจากชื่อ trn_User
             list.Repair_Date= dtrow["Repair_Date"].ToString();
             list.Repair_ID_User = dtrow["Repair_ID_User"].ToString();

            list.Repair_FirstName = dtrow["Repair_FirstName"].ToString();   //มาจากชื่อ trn_User
            list.Repair_LastName = dtrow["Repair_LastName"].ToString();
            list.Repair_PhoneNumber = dtrow["Repair_PhoneNumber"].ToString();

            list.Repair_Department = dtrow["Repair_Department"].ToString();   //มาจากชื่อ trn_User
            list.Repair_Problem = dtrow["Repair_Problem"].ToString();
            list.Repair_ID_Owner = dtrow["Repair_ID_Owner"].ToString();

            list.Repair_Start_Date = dtrow["Repair_Start_Date"].ToString();
            list.Repair_Completedate = dtrow["Repair_Completedate"].ToString();   //มาจากชื่อ trn_User
            list.Repair_Comment = dtrow["Repair_Comment"].ToString();
            list.Repair_Statuss = RepairStatuss;
            list.Repair_Email = dtrow["Repair_Email"].ToString();
            list.Repair_Total_OT_Hours = dtrow["Repair_Total_OT_Hours"].ToString();
            list.Repair_Total_Money = dtrow["Repair_Total_Money"].ToString();

            list.Repair_Action = "<button tid='"+ dtrow ["Repair_IDTickets"].ToString() + "' data-toggle='modal' data-target='#openEdit_customerrequest' class='btn btn-danger  btnEdit_customerrequest' type='button'>Edit</button>";


            list.Repair_OT_Time = "";


            details.Add(list);
		 }
         

         



		return details.ToArray();



    }






    [WebMethod]
    public static ListDatatable[] Sv_GetDatatableByUser(string UserID)
    {

        List<ListDatatable> details = new List<ListDatatable>();

        string RepairStatuss = "";


        SqlParameter[] Params =
                 {    
				  new SqlParameter("@UserID", UserID)
				 
				  
				 };

        DataTable dt;
        dt = svDBAccessLayer.ExecuteDataset(svDBConnection.getDB1(), CommandType.StoredProcedure, "spSys_GetDatatableByUser", Params).Tables[0];

        foreach (DataRow dtrow in dt.Rows)
        {
            ListDatatable list = new ListDatatable();

          //  string RepairStatuss = "";

            if (dtrow["Repair_Statuss"].ToString() == "A") {
                RepairStatuss = "งานใหม่";
            }
            else if (dtrow["Repair_Statuss"].ToString() == "B") {
                RepairStatuss = "กำลังดำเนินการ";
            }
            else if(dtrow["Repair_Statuss"].ToString() == "C"){
                    RepairStatuss = "งานสำเร็จ";

            }
            else
            {
                RepairStatuss = "";
            }  
            


            
            list.Repair_IDTickets = dtrow["Repair_IDTickets"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_Date = dtrow["Repair_Date"].ToString();
            list.Repair_ID_User = dtrow["Repair_ID_User"].ToString();

            list.Repair_FirstName = dtrow["Repair_FirstName"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_LastName = dtrow["Repair_LastName"].ToString();
            list.Repair_PhoneNumber = dtrow["Repair_PhoneNumber"].ToString();

            list.Repair_Department = dtrow["Repair_Department"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_Problem = dtrow["Repair_Problem"].ToString();
            list.Repair_ID_Owner = dtrow["Repair_ID_Owner"].ToString();


            list.Repair_Start_Date = dtrow["Repair_Start_Date"].ToString();
            list.Repair_Completedate = dtrow["Repair_Completedate"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_Comment = dtrow["Repair_Comment"].ToString();
            list.Repair_Statuss = RepairStatuss;
            list.Repair_Email = dtrow["Repair_Email"].ToString();

            list.Repair_Total_OT_Hours = dtrow["Repair_Total_OT_Hours"].ToString();

            list.Repair_Action = "<button tid='" + dtrow["Repair_IDTickets"].ToString() + "' data-toggle='modal' data-target='#openEdit_customerrequest' class='btn btn-danger  btnEdit_customerrequest' type='button' >Edit</button>";

            //list.Repair_OT_Time = "";

            details.Add(list);
        }




        return details.ToArray();



    }




    [WebMethod]
    public static ListDatatable[] Sv_GetDatatableByTechnicain(string UserID)
    {

        List<ListDatatable> details = new List<ListDatatable>();

        string RepairStatuss = "";


        SqlParameter[] Params =
                 {
                  new SqlParameter("@UserID", UserID)
                 };

        DataTable dt;
        dt = svDBAccessLayer.ExecuteDataset(svDBConnection.getDB1(), CommandType.StoredProcedure, "spSys_GetDatatableByTechnicain", Params).Tables[0];

        foreach (DataRow dtrow in dt.Rows)
        {
            ListDatatable list = new ListDatatable();

            //  string RepairStatuss = "";

            if (dtrow["Repair_Statuss"].ToString() == "A")
            {
                RepairStatuss = "งานใหม่";
            }
            else if (dtrow["Repair_Statuss"].ToString() == "B")
            {
                RepairStatuss = "กำลังดำเนินการ";
            }
            else if (dtrow["Repair_Statuss"].ToString() == "C")
            {
                RepairStatuss = "งานสำเร็จ";

            }
            else
            {
                RepairStatuss = "";
            }




            list.Repair_IDTickets = dtrow["Repair_IDTickets"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_Date = dtrow["Repair_Date"].ToString();
            list.Repair_ID_User = dtrow["Repair_ID_User"].ToString();

            list.Repair_FirstName = dtrow["Repair_FirstName"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_LastName = dtrow["Repair_LastName"].ToString();
            list.Repair_PhoneNumber = dtrow["Repair_PhoneNumber"].ToString();

            list.Repair_Department = dtrow["Repair_Department"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_Problem = dtrow["Repair_Problem"].ToString();
            list.Repair_ID_Owner = dtrow["Repair_ID_Owner"].ToString();


            
            list.Repair_Start_Date = dtrow["Repair_Start_Date"].ToString(); 
            list.Repair_Completedate = dtrow["Repair_Completedate"].ToString();   //มาจากชื่อ trn_Repair
            list.Repair_Comment = dtrow["Repair_Comment"].ToString();
            list.Repair_Statuss = RepairStatuss;
            list.Repair_Email = dtrow["Repair_Email"].ToString();
            list.Repair_Total_OT_Hours = dtrow["Repair_Total_OT_Hours"].ToString();
            list.Repair_Total_Money = dtrow["Repair_Total_Money"].ToString();


            list.Repair_OT_Time = dtrow["Repair_Start_Date"].ToString() + '_' + dtrow["Repair_Completedate"].ToString();

            list.Repair_Action = "<button tid='" + dtrow["Repair_IDTickets"].ToString() + "' data-toggle='modal' data-target='#openEdit_customerrequest' class='btn btn-danger btnEdit_customerrequest 'type='button'>Edit</button>";



            details.Add(list);
        }




        return details.ToArray();



    }









    public class ListDatatable
		 {
			public string Repair_IDTickets { get; set; }
			public string Repair_Date { get; set; }
			public string Repair_ID_User { get; set; }

			public string Repair_FirstName { get; set; }
			public string Repair_LastName  { get; set; }
			public string Repair_PhoneNumber { get; set; }

			public string Repair_Department { get; set; }
			public string Repair_Problem { get; set; }
			public string Repair_ID_Owner { get; set; }
			public string Repair_Completedate { get; set; }
            public string Repair_Start_Date { get; set; }

            public string Repair_Comment { get; set; }
			public string Repair_Statuss { get; set; }
			public string Repair_Email { get; set; }

		    public string Repair_Action { get; set; }
            public string Repair_OT_Time { get; set; }

            public string Repair_Total_OT_Hours { get; set; }
            public string Repair_Total_Money { get; set; }
    }


   		protected void Page_Load(object sender, EventArgs e)
        {

        }
			
 }


    public partial class loadindexPage : System.Web.UI.Page
{

    [WebMethod]
    public static string Sv_Resgister_Owner(string User_ID, string User_Owner_Type,string User_Total_Money, string FirstName, string LastName, string Email, string Password)
    {
        SqlTransaction Trans;
        SqlConnection Conn;
        Conn = svDBConnection.getDB1();

        Trans = Conn.BeginTransaction();
        try
        {

            SqlParameter[] ParamsIns =
                    {
                       new SqlParameter("@User_ID" ,User_ID),
                       new SqlParameter("@User_Owner_Type" ,User_Owner_Type),
                       new SqlParameter("@User_Total_Money" , User_Total_Money),
                       new SqlParameter("@User_FirstName", FirstName),
                       new SqlParameter("@User_LastName" , LastName),
                       new SqlParameter("@User_Email", Email),
                       new SqlParameter("@User_Password", Password)
                    };
            svDBAccessLayer.ExecuteNonQuery(Trans, CommandType.StoredProcedure, "spSys_Resgister_Owner", ParamsIns);

            Trans.Commit();
            return "True";
        }
        catch (Exception ex)
        {
            Trans.Rollback();
            return "False";
        }
    }

}


