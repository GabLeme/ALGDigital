using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Testeajax.Models;
using Testeajax.Utils;

namespace Testeajax
{
    public partial class Buscadata : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Logado"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                lblEmail.Text = "Seja bem vindo, " + Session["Logado"] + " !";
            }

        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnBuscartemp_Click(object sender, ImageClickEventArgs e)
        {
            List<RepeaterTemperatura> Temperaturas = new List<RepeaterTemperatura>();

            using (SqlConnection conn = Sql.OpenConnection())
            {

                using (SqlCommand cmd = new SqlCommand($"SELECT data_hora, valor FROM leitura WHERE data_hora BETWEEN '{dataBuscar.Text}T00:00:00' AND '{dataBuscar.Text}T23:59:59'", conn))
                {
                    
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read() == true)
                        {
                            RepeaterTemperatura t = new RepeaterTemperatura();
                            t.datahora = reader.GetDateTime(0);
                            t.valor = reader.GetDouble(1);
                            Temperaturas.Add(t);
                        }
                    }
                }
            }
            listRepeater.DataSource = Temperaturas;
            listRepeater.DataBind();
        }
    }
}