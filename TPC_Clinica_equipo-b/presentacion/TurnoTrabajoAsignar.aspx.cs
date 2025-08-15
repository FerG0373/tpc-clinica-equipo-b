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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string medicoId = Request.QueryString["medicoId"] != null ? Request.QueryString["medicoId"].ToString() : "";

                if (medicoId != "")
                {
                    ViewState["medicoId"] = medicoId;
                }

                cargarGridView();
            }
        }
        private void cargarGridView()
        {
            TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();
            dgvTurnoTrabajoAsignar.DataSource = negocio.listarTurnosDeTrabajo();
            dgvTurnoTrabajoAsignar.DataBind();
        }

        protected void dgvTurnoTrabajoAsignar_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void dgvTurnoTrabajoAsignar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void dgvTurnoTrabajoAsignar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            // Lista para almacenar los IDs de los turnos seleccionados.
            List<int> turnosSeleccionados = new List<int>();

            // Recorrer todas las filas del GridView.
            foreach (GridViewRow row in dgvTurnoTrabajoAsignar.Rows)
            {
                // Encontrar el control CheckBox en la fila actual.
                CheckBox chkAsignar = (CheckBox)row.FindControl("chkAsignar");

                // Verificar si el CheckBox existe y está marcado.
                if (chkAsignar != null && chkAsignar.Checked)
                {
                    // Obtener el ID del turno de la clave de datos (DataKey) de la fila.
                    // Es crucial que tu GridView tenga DataKeyNames="Id".
                    int turnoTrabajoId =(int)(dgvTurnoTrabajoAsignar.DataKeys[row.RowIndex].Value);

                    // Agregar el ID a la lista.
                    turnosSeleccionados.Add(turnoTrabajoId);
                }
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
                // En caso de que no haya un ID en ViewState (por si algo falló),
                // puedes redirigir a la lista de médicos general.
                Response.Redirect("MedicoLista.aspx", false);
            }
        }
    }
}