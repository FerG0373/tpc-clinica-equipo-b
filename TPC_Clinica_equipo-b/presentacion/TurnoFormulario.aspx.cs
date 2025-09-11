using dominio;
using negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

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

                string turnoId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(turnoId))
                {
                    try
                    {
                        TurnoNegocio negocio = new TurnoNegocio();
                        Turno seleccionado = negocio.listarTurnos(turnoId)[0];

                        // Precarga campos de texto
                        txtDni.Text = seleccionado.Paciente.Dni;
                        txtNombre.Text = seleccionado.Paciente.Nombre;
                        txtApellido.Text = seleccionado.Paciente.Apellido;
                        txtMotivoConsulta.Text = seleccionado.Motivo;

                        // Precargar especialidad
                        ddlEspecialidad.SelectedValue = seleccionado.Especialidad.Id.ToString();

                        // Recargar médicos de esa especialidad antes de seleccionar
                        ddlEspecialidad_SelectedIndexChanged(null, null);
                        ddlMedico.SelectedValue = seleccionado.Medico.Id.ToString();

                        // Recargar turnos del médico antes de seleccionar
                        ddlMedico_SelectedIndexChanged(null, null);

                        // Seleccionar el turno en el ddl
                        string fechaYHoraSeleccionada = seleccionado.Fecha.ToShortDateString() + " " + seleccionado.Hora.ToString(@"hh\:mm");
                        ListItem item = ddlTurnoDisponible.Items.FindByText(fechaYHoraSeleccionada);
                        if (item != null)
                            item.Selected = true;
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "❌ Error al cargar los datos del turno: " + ex.Message;
                        lblError.Visible = true;
                    }
                }
            }
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
                ddlTurnoDisponible.Items.Clear();
                ddlTurnoDisponible.Items.Insert(0, new ListItem("-- Seleccionar horario disponible --", "0"));
            }

            // Restaurar si sigue siendo válida
            if (ddlEspecialidad.Items.FindByValue(especialidadSeleccionada) != null)
                ddlEspecialidad.SelectedValue = especialidadSeleccionada;
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

        private void cargarTurnosDisponibles(int medicoId)
        {
            try
            {
                // Llama al método que se encarga de la lógica de búsqueda.
                var turnosDisponibles = buscarProximosTurnos(medicoId);

                // Llama al método que carga el DropDownList.
                cargarDropDownList(turnosDisponibles);
            }
            catch (Exception ex)
            {
                lblError.Text = "❌ Ocurrió un error: " + ex.Message;
                lblError.Visible = true;
            }
        }

        private List<DateTime> buscarProximosTurnos(int medicoId)
        {
            var negocioTT = new TurnoTrabajoNegocio();  // Se instancia para obtener los horarios de trabajo.
            var negocioT = new TurnoNegocio();  // Se instancia para obtener los turnos ya agendados.

            var horariosDelMedico = negocioTT.listarTurnosDeTrabajoPorMedico(medicoId);  // Se llama al método para obtener la agenda del médico (ej: "Lunes de 8 a 12").
            var fechaBusqueda = DateTime.Today;  // Se inicializa con la fecha actual.
            var turnosDisponibles = new List<DateTime>();  // Lista para guardar los turnos que se encuentren libres.

            // Si el médico no tiene horarios de trabajo, se devuelve una lista vacía.
            if (horariosDelMedico.Count == 0)
            {
                return turnosDisponibles;
            }

            while (turnosDisponibles.Count < 5)  // Bucle para buscar 5 turnos en los próximos días.
            {
                fechaBusqueda = fechaBusqueda.AddDays(1);  // Pasa al siguiente día en cada iteración para no asignar el turno el mismo día.
                string diaSemanaBusqueda = obtenerNombreDiaSemana(fechaBusqueda.DayOfWeek);  // Obtiene el día de la semana en español.

                // Esta lista contiene los horarios de trabajo del médico, pero solo para un día específico. FindAll() busca en una lista y retorna otra lista con los elementos que cumplen una condición.
                List<TurnoTrabajo> horariosDelDia = horariosDelMedico.FindAll(h => h.DiaSemana.ToLower() == diaSemanaBusqueda.ToLower());

                // Verifica si la lista horariosDelDia contiene algún elemento. O sea, cuenta cuántos horarios de trabajo tiene el médico para ese día de la semana que se está buscando.
                if (horariosDelDia.Count > 0)
                {
                    // Obtener los turnos de una fecha. Es la lista de objetos Turno que se obtuvo de la base de datos (los que están agendados).
                    List<Turno> turnosOcupados = negocioT.listarTurnosPorMedicoYFecha(medicoId, fechaBusqueda);

                    // Recorre cada rango de horario de trabajo del médico para el día actual.
                    // Por ejemplo, si el médico trabaja de 8 a 12 y de 16 a 20, este bucle se ejecutará dos veces.
                    foreach (var horario in horariosDelDia)
                    {
                        // Combina la fecha de búsqueda con la hora de inicio del turno de trabajo. Esto crea un punto de partida para generar los turnos. Por ejemplo: 08/09/2025 08:00:00.
                        DateTime fechaHoraActual = fechaBusqueda.Date.Add(horario.HoraInicio);
                        // Combina la fecha con la hora de fin del turno de trabajo. Esto es el límite hasta donde se generarán turnos. Por ejemplo: 08/09/2025 12:00:00.
                        DateTime fechaHoraFin = fechaBusqueda.Date.Add(horario.HoraFin);

                        // Asegura que el bucle no genere turnos más allá del horario de trabajo del médico y verifica si la cantidad de turnos que ya se han encontrado y añadido a la lista es menor que 5.
                        while (fechaHoraActual < fechaHoraFin && turnosDisponibles.Count < 5)
                        {
                            // Any() pregunta si algún elemento en la lista cumple una condición.
                            // Compara solo la fecha de un turno ocupado (t.Fecha) con la fecha del turno que estamos generando (fechaHoraActual).
                            // Compara solo la hora de un turno ocupado(t.Hora) con la hora del turno que estamos generando(fechaHoraActual).
                            // O sea, si NO hay ningún turno ocupado que coincida con la fecha y hora que estamos buscando, entonces este turno está disponible y lo agrego a la lista.
                            if (!turnosOcupados.Any(t => t.Fecha.Date == fechaHoraActual.Date && t.Hora.Hours == fechaHoraActual.Hour))
                            {
                                turnosDisponibles.Add(fechaHoraActual);
                            }
                            fechaHoraActual = fechaHoraActual.AddHours(1);  // Contador.
                        }
                    }
                }
            }
            return turnosDisponibles;
        }

        private string obtenerNombreDiaSemana(DayOfWeek diaSemana)
        {
            // Método auxiliar para convertir el nombre del día de la semana.
            // Aunque no se vea el nombre del día en el formulario del paciente necesita saber si el médico trabaja el día de la semana que está procesando.
            return new CultureInfo("es-ES").DateTimeFormat.GetDayName(diaSemana);
        }

        private void cargarDropDownList(List<DateTime> turnosDisponibles)
        {
            ddlTurnoDisponible.Items.Clear();

            if (turnosDisponibles.Count > 0)
            {
                ddlTurnoDisponible.Items.Insert(0, new ListItem("-- Seleccionar horario disponible --", "0"));

                foreach (DateTime turno in turnosDisponibles)
                {
                    ddlTurnoDisponible.Items.Add(new ListItem(turno.ToShortDateString() + " " + turno.ToString(@"hh\:mm"), turno.ToString()));
                }
            }
            else
            {
                ddlTurnoDisponible.Items.Insert(0, new ListItem("-- No hay turnos disponibles --", "0"));
            }
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

        private bool validarFormulario()
        {
            lblErrorDni.Visible = false;
            lblErrorEspecialidad.Visible = false;
            lblErrorMedico.Visible = false;
            lblErrorTurno.Visible = false;

            bool validacionExitosa = true;

            if (string.IsNullOrWhiteSpace(txtDni.Text))
            {
                lblErrorDni.Text = "⚠️ Debe ingresar el DNI del paciente.";
                lblErrorDni.Visible = true;
                validacionExitosa = false;
            }
            else if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                lblErrorDni.Text = "⚠️ El DNI ingresado no corresponde a un paciente existente.";
                lblErrorDni.Visible = true;
                validacionExitosa = false;
            }

            if (ddlEspecialidad.SelectedValue == "0")
            {
                lblErrorEspecialidad.Text = "⚠️ Debe seleccionar una especialidad.";
                lblErrorEspecialidad.Visible = true;
                validacionExitosa = false;
            }

            if (ddlMedico.SelectedValue == "0")
            {
                lblErrorMedico.Text = "⚠️ Debe seleccionar un médico.";
                lblErrorMedico.Visible = true;
                validacionExitosa = false;
            }

            if (ddlTurnoDisponible.SelectedValue == "0")
            {
                lblErrorTurno.Text = "⚠️ Debe seleccionar un horario de turno.";
                lblErrorTurno.Visible = true;
                validacionExitosa = false;
            }

            if (string.IsNullOrWhiteSpace(txtMotivoConsulta.Text))
            {
                lblErrorMotivoConsulta.Text = "⚠️ Debe ingresar el motivo de la consulta.";
                lblErrorMotivoConsulta.Visible = true;
                validacionExitosa = false;
            }

            return validacionExitosa;
        }

        protected void btnGuardarTurno_Click(object sender, EventArgs e)
        {
            if (!validarFormulario())
            {
                return;
            }

            try
            {
                Turno nuevo = new Turno();
                TurnoNegocio turnoNegocio = new TurnoNegocio();
                PacienteNegocio pacienteNegocio = new PacienteNegocio();
                EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
                MedicoNegocio medicoNegocio = new MedicoNegocio();

                nuevo.Paciente = pacienteNegocio.buscarPorDni(txtDni.Text);

                int especialidadId = int.Parse(ddlEspecialidad.SelectedValue);
                nuevo.Especialidad = especialidadNegocio.obtenerEspecialidadPorId(especialidadId);

                int medicoId = int.Parse(ddlMedico.SelectedValue);
                nuevo.Medico = medicoNegocio.obtenerMedicoPorId(medicoId);

                nuevo.Fecha = DateTime.Parse(ddlTurnoDisponible.SelectedValue);
                nuevo.Hora = nuevo.Fecha.TimeOfDay;

                nuevo.Motivo = txtMotivoConsulta.Text;
                nuevo.Estado = "Nuevo";
                
                turnoNegocio.insertarTurno(nuevo);

                Session["MensajeExito"] = "✅ Turno agendado con éxito.";

                Response.Redirect("TurnoLista.aspx", false);
            }
            catch (Exception ex)
            {
                lblError.Text = "❌ Error al guardar el turno: " + ex.Message;
                lblError.Visible = true;
                throw ex;
            }
        }
    }
}