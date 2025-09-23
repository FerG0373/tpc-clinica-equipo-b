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
            if (Session["usuario"] == null)
            {
                Response.Redirect("UsuarioLogin.aspx", false);
            }
            else
            {
                Usuario logueado = (Usuario)Session["usuario"];  // Obtener el objeto del usuario y verificar su perfil.
                if (logueado.TipoUsuario != "Administrador")
                {
                    Response.Redirect("Default.aspx", false);
                }
            }

            if (!IsPostBack)
            {
                string medicoId = Request.QueryString["medicoId"] != null ? Request.QueryString["medicoId"].ToString() : "";

                if (!string.IsNullOrEmpty(medicoId))
                {
                    ViewState["medicoId"] = medicoId;
                }

                MedicoNegocio negocio = new MedicoNegocio();
                try
                {
                    // Obtenemos los datos del médico por su ID
                    Medico medico = negocio.obtenerMedicoPorId(int.Parse(medicoId));

                    // Si se encontró el médico, actualizamos el texto del Label
                    if (medico != null)
                    {
                        lblTurnoTrabajoMedico.Text = "👨‍⚕️👩‍⚕️ Turnos de Trabajo del Médico: 🩺 " + medico.Apellido + ", " + medico.Nombre;
                    }
                }
                catch (Exception)
                {
                    // Si ocurre un error, dejamos el título por defecto o manejamos el error
                    lblTurnoTrabajoMedico.Text = "👨‍⚕️👩‍⚕️ Turnos de Trabajo del Médico";
                }

                cargarDgvTurnoTrabajoMedico();
            }
        }

        private void cargarDgvTurnoTrabajoMedico()
        {
            if (ViewState["medicoId"] != null)
            {
                int medicoId = Convert.ToInt32(ViewState["medicoId"]);
                TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();
                dgvTurnoTrabajoMedico.DataSource = negocio.listarTurnosDeTrabajoPorMedico(medicoId);
                dgvTurnoTrabajoMedico.DataBind();
            }
        }

        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            // Obtener el ID del médico guardado en ViewState
            string medicoId = ViewState["medicoId"] != null ? ViewState["medicoId"].ToString() : "";

            if (!string.IsNullOrEmpty(medicoId))
            {
                // Redirigir a la página de asignación, pasando el ID del médico
                Response.Redirect("TurnoTrabajoAsignar.aspx?medicoId=" + medicoId, false);
            }
            else
            {
                // Como fallback, si no hay ID, redirigir a la lista de médicos.
                Response.Redirect("MedicoLista.aspx", false);
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoLista.aspx", false);
        }
    }
}