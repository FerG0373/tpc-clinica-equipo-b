using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class VerDetallePaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("UsuarioLogin.aspx", false);
            }
            else
            {
                Usuario logueado = (Usuario)Session["usuario"];  // Obtener el objeto del usuario y verificar su perfil.
                if (logueado.TipoUsuario != "Administrador" && logueado.TipoUsuario != "Recepcionista")
                {
                    Response.Redirect("Default.aspx", false);
                }
            }

            if (!IsPostBack)
            {
                string dni = Request.QueryString["dni"];
                if (!string.IsNullOrEmpty(dni))
                {
                    CargarPaciente(dni);
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaPaciente.aspx", false);
            //HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        private void CargarPaciente(string dni)
        {
            PacienteNegocio negocio = new PacienteNegocio();
            Paciente paciente = negocio.buscarPorDni(dni);
            if (paciente != null)
            {
                txtDni.Text = paciente.Dni;
                txtNombre.Text = paciente.Nombre;
                txtApellido.Text = paciente.Apellido;
                txtFechaNacimiento.Text = paciente.FechaNacimiento?.ToString("yyyy-MM-dd");
                ddlSexo.Text = paciente.Sexo;
                txtTelefono.Text = paciente.Telefono;
                txtEmail.Text = paciente.Email;
                txtTipoCobertura.Text = paciente.TipoCobertura;
                txtHistorialClinico.Text = paciente.HistorialClinico;
                chkActivo.Checked = paciente.Activo;
            }
            else
            {
                // Manejo si no se encuentra el paciente
                lblError.Text = "Paciente no encontrado.";
                lblError.Visible = true;
            }
        }
    }
}