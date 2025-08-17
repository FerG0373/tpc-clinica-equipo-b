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
    public partial class TurnoTrabajoAsignar : System.Web.UI.Page
    {
        public List<TurnoTrabajo> TurnosAsignados { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string medicoIdStr = Request.QueryString["medicoId"] != null ? Request.QueryString["medicoId"].ToString() : "";

                if (!string.IsNullOrEmpty(medicoIdStr))
                {
                    ViewState["medicoId"] = medicoIdStr;

                    int medicoId = int.Parse(medicoIdStr);
                    TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();

                    // Obtiene la lista de turnos ya asignados al médico.
                    TurnosAsignados = negocio.listarTurnosDeTrabajoPorMedico(medicoId);
                }

                cargarGridView();
            }
        }
        private void cargarGridView()
        {
            TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();
            dgvTurnoTrabajoAsignar.DataSource = negocio.listarTurnosDeTrabajo();
            dgvTurnoTrabajoAsignar.DataBind();

            // Recorre el GridView para tildar los turnos ya asignados.
            if (TurnosAsignados != null)
            {
                foreach (GridViewRow row in dgvTurnoTrabajoAsignar.Rows)
                {
                    // Obtener el ID del turno de la fila actual del GridView.
                    int turnoTrabajoId = (int)dgvTurnoTrabajoAsignar.DataKeys[row.RowIndex].Value;
                    // Buscar si este ID existe en la lista de turnos asignados al médico.
                    if (TurnosAsignados.Any(t => t.Id == turnoTrabajoId))
                    {
                        // Si se encuentra, buscar el CheckBox en la fila y marcarlo.
                        CheckBox chkAsignar = (CheckBox)row.FindControl("chkAsignar");
                        if (chkAsignar != null)
                        {
                            chkAsignar.Checked = true;
                        }
                    }
                }
            }
        }

        protected void dgvTurnoTrabajoAsignar_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void dgvTurnoTrabajoAsignar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvTurnoTrabajoAsignar.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        protected void dgvTurnoTrabajoAsignar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            // Obtener el ID del médico del ViewState.
            if (ViewState["medicoId"] != null)
            {
                int medicoId = Convert.ToInt32(ViewState["medicoId"]);
                MedicoNegocio medicoNegocio = new MedicoNegocio();

                // 1. Obtener la lista de turnos que el usuario acaba de seleccionar.
                List<int> turnosNuevos = new List<int>();
                foreach (GridViewRow row in dgvTurnoTrabajoAsignar.Rows)
                {
                    CheckBox chkAsignar = (CheckBox)row.FindControl("chkAsignar");
                    if (chkAsignar != null && chkAsignar.Checked)
                    {
                        int turnoTrabajoId = (int)(dgvTurnoTrabajoAsignar.DataKeys[row.RowIndex].Value);
                        turnosNuevos.Add(turnoTrabajoId);
                    }
                }

                // 2. Obtener la lista de turnos que el médico ya tiene en la base de datos.
                TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();
                List<TurnoTrabajo> turnosActuales = negocio.listarTurnosDeTrabajoPorMedico(medicoId);

                // 3. Comparar las listas para determinar los cambios.

                // Turnos para INSERTAR:
                // Son los que están en la lista nueva pero no en la actual.
                List<int> turnosParaInsertar = turnosNuevos.Except(turnosActuales.Select(t => t.Id)).ToList();

                // Turnos para ELIMINAR:
                // Son los que están en la lista actual pero no en la nueva.
                List<int> turnosParaEliminar = turnosActuales.Select(t => t.Id).Except(turnosNuevos).ToList();

                // 4. Ejecutar las operaciones en la base de datos.
                // Guardar los turnos nuevos
                foreach (int turnoTrabajoId in turnosParaInsertar)
                {
                    negocio.guardarTurnoDeTrabajo(medicoId, turnoTrabajoId);
                }

                // Eliminar los turnos desmarcados
                foreach (int turnoTrabajoId in turnosParaEliminar)
                {
                    negocio.eliminarTurnoDeTrabajo(medicoId, turnoTrabajoId);
                }

                // Finalmente, redirigir a la página de la lista de turnos.
                Response.Redirect("TurnoTrabajoMedicoLista.aspx?medicoId=" + medicoId, false);
            }
            else
            {
                // En caso de que no se encuentre el ID del médico.
                Response.Redirect("MedicoLista.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (ViewState["medicoId"] != null)
            {
                string medicoId = ViewState["medicoId"].ToString();
                Response.Redirect("TurnoTrabajoMedicoLista.aspx?medicoId=" + medicoId, false);
            }
            else
            {
                // En caso de que no haya un ID en ViewState (por si algo falló), se redirige a la lista de médicos general.
                Response.Redirect("MedicoLista.aspx", false);
            }
        }
    }
}