using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
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
                ddlTurnoDisponible.Items.Insert(0, new ListItem("-- Seleccionar horario disponible --", "0"));
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
            string medicoSeleccionado = ddlMedico.SelectedValue;

            if (ddlEspecialidad.SelectedValue != "0")
            {
                int especialidadId = int.Parse(ddlEspecialidad.SelectedValue);
                EspecialidadNegocio negocio = new EspecialidadNegocio();

                ddlMedico.DataSource = negocio.listarMedicosPorEspecialidad(especialidadId);
                ddlMedico.DataValueField = "Id";
                ddlMedico.DataTextField = "NombreCompleto";
                ddlMedico.DataBind();
                ddlMedico.Items.Insert(0, new ListItem("-- Seleccionar médico --", "0"));
            }
            else
            {
                cargarMedicos();
            }
            // Restaurar si sigue siendo válido
            if (ddlMedico.Items.FindByValue(medicoSeleccionado) != null)
                ddlMedico.SelectedValue = medicoSeleccionado;
        }


        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especialidadSeleccionada = ddlEspecialidad.SelectedValue;

            if (ddlMedico.SelectedValue != "0")
            {
                int medicoId = int.Parse(ddlMedico.SelectedValue);
                MedicoNegocio negocio = new MedicoNegocio();

                // 1. Cargar las especialidades asociadas al médico.
                ddlEspecialidad.DataSource = negocio.listarEspecialidadesPorMedico(medicoId);
                ddlEspecialidad.DataValueField = "Id";
                ddlEspecialidad.DataTextField = "Descripcion";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar especialidad --", "0"));

                // 2. Lógica para cargar los turnos disponibles.
                cargarTurnosDisponibles(medicoId);
            }
            else
            {
                cargarEspecialidades();
            }

            // Restaurar si sigue siendo válida
            if (ddlEspecialidad.Items.FindByValue(especialidadSeleccionada) != null)
                ddlEspecialidad.SelectedValue = especialidadSeleccionada;
        }

        private void cargarTurnosDisponibles(int medicoId)
        {
            try
            {
                var negocioTT = new TurnoTrabajoNegocio();  // Se instancia para obtener los horarios de trabajo.
                var negocioT = new TurnoNegocio();  // Se instancia para obtener los turnos ya agendados.

                var horariosDelMedico = negocioTT.listarTurnosDeTrabajoPorMedico(medicoId);  // Se llama al método para obtener la agenda del médico (ej: "Lunes de 8 a 12").
                var turnosDisponibles = new List<DateTime>();  // Lista para guardar los turnos que se encuentren libres.
                var fechaBusqueda = DateTime.Today;  // Se inicializa con la fecha actual.
                                
                for (int i = 0; i < 7 && turnosDisponibles.Count < 3; i++)  // Bucle para buscar turnos en los próximos 7 días o hasta encontrar 3.
                {                    
                    fechaBusqueda = fechaBusqueda.AddDays(1);  // Pasa al siguiente día en cada iteración para no asignar el turno el mismo día.                    

                    string diaSemanaBusqueda = obtenerNombreDiaSemana(fechaBusqueda.DayOfWeek);  // Obtiene el día de la semana en español.
                    // Buscar si el médico trabaja este día
                    List<TurnoTrabajo> horariosDelDia = horariosDelMedico.FindAll(h => h.DiaSemana.ToLower() == diaSemanaBusqueda.ToLower());
                    // Si el médico trabaja este día, busca turnos disponibles
                    if (horariosDelDia.Count > 0)
                    {
                        // Obtener los turnos ocupados para esa fecha
                        List<Turno> turnosOcupados = negocioT.listarTurnosPorMedicoYFecha(medicoId, fechaBusqueda);

                        foreach (var horario in horariosDelDia)
                        {
                            DateTime horaActual = fechaBusqueda.Date.Add(horario.HoraInicio);
                            DateTime horaFin = fechaBusqueda.Date.Add(horario.HoraFin);

                            while (horaActual < horaFin && turnosDisponibles.Count < 3)
                            {
                                if (!turnosOcupados.Any(t => t.Fecha.Date == horaActual.Date && t.Hora.Hours == horaActual.Hour))
                                {
                                    turnosDisponibles.Add(horaActual);
                                }
                                horaActual = horaActual.AddHours(1);
                            }
                        }
                    }
                }
                // Cargar el DropDownList con la lista filtrada
                if (turnosDisponibles.Count > 0)
                {
                    ddlTurnoDisponible.DataSource = turnosDisponibles;
                    ddlTurnoDisponible.DataBind();
                    ddlTurnoDisponible.Items.Insert(0, new ListItem("-- Seleccionar horario disponible --", "0"));
                }
                else
                {
                    ddlTurnoDisponible.Items.Insert(0, new ListItem("-- No hay turnos disponibles --", "0"));
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "❌ Ocurrió un error al cargar los turnos disponibles: " + ex.Message;
                lblError.Visible = true;
            }
        }

        // Método auxiliar para convertir el nombre del día de la semana.
        // Aunque no se vea el nombre del día en el formulario del paciente necesita saber si el médico trabaja el día de la semana que está procesando.        
        private string obtenerNombreDiaSemana(DayOfWeek diaSemana)
        {
            return new CultureInfo("es-ES").DateTimeFormat.GetDayName(diaSemana);
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