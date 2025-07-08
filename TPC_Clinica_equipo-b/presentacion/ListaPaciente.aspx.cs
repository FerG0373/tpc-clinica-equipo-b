using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace presentacion
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarPaciente();
            }
        }

        private void CargarPaciente()
        {
            PacienteNegocio negocio = new PacienteNegocio();
            dgvPacientes.DataSource = negocio.listarPacientes();
            dgvPacientes.DataBind();

        }

    }
}
