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
                cargarMedicos();
                ddlTurnoDisponible.Items.Insert(0, new ListItem("Seleccione horario disponible", "0"));
            }
        }

        private void cargarEspecialidades()
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            ddlEspecialidad.DataSource = negocio.listarEspecialidades();
            ddlEspecialidad.DataValueField = "Id"; 
            ddlEspecialidad.DataTextField = "Descripcion";  
            ddlEspecialidad.DataBind();

            ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar especialidad --", "0"));
        }

        private void cargarMedicos()
        {
            MedicoNegocio negocio = new MedicoNegocio();
            ddlMedico.DataSource = negocio.listarMedicos();
            ddlMedico.DataValueField = "Id";
            ddlMedico.DataTextField = "NombreCompleto";
            ddlMedico.DataBind();

            ddlMedico.Items.Insert(0, new ListItem("-- Seleccionar médico --", "0"));
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int especialidadId = int.Parse(ddlEspecialidad.SelectedValue);
            EspecialidadNegocio negocio = new EspecialidadNegocio();

            ddlMedico.DataSource = negocio.listarMedicosPorEspecialidad(especialidadId);
            ddlMedico.DataValueField = "Id";
            ddlMedico.DataTextField = "NombreCompleto";
            ddlMedico.DataBind();
            ddlMedico.Items.Insert(0, new ListItem("-- Seleccionar médico --", "0"));
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
            }
            else
            {
                txtNombre.Text = "";
                txtApellido.Text = "";
            }
        }

        protected void btnGuardarTurno_Click(object sender, EventArgs e)
        {

        }
    }
}