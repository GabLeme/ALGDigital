using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace Testeajax
{
    public partial class Temperatura : System.Web.UI.Page
    {
        [WebMethod]
        public static string TemperaturaAtual()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:projeto321.database.windows.net,1433;Initial Catalog=dbprojeto;Persist Security Info=False;User ID=projeto321;Password=Faculdadebandtec2018;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 data_hora, valor FROM leitura ORDER BY id_leitura DESC", conn))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return dr.GetDateTime(0).ToString("HH:mm:ss") + "@" + dr.GetDouble(1).ToString(System.Globalization.CultureInfo.InvariantCulture);
                        }
                        else
                        {
                            return "";
                        }
                    }

                }

            }
        }
    }
}