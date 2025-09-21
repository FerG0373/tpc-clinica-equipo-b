using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                btnMedicos.Visible = false;
                btnTurnos.Visible = false;
                btnEspecialidades.Visible = false;
                btnTurnosTrabajo.Visible = false;
                btnMisTurnos.Visible = false;
                btnPacientes.Visible = false;
            }
            else
            {
                btnMedicos.Visible = true;
                btnTurnos.Visible = true;
                btnEspecialidades.Visible = true;
                btnTurnosTrabajo.Visible = true;
                btnMisTurnos.Visible = true;
                btnPacientes.Visible = true;
            }
        }
    }
}