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
using System;
using System.Net;
using System.Net.Mail;

public partial class loadLoginPage : System.Web.UI.Page { 
   
    [WebMethod]
    public static string Sv_SignUp(string User_ID,string FirstName, string LastName, string Email, string Password)
    {
        SqlTransaction Trans;
        SqlConnection Conn;
        Conn = svDBConnection.getDB1();

        Trans = Conn.BeginTransaction();
        try
        {

            SqlParameter[] ParamsIns =
                    {
                       new SqlParameter("User_ID" ,User_ID),
                       new SqlParameter("@User_FirstName", FirstName),
                       new SqlParameter("@User_LastName" , LastName),
                       new SqlParameter("@User_Email", Email),
                       new SqlParameter("@User_Password", Password)
                    };
            svDBAccessLayer.ExecuteNonQuery(Trans, CommandType.StoredProcedure, "spSys_SignUp", ParamsIns);

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







public partial class loadLoginPage : System.Web.UI.Page
    {
[WebMethod]
   public static listLogin[] Sv_CheckLogin(string Username, string Password)
   {


        List<listLogin> details = new List<listLogin>();

        SqlParameter[] Params =
				 {    
				   new SqlParameter("@Username", Username),
				   new SqlParameter("@Password", Password)

                 };

		DataTable dt;
		dt = svDBAccessLayer.ExecuteDataset(svDBConnection.getDB1(), CommandType.StoredProcedure, "spSys_CheckLogin", Params).Tables[0];

		 foreach (DataRow dtrow in dt.Rows)
		 {
			 listLogin list = new listLogin();

			 list.User_Name = dtrow["User_FirstName"].ToString();   //มาจากชื่อ trn_User
			 list.User_LastName = dtrow["User_LastName"].ToString();
			 list.User_Name = dtrow["User_FirstName"].ToString();
             list.User_Department = dtrow["User_Department"].ToString();
			 list.User_Email = dtrow["User_Email"].ToString();
             list.User_Type = dtrow["User_Type"].ToString();
             list.User_PhoneNumber = dtrow["User_PhoneNumber"].ToString();




            //  HttpContext.Current.Response.Cookies["auth"].Expires = DateTime.Now.AddHours(8);

            HttpContext.Current.Session["User_FirstName"] = dtrow["User_FirstName"].ToString();
            HttpContext.Current.Session["User_LastName"] = dtrow["User_LastName"].ToString();
            HttpContext.Current.Session["User_Department"] = dtrow["User_Department"].ToString();
            HttpContext.Current.Session["User_Email"] = dtrow["User_Email"].ToString();
            HttpContext.Current.Session["User_ID"] = dtrow["User_ID"].ToString();
			 HttpContext.Current.Session["User_Type"] = dtrow["User_Type"].ToString();
            HttpContext.Current.Session["User_PhoneNumber"] = dtrow["User_PhoneNumber"].ToString();




            details.Add(list);
		 }




		return details.ToArray();



    }
		









	
		public class listLogin
		{
			public string User_Name { get; set; }
			public string User_ID { get; set; }
			public string User_Type { get; set; }
		
		public string User_FirstName { get; set; }
		public string User_LastName { get; set; }
		public string User_Department { get; set; }

		public string User_Email { get; set; }
		public string User_PhoneNumber { get; set; }


	

	}


   		protected void Page_Load(object sender, EventArgs e)
        {

        }
			
 }


