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
using System.Net;
using System.Text;

public partial class frm_service : System.Web.UI.Page
{

    private static string getMaxIDX()
    {

        string MaxIDX;

        MaxIDX = svDBAccessLayer.ExecuteScalar(svDBConnection.getDB1(), CommandType.Text, "select dbo.[fnGenReqID]() as FRID").ToString();
        return MaxIDX;

    }

    [WebMethod]
    public static string Sv_Insertservice(string ID_User, string FirstName, string LastName, string PhoneNumber, string Department, string Email, string Problem,string Repair_Start_Date)
    {
        SqlTransaction Trans;
        SqlConnection Conn;
        Conn = svDBConnection.getDB1();

        Trans = Conn.BeginTransaction();
        try
        {

            string MAXID = getMaxIDX();

            SqlParameter[] ParamsIns =
                    {



                   new SqlParameter("@Repair_IDTickets", MAXID),
                   new SqlParameter("@Repair_ID_User", ID_User),
                   new SqlParameter("@Repair_FirstName", FirstName),
                   new SqlParameter("@Repair_LastName", LastName),
                   new SqlParameter("@Repair_PhoneNumber", PhoneNumber),
                   new SqlParameter("@Repair_Department", Department),
                   new SqlParameter("@Repair_Problem", Problem),
                   new SqlParameter("@Repair_Email", Email),
                   new SqlParameter("@Repair_Start_Date", Repair_Start_Date)






                };
            svDBAccessLayer.ExecuteNonQuery(Trans, CommandType.StoredProcedure, "spSys_frm_Insdevice", ParamsIns);

            Trans.Commit();
            return "True";
        }
        catch (Exception ex)
        {
            Trans.Rollback();
            return "False";
        }
    }



    [WebMethod] //สร้าง  function Update
      public static string Sv_updfrom2(string IDTickets, string ID_User, string FirstName, string LastName, string PhoneNumber, string Department, string Problem, string Email, string Repair_ID_Owner, string Comment, string Repair_Start_Date, string Completedate, string Repair_statuss, string Repair_Total_OT_Hours, string Repair_Total_Money,string Repair_Total_Working_Hours, string Repair_Unit_OT)
    {          
          SqlTransaction Trans;
          SqlConnection Conn;
          Conn = svDBConnection.getDB1();

          Trans = Conn.BeginTransaction();
          try
          {

              SqlParameter[] ParamsIns =
                      {
                     new SqlParameter("@Repair_IDTickets", IDTickets),
                     new SqlParameter("@Repair_ID_User", ID_User),
                     new SqlParameter("@Repair_FirstName", FirstName),
                     new SqlParameter("@Repair_LastName", LastName),
                     new SqlParameter("@Repair_PhoneNumber", PhoneNumber),
                     new SqlParameter("@Repair_Department", Department),
                     new SqlParameter("@Repair_Problem", Problem),
                     new SqlParameter("@Repair_Email", Email),
                     
                     new SqlParameter("@Repair_ID_Owner", Repair_ID_Owner),
                     new SqlParameter("@Repair_Comment", Comment),

                     new SqlParameter("@Repair_Start_Date", Repair_Start_Date),

                     new SqlParameter("@Repair_Completedate", Completedate),
                     new SqlParameter("@Repair_statuss", Repair_statuss),
                     new SqlParameter("@Repair_Total_OT_Hours", Repair_Total_OT_Hours),
                                        
                     new SqlParameter("@Repair_Total_Money", Repair_Total_Money),
                     new SqlParameter("@Repair_Unit_OT" , Repair_Unit_OT),
                     new SqlParameter("@Repair_Total_Working_Hours", Repair_Total_Working_Hours)

                  };
              svDBAccessLayer.ExecuteNonQuery(Trans, CommandType.StoredProcedure, "spSys_updfrom", ParamsIns);

              Trans.Commit();
              return "True";
          }
          catch (Exception ex)
          {
              Trans.Rollback();
              return "False";
          }
      }




    [WebMethod]
    public static string Sv_deletefrmservice(string Repair_IDTickets)
    {
        SqlTransaction Trans;
        SqlConnection Conn;
        Conn = svDBConnection.getDB1();

        Trans = Conn.BeginTransaction();
        try
        {

            string MAXID = getMaxIDX();

            SqlParameter[] ParamsIns =
                    {

                   new SqlParameter("@Repair_IDTickets", Repair_IDTickets),

                };
            svDBAccessLayer.ExecuteNonQuery(Trans, CommandType.StoredProcedure, "spSys_delfrm", ParamsIns);

            Trans.Commit();
            return "True";
        }
        catch (Exception ex)
        {
            Trans.Rollback();
            return "False";
        }
    }




    [WebMethod]
    public static listservice[] Sv_ByRepairItem(string Repair_IDTickets)
    {
        

        List<listservice> details = new List<listservice>();

        SqlParameter[] Params =
                 {
                   new SqlParameter("@Repair_IDTickets", Repair_IDTickets)


                 };

        DataTable dt;
        dt = svDBAccessLayer.ExecuteDataset(svDBConnection.getDB1(), CommandType.StoredProcedure, "spSys_ByRepairItem", Params).Tables[0];

        foreach (DataRow dtrow in dt.Rows)
        {
            listservice list = new listservice();

            list.Repair_ID_User= dtrow["Repair_ID_User"].ToString();  //มาจากชื่อ trn_User
            list.Repair_FirstName = dtrow["Repair_FirstName"].ToString(); //มาจากชื่อ trn_User
            list.Repair_LastName = dtrow["Repair_LastName"].ToString(); //มาจากชื่อ trn_User
            list.Repair_PhoneNumber = dtrow["Repair_PhoneNumber"].ToString(); //มาจากชื่อ trn_User

            list.Repair_Department = dtrow["Repair_Department"].ToString(); //มาจากชื่อ trn_User
            list.Repair_Email = dtrow["Repair_Email"].ToString(); //มาจากชื่อ trn_User


            list.Repair_Problem = dtrow["Repair_Problem"].ToString(); //มาจากชื่อ trn_User
            list.Repair_ID_Owner = dtrow["Repair_ID_Owner"].ToString(); //มาจากชื่อ trn_User
            
            list.Repair_Date = dtrow["Repair_Start_Date"].ToString(); //มาจากชื่อ trn_User
            list.Repair_Completedate = dtrow["Repair_Completedate"].ToString(); //มาจากชื่อ trn_User

            list.Repair_Total_Working_Hours = dtrow["Repair_Total_Working_Hours"].ToString(); //มาจากชื่อ trn_User
            list.Repair_Total_OT_Hours = dtrow["Repair_Total_OT_Hours"].ToString(); //มาจากชื่อ trn_User
            list.Repair_Total_Money = dtrow["Repair_Total_Money"].ToString(); //มาจากชื่อ trn_User
            list.Repair_Unit_OT = dtrow["Repair_Unit_OT"].ToString(); //มาจากชื่อ trn_User



            details.Add(list);
        }




        return details.ToArray();



    }


    [WebMethod]
    public static listservice[] Sv_loopOwner()
    {


        List<listservice> details = new List<listservice>();

        SqlParameter[] Params =
                 {
                //   new SqlParameter("@Repair_IDTickets", Repair_IDTickets)


                 };

        DataTable dt;
        dt = svDBAccessLayer.ExecuteDataset(svDBConnection.getDB1(), CommandType.StoredProcedure, "spSys_loopOwner", Params).Tables[0];

        foreach (DataRow dtrow in dt.Rows)
        {
            listservice list = new listservice();

            list.Repair_ID_Owner = dtrow["ID_Owner"].ToString();  //
            list.Repair_Owner_FirstName = dtrow["Owner_FirstName"].ToString(); //
            list.Repair_Owner_LastName = dtrow["Owner_LastName"].ToString(); //
            list.Repair_Owner_Type = dtrow["Owner_Type"].ToString();  //
            list.Repair_Total_Money = dtrow["Total_Money"].ToString();






            details.Add(list);
        }




        return details.ToArray();



    }



    [WebMethod]
    public static string alertline(string TextAlert, string token)
    {



        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

        try
        {
            var request = (HttpWebRequest)WebRequest.Create("https://notify-api.line.me/api/notify");
            var postData = string.Format("message={0}", TextAlert);
            var data = Encoding.UTF8.GetBytes(postData);

            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = data.Length;
            request.Headers.Add("Authorization", "Bearer " + token);


            using (var stream = request.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }

            var response = (HttpWebResponse)request.GetResponse();
            var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();




            return "true";
        }
        catch (Exception ex)
        {

            return ex.Message;



        }

    }

    public class listservice


    {
        public string Repair_IDTickets { get; set; }
        public string Repair_ID_User { get; set; }
        public string Repair_FirstName { get; set; }
        public string Repair_LastName { get; set; }

        public string Repair_PhoneNumber { get; set; }
        public string Repair_Department { get; set; }

        public string Repair_Email { get; set; }
        public string Repair_Problem { get; set; }
        public string Repair_ID_Owner { get; set; }
        public string Repair_Owner_FirstName { get; set; }
        public string Repair_Owner_LastName { get; set; }
        public string Repair_Date { get; set; }
        public string Repair_Completedate { get; set; }

        public string Repair_statuss { get; set; }
        public string Repair_Owner_Type { get; set;}
        public string Repair_Total_Money { get; set; }

        public string Repair_Unit_OT { get; set; }

        public string Repair_Working_Hours { get; set; }
        public string Repair_Total_Working_Hours { get; set; }

        public string Repair_Total_OT_Hours { get; set; }
        




        // public string Repair_Comment { get; set; }





    }
    /*
    private static string getMaxIDX()
    {

        string MaxIDX;

        MaxIDX = svDBAccessLayer.ExecuteScalar(svDBConnection.getDB1(), CommandType.Text, "select dbo.[fnGenFineReqID]() as FRID").ToString();
        return MaxIDX;

    }
    */


}