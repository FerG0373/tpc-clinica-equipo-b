using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace presentacion
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnMedicos.Visible = false;
            btnTurnos.Visible = false;
            btnEspecialidades.Visible = false;
            btnTurnosTrabajo.Visible = false;
            btnMisTurnos.Visible = false;
            btnPacientes.Visible = false;

            if (Session["usuario"] != null)
            {
                Usuario logueado = (Usuario)Session["usuario"];

                if (logueado.TipoUsuario == "Administrador")
                {
                    btnMedicos.Visible = true;
                    btnTurnos.Visible = true;
                    btnEspecialidades.Visible = true;
                    btnTurnosTrabajo.Visible = true;
                    btnPacientes.Visible = true;
                }
                else if (logueado.TipoUsuario == "Recepcionista")
                {
                    btnMedicos.Visible = true;
                    btnTurnos.Visible = true;
                    btnEspecialidades.Visible = true;
                    btnPacientes.Visible = true;
                }
                else if (logueado.TipoUsuario == "Medico")
                {
                    btnMisTurnos.Visible = true;
                    btnTurnosTrabajo.Visible = true; // Solo lectura.
                    btnPacientes.Visible = true;  // Debería solo lectura.
                }
            }
        }
    }
}