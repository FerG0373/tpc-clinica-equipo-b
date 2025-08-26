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
    public partial class TurnoTrabajoLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panelExito.Visible = false;

            if (!IsPostBack)
            {
                cargarDgvTurnoTrabajo();
                if (Session["MensajeExito"] != null)
                {
                    lblMensajeExito.Text = Session["MensajeExito"].ToString();
                    panelExito.Visible = true;
                    Session.Remove("MensajeExito");
                }
            }
        }

        private void cargarDgvTurnoTrabajo()
        {
            TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();
            dgvTurnoTrabajo.DataSource = negocio.listarTurnosDeTrabajo();
            dgvTurnoTrabajo.DataBind();
        }

        protected void dgvTurnoTrabajo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvTurnoTrabajo.SelectedDataKey.Value.ToString();
            Response.Redirect("TurnoTrabajoFormulario.aspx?id=" + id);
        }

        protected void dgvTurnoTrabajo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void dgvTurnoTrabajo_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}