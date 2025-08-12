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
            //if (ddlMedico.SelectedValue != "0")
            //{
            //    int medicoId = int.Parse(ddlMedico.SelectedValue);
            //    HorarioNegocio negocio = new HorarioNegocio();

            //    // Este método debe devolver lista de { IdTurno, Fecha, Hora, NombreMedico }
            //    ddlFechaHora.DataSource = negocio.ListarFechasPosibles(medicoId);
            //    ddlFechaHora.DataValueField = "IdTurno";
            //    ddlFechaHora.DataTextField = "DescripcionCompleta";
            //    ddlFechaHora.DataBind();
            //    ddlFechaHora.Items.Insert(0, new ListItem("Seleccione fecha y hora", "0"));
            //}
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
                txtSexo.Text = paciente.Sexo;
                txtFechaNacimiento.Text = paciente.FechaNacimiento.HasValue? paciente.FechaNacimiento.Value.ToString("yyyy-MM-dd"): "";
                txtTelefono.Text = paciente.Telefono;
                txtEmail.Text = paciente.Email;
                txtCobertura.Text = paciente.TipoCobertura;
                btnRegistrarPaciente.Visible = false;
            }
            else
            {
                txtNombre.Text = "";
                txtApellido.Text = "";
                txtSexo.Text = "";
                txtFechaNacimiento.Text = "";
                txtTelefono.Text = "";
                txtEmail.Text = "";
                txtCobertura.Text = "";
                btnRegistrarPaciente.Visible = true;
            }
        }

        protected void btnGuardarTurno_Click(object sender, EventArgs e)
        {
            //string dni = txtDni.Text.Trim();
            //PacienteNegocio negocioP = new PacienteNegocio();
            //Paciente paciente = negocioP.buscarPorDni(dni);

            //if (paciente == null)
            //{
            //    lblError.Text = "Debe registrar el paciente antes de guardar el turno.";
            //    return;
            //}

            //// Aquí ddlFechaHora.SelectedValue puede ser el ID del turno o del horario posible
            //Turno turno = new Turno
            //{
            //    IdHorario = int.Parse(ddlFechaHora.SelectedValue),
            //    MotivoConsulta = txtMotivoConsulta.Text,
            //    ObservacionesMedico = txtObsercvaciones.Text,
            //    PacienteId = paciente.Id,
            //    EstadoTurnoId = 1 // Pendiente
            //};

            //TurnoNegocio negocioT = new TurnoNegocio();
            //negocioT.Agregar(turno);

            //Response.Redirect("TurnoLista.aspx");
        }

        protected void btnRegistrarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("PacienteFormulario.aspx?dni=" + txtDni.Text, false);
        }
    }
}