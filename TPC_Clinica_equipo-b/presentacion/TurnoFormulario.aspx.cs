using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarEspecialidades();
                ddlMedico.Items.Insert(0, new ListItem("Seleccione un médico", "0"));
                ddlTurnoDisponible.Items.Insert(0, new ListItem("Seleccione horario disponible", "0"));
                btnRegistrarPaciente.Visible = false;
            }
        }

        private void cargarEspecialidades()
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            var lista = negocio.listarEspecialidades(); 
            ddlEspecialidad.DataSource = lista;
            ddlEspecialidad.DataValueField = "Id"; 
            ddlEspecialidad.DataTextField = "Descripcion";  
            ddlEspecialidad.DataBind();

            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int especialidadId = int.Parse(ddlEspecialidad.SelectedValue);
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            ddlMedico.DataSource = negocio.listarMedicosPorEspecialidad(especialidadId);
            ddlMedico.DataValueField = "Id";
            ddlMedico.DataTextField = "Nombre";
            ddlMedico.DataBind();
            ddlMedico.Items.Insert(0, new ListItem("Seleccione un médico", "0"));
        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtDni_TextChanged(object sender, EventArgs e)
        {
            string dni = txtDni.Text.Trim();
            PacienteNegocio negocio = new PacienteNegocio();
            Paciente paciente = negocio.buscarPorDni(dni);

            if (paciente != null)
            {
                txtNombre.Text = paciente.Nombre;
                txtApellido.Text = paciente.Apellido;
                btnRegistrarPaciente.Visible = false;
            }
            else
            {
                txtNombre.Text = "";
                txtApellido.Text = "";
                btnRegistrarPaciente.Visible = true;
            }
        }

        protected void btnGuardarTurno_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("PacienteFormulario.aspx?dni=" + txtDni.Text, false);
        }
    }
}