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
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            MedicoNegocio medicoNegocio = new MedicoNegocio();

            Usuario usuario = new Usuario();

            try
            {
                usuario.Dni = txtDni.Text;
                usuario.Pass = txtPass.Text;

                Usuario logueado = usuarioNegocio.iniciarSesion(usuario);

                if (logueado != null && logueado.Activo)
                {
                    Session.Add("usuario", logueado); // Guarda el objeto Usuario genérico.
                    // Lógica para médicos: buscar el ID del médico y guardarlo en la sesión.
                    if (logueado.TipoUsuario == "Medico")
                    {
                        //Buscamos al médico por DNI.
                        Medico medico = medicoNegocio.listarMedicos().FirstOrDefault(m => m.Dni == logueado.Dni);
                        // Si se encuentra el médico, guarda su ID en una variable de sesión.
                        if (medico != null)
                        {
                            Session.Add("medicoId", medico.Id);
                        }
                    }

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