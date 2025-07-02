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

        }

        protected void btnMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("ScrMedico.aspx");
        }

        protected void btnTurno_Click(object sender, EventArgs e)
        {
            Response.Redirect("Turno.aspx");
        }

        protected void btnEspecialidades_Click(object sender, EventArgs e)
        {
            Response.Redirect("Especialidad.aspx");
        }


        protected void btnTurnoTrabajo_Click(object sender, EventArgs e)
        {
            Response.Redirect("TurnoTrabajo.aspx");
        }
    }
}