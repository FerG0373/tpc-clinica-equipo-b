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
                CargarTurnos();
            }
        }

        private void CargarTurnos()
        {
            try
            {
                TurnoNegocio negocio = new TurnoNegocio();
                List<TurnoVista> lista = negocio.ListarTurnos();

                dgvTurnos.DataSource = lista;
                dgvTurnos.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al cargar los turnos: " + ex.Message, ex);
            }
        }


        protected void dgvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

    }
}