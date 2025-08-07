using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class MedicoLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MedicoNegocio negocio = new MedicoNegocio();
                dgvMedicos.DataSource = negocio.listarMedicos();
                dgvMedicos.DataBind();
                if (Session["MensajeExito"] != null)
                {
                    lblMensajeExito.Text = Session["MensajeExito"].ToString();
                    panelExito.Visible = true;
                    // Borra el mensaje de la sesión para que no vuelva a aparecer al recargar.
                    Session.Remove("MensajeExito");
                }
            }
            else
            {
                panelExito.Visible = false;
            }
        }

        private void cargarGridView()
        {
            MedicoNegocio negocio = new MedicoNegocio();
            dgvMedicos.DataSource = negocio.listarMedicos();
            dgvMedicos.DataBind();
        }

        protected void dgvMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvMedicos.SelectedDataKey.Value.ToString();
            Response.Redirect("MedicoFormulario.aspx?id=" + id);
        }

        protected void dgvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvMedicos.PageIndex = e.NewPageIndex;
            dgvMedicos.DataBind();
        }

        public string getDescripcionEspecialidades(object especialidades)
        {
            var listaEspecialidades = especialidades as List<dominio.Especialidad>;
            if (listaEspecialidades == null || listaEspecialidades.Count == 0)
                return "Sin especialidades";

            // Usamos String.Join para concatenar las descripciones.
            return string.Join("; ", listaEspecialidades.Select(item => item.Descripcion));
        }

        protected void dgvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            MedicoNegocio negocio = new MedicoNegocio();
            if (e.CommandName == "ActivarMedico" || e.CommandName == "DesactivarMedico")
            {
                int medicoId = Convert.ToInt32(e.CommandArgument);
                try
                {
                    if (e.CommandName == "ActivarMedico")
                    {
                        negocio.activarMedico(medicoId);
                    }
                    else
                    {
                        negocio.desactivarMedico(medicoId);
                    }
                    cargarGridView();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else if (e.CommandName == "VerTurnos")
            {
                int medicoId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("TurnoTrabajoMedicoLista.aspx?medicoId=" + medicoId);
            }
        }
    }    
}