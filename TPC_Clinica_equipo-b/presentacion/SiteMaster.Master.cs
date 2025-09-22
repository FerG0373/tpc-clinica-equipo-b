using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace presentacion
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario logueado = (Usuario)Session["usuario"];

                // Mostrar elementos de usuario logueado.
                liUsuario.Visible = true;
                liOpciones.Visible = true;
                btnIniciarSesion.Visible = false;
                lblUsuario.Text = $"🙎 Usuario: {logueado.Dni}";
            }
            else
            {
                // Ocultar elementos de usuario logueado.
                liUsuario.Visible = false;
                liOpciones.Visible = false;
                btnIniciarSesion.Visible = true;
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsuarioLogin.aspx", false);
        }

        protected void lkbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon(); // Esto finaliza la sesión actual.
            Response.Redirect("UsuarioLogin.aspx", false);
        }
    }
}