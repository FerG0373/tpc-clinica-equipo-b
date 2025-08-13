using negocio;
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