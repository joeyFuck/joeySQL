public partial class ProcedureTest : System.Web.UI.Page
    {
        public static  string conn = ConfigurationManager.ConnectionStrings["StuRelationDBConnectionString"].ConnectionString;
        public SqlConnection con = new SqlConnection(conn);
        protected void Page_Load(object sender, EventArgs e)
        {
            runGetUserAccountRe3();
        }

        //只返回单一记录集的存储过程GetUserAccount
        public void runGetUserAccount()
        {
            SqlDataAdapter dp = new SqlDataAdapter(common("GetUserAccount"));
            DataSet ds = new DataSet();
            // 填充dataset 
            dp.Fill(ds);
            rpt.DataSource = ds;
            rpt.DataBind();

        }

        //没有输入输出的存储过程inUserAccount
        public void runinUserAccount()
        {            
            con.Open();
            Label1.Text = common("inUserAccount").ExecuteNonQuery().ToString();
            con.Close();
        }

        //有返回值的存储过程inUserAccountRe
        public void runinUserAccountRe()
        {
            // 创建参数 
            SqlCommand cmd = common("inUserAccountRe");
            IDataParameter[] parameters = { 
                 new SqlParameter("rval", SqlDbType.Int,4) 
             };
            // 将参数类型设置为 返回值类型 
            parameters[0].Direction = ParameterDirection.ReturnValue;
            // 添加参数 
            cmd.Parameters.Add(parameters[0]);
            con.Open();
            // 执行存储过程并返回影响的行数 
            Label1.Text = cmd.ExecuteNonQuery().ToString();
            con.Close();
            // 显示影响的行数和返回值 
            Label1.Text += "-" + parameters[0].Value.ToString();
        }

        //有输入参数和输出参数的存储过程
        public void runGetUserAccountRe()
        {
            SqlCommand cmd = common("GetUserAccountRe");
            // 创建参数 
            IDataParameter[] parameters = { 
                 new SqlParameter("@UserName", SqlDbType.NChar,20) , 
                 new SqlParameter("@UserID", SqlDbType.Int) ,
             };
            // 设置参数类型 
            parameters[0].Value = "7";  
            parameters[1].Direction = ParameterDirection.Output;  // 设置为输出参数 
            // 添加参数 
            cmd.Parameters.Add(parameters[0]);
            cmd.Parameters.Add(parameters[1]);
            con.Open();
            // 执行存储过程并返回影响的行数 
            Label1.Text = cmd.ExecuteNonQuery().ToString();
            con.Close();           
            // 显示影响的行数和输出参数 
            Label1.Text += "-" + parameters[1].Value.ToString();
           
        }

        //同时具有返回值、输入参数、输出参数的存储过程GetUserAccountRe1
        public void runGetUserAccountRe1()
        {
            SqlCommand cmd = common("GetUserAccountRe1");
            // 创建参数 
            IDataParameter[] parameters = { 
                 new SqlParameter("@UserName", SqlDbType.NChar,20) , 
                 new SqlParameter("@UserID", SqlDbType.Int) ,
                 new SqlParameter("rval", SqlDbType.Int,4) 
             };
            // 设置参数类型 
            parameters[0].Value = "7";
            parameters[1].Direction = ParameterDirection.Output;  // 设置为输出参数 
            parameters[2].Direction = ParameterDirection.ReturnValue;  //设置为返回值
            // 添加参数 
            cmd.Parameters.Add(parameters[0]);
            cmd.Parameters.Add(parameters[1]);
            cmd.Parameters.Add(parameters[2]);
            con.Open();
            // 执行存储过程并返回影响的行数 
            Label1.Text = cmd.ExecuteNonQuery().ToString();
            con.Close();
            // 显示影响的行数和输出参数 
            Label1.Text += "-输出参数为：" + parameters[1].Value.ToString();
            Label1.Text += "-返回值为：" + parameters[2].Value.ToString();

        }

        //同时返回参数和记录集的存储过程GetUserAccountRe2
        public void runGetUserAccountRe2()
        {
            SqlCommand cmd = common("GetUserAccountRe2");
            // 创建参数 
            IDataParameter[] parameters = { 
                 new SqlParameter("@UserName", SqlDbType.NChar,20) , 
                 new SqlParameter("@UserID", SqlDbType.Int) ,
                 new SqlParameter("rval", SqlDbType.Int,4) 
             };
            // 设置参数类型 
            parameters[0].Value = "7";
            parameters[1].Direction = ParameterDirection.Output;  // 设置为输出参数 
            parameters[2].Direction = ParameterDirection.ReturnValue;  //设置为返回值
            // 添加参数 
            cmd.Parameters.Add(parameters[0]);
            cmd.Parameters.Add(parameters[1]);
            cmd.Parameters.Add(parameters[2]);
            con.Open();
            // 执行存储过程并返回影响的行数 
            Label1.Text = cmd.ExecuteNonQuery().ToString();
            DataSet ds = new DataSet();
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            dt.Fill(ds);
            rpt.DataSource = ds;
            rpt.DataBind();
            con.Close();
            // 显示影响的行数和输出参数 
            Label1.Text += "-输出参数为：" + parameters[1].Value.ToString();
            Label1.Text += "-返回值为：" + parameters[2].Value.ToString();

        }

        //返回多个记录集的存储过程
        public void runGetUserAccountRe3()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter dt = new SqlDataAdapter(common("GetUserAccountRe3"));
            dt.Fill(ds);
            rpt1.DataSource = ds.Tables[0].DefaultView;
            rpt1.DataBind();
            rpt2.DataSource = ds.Tables[1].DefaultView;
            rpt2.DataBind();
        }
        
        public SqlCommand common(string proName)
        {
            
            SqlCommand cmd = new SqlCommand();
            // 设置sql连接 
            cmd.Connection = con;            
            // 如果执行语句 
            cmd.CommandText = proName;
            // 指定执行语句为存储过程 
            cmd.CommandType = CommandType.StoredProcedure;
            return cmd;
        }
    }