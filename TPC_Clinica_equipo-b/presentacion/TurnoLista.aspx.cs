using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace presentacion
{
    public partial class ListaTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panelExito.Visible = false;

                if (!IsPostBack)
                {
                    cargarDgvTurno();
                    if (Session["MensajeExito"] != null)
                    {
                        lblMensajeExito.Text = Session["MensajeExito"].ToString();
                        panelExito.Visible = true;
                        Session.Remove("MensajeExito");
                    }
                }
            }
        }

        private void cargarDgvTurno()
        {
            TurnoNegocio negocio = new TurnoNegocio();
            dgvTurnos.DataSource = negocio.listarTurnos();
            dgvTurnos.DataBind();
        }

        protected void dgvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

    }
}