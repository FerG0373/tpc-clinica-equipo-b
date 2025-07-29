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
                cargarMedicos();
                ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione un médico", "0"));
                ddlHorario.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
                btnRegistrarPaciente.Visible = false;
            }
        }

        //protected void txtDni_TextChanged(object sender, EventArgs e)
        //{
        //    string dni = txtDni.Text.Trim();
        //    PacienteNegocio negocio = new PacienteNegocio();
        //    Paciente paciente = negocio.buscarPorDni(dni);

        //    if (paciente != null)
        //    {
        //        txtNombre.Text = paciente.Nombre;
        //        txtApellido.Text = paciente.Apellido;
        //        ddlSexo.SelectedValue = paciente.Sexo;
        //        txtFechaNacimiento.Text = paciente.FechaNacimiento.ToString("yyyy-MM-dd");
        //        txtTelefono.Text = paciente.Telefono;
        //        txtEmail.Text = paciente.Email;
        //        ddlCobertura.SelectedValue = paciente.TipoCobertura;
        //        btnRegistrarPaciente.Visible = false;
        //    }
        //    else
        //    {
        //        // Limpiar campos
        //        txtNombre.Text = "";
        //        txtApellido.Text = "";
        //        ddlSexo.SelectedIndex = 0;
        //        txtFechaNacimiento.Text = "";
        //        txtTelefono.Text = "";
        //        txtEmail.Text = "";
        //        ddlCobertura.SelectedIndex = 0;
        //        btnRegistrarPaciente.Visible = true;
        //    }
        //}

        //protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int medicoId = int.Parse(ddlMedico.SelectedValue);
        //    DateTime fecha = DateTime.Parse(txtFecha.Text);

        //    HorarioNegocio negocio = new HorarioNegocio();
        //    ddlHorario.DataSource = negocio.ListarDisponibles(medicoId, fecha);
        //    ddlHorario.DataValueField = "Id";
        //    ddlHorario.DataTextField = "Hora"; // Asegurate que sea legible
        //    ddlHorario.DataBind();
        //    ddlHorario.Items.Insert(0, new ListItem("Seleccione horario", "0"));
        //}

        //protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int medicoId = int.Parse(ddlMedico.SelectedValue);
        //    EspecialidadNegocio negocio = new EspecialidadNegocio();

        //    ddlEspecialidad.DataSource = negocio.listarEspecialidadesMedicos(medicoId);
        //    ddlEspecialidad.DataValueField = "Id";
        //    ddlEspecialidad.DataTextField = "Descripcion";
        //    ddlEspecialidad.DataBind();
        //    ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
        //}
        
        private void cargarMedicos()
        {
            MedicoNegocio negocio = new MedicoNegocio();
            ddlMedico.DataSource = negocio.listarMedicos();
            ddlMedico.DataValueField = "Id";
            ddlMedico.DataTextField = "NombreCompleto";
            ddlMedico.DataBind();
            ddlMedico.Items.Insert(0, new ListItem("Seleccione un médico", "0"));
        }

        protected void btnGuardarTurno_Click(object sender, EventArgs e)
        {
            Turno turno = new Turno();
            turno.FechaHora = DateTime.Parse(txtFecha.Text + " " + ddlHorario.SelectedItem.Text);
            turno.MotivoConsulta = txtMotivoConsulta.Text;
            turno.ObservacionesMedico = txtObsercvaciones.Text;
            turno.MedicoId = int.Parse(ddlMedico.SelectedValue);
            turno.EspecialidadId = int.Parse(ddlEspecialidad.SelectedValue);
            turno.EstadoTurnoId = 1; // Asignar "Pendiente" o estado inicial

            string dni = txtDni.Text.Trim();
            PacienteNegocio negocioP = new PacienteNegocio();
            Paciente paciente = negocioP.buscarPorDni(dni);

            if (paciente != null)
                turno.PacienteId = paciente.Id;
            else
            {
                // Debería bloquear el guardado
                lblError.Text = "Debe registrar el paciente antes de guardar el turno.";
                return;
            }

            TurnoNegocio negocioT = new TurnoNegocio();
            negocioT.Agregar(turno);
            Response.Redirect("TurnoLista.aspx");
        }

        protected void btnRegistrarPaciente_Click(object sender, EventArgs e)
        {
            Response.Redirect("PacienteNuevo.aspx?dni=" + txtDni.Text);
        }
    }
}