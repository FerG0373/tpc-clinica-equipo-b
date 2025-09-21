using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace presentacion
{
    public partial class UsuarioLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuario = new Usuario();
            try
            {
                usuario.Dni = txtDni.Text;
                usuario.Pass = txtPass.Text;

                Usuario logueado = negocio.iniciarSesion(usuario);

                // Verificar el resultado.
                if (logueado != null && logueado.Activo)
                {
                    Session.Add("usuario", logueado);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    lblError.Text = "❌ Usuario o Contraseña incorrectos";
                    lblError.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }
    }
}