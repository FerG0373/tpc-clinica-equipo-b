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
    public partial class TurnoTrabajoMedicoLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDgvTurnoTrabajoMedico();
            }
        }

        private void cargarDgvTurnoTrabajoMedico()
        {
            TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();
            dgvTurnoTrabajoMedico.DataSource = negocio.listarTurnosDeTrabajoPorMedicos();
            dgvTurnoTrabajoMedico.DataBind();
        }

        protected void dgvTurnoTrabajoMedico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvTurnoTrabajoMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void dgvTurnoTrabajoMedico_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}