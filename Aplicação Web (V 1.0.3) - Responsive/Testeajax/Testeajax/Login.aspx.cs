using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Testeajax
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Logado"] = null;
            }
            txtEmail.Focus();

        }

        private void AutenticaUsuario()
        {
            using (SqlConnection conexao = new SqlConnection("Server=tcp:projeto321.database.windows.net,1433;Initial Catalog=dbprojeto;Persist Security Info=False;User ID=projeto321;Password=Faculdadebandtec2018;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();
                // Cria um comando para inserir um novo registro à tabela
                SqlCommand comando = new SqlCommand($"select senha from tbl_usuario where email= '{txtEmail.Text}' and senha ='{txtSenha.Text}'", conexao);
                SqlDataReader leitor = comando.ExecuteReader();
                if (leitor.Read())
                {
                    Session.Add("Logado", txtEmail.Text);
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    erro.Text = "Email ou senha inválidos";
                }
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            AutenticaUsuario();
        }
    }
}