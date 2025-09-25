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
            if (Session["usuario"] == null)
            {
                Response.Redirect("UsuarioLogin.aspx", false);
            }
            else
            {
                Usuario logueado = (Usuario)Session["usuario"];  // Obtener el objeto del usuario y verificar su perfil.
                if (logueado.TipoUsuario != "Administrador" && logueado.TipoUsuario != "Recepcionista" && logueado.TipoUsuario != "Medico")
                {
                    Response.Redirect("Default.aspx", false);
                }
            }

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
            int medicoId;

            // Obtener el medicoId de la URL.
            if (int.TryParse(Request.QueryString["medicoId"], out medicoId))
            {
                // Si el medicoId es válido, verifica que el usuario logueado sea el mismo médico.
                Usuario logueado = (Usuario)Session["usuario"];
                if (logueado.TipoUsuario == "Medico" && (int)Session["medicoId"] == medicoId)
                {
                    // Cargar la grilla con los turnos filtrados por el medicoId.
                    dgvTurnos.DataSource = negocio.listarTurnos(medicoId: medicoId);
                    dgvTurnos.DataBind();
                    return; // Salir del método para evitar cargar todos los turnos.
                }
            }
            // Si no hay un medicoId válido en la URL o el usuario no es el médico correcto,
            // se cargan todos los turnos (comportamiento por defecto para Admin/Recepcionista).
            dgvTurnos.DataSource = negocio.listarTurnos();
            dgvTurnos.DataBind();
        }
        protected string GetEstadoCssClass(object estado)
        {
            string estadoTexto = estado.ToString().Trim().ToLower();

            switch (estadoTexto)
            {
                case "nuevo":
                    return "fw-bold text-success"; // Verde y negrita.
                case "reprogramado":
                    return "fw-bold text-primary"; // Azul claro y negrita.
                case "cancelado":
                    return "fw-bold text-danger"; // Rojo y negrita.
                case "no asistio":
                case "cerrado":
                    return "fw-bold text-dark"; // Negro y negrita.
                default:
                    return "fw-bold"; // Negrita por defecto para cualquier otro caso.
            }
        }

        protected void dgvTurnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvTurnos.SelectedDataKey.Value.ToString();
            Response.Redirect("TurnoListaDetalle.aspx?id=" + id, false);
        }

        protected void dgvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvTurnos.PageIndex = e.NewPageIndex;
            cargarDgvTurno();
        }
    }
}