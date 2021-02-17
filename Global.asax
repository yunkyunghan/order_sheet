<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // [1] 사이트 통계 1/3
        Application["CurrentVisit"] = 0; // 현재 사용자

    }
    
    void Application_End(object sender, EventArgs e) 
    {  
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // [2] 사이트 통계 2/3
        Application.Lock();
        Application["CurrentVisit"] =
              (int)Application["CurrentVisit"] + 1; // 현재 사용자
        Application.UnLock();

        SqlConnection objCon =
            new SqlConnection(ConfigurationManager.ConnectionStrings["ISDB"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("UP_AddCounter", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
    }

    void Session_End(object sender, EventArgs e) 
    {
        // [3] 사이트 통계 3/3
        Application.Lock();
        Application["CurrentVisit"] = (int)Application["CurrentVisit"] - 1; // 현재 사용자
        Application.UnLock();   

    }
       
</script>
