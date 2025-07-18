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

                // Mostrar mensaje si existe.
                if (Session["MensajeExito"] != null)
                {
                    lblMensajeExito.Text = Session["MensajeExito"].ToString();
                    panelExito.Visible = true;
                    // Borra el mensaje de la sesión para que no vuelva a aparecer al recargar.
                    Session.Remove("MensajeExito");
                }
            }
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
            if (e.CommandName == "DesactivarMedico")
            {
                int medicoId = int.Parse(e.CommandArgument.ToString());

                MedicoNegocio negocio = new MedicoNegocio();
                Medico medicoADesactivar = negocio.listarMedicos(medicoId.ToString()).FirstOrDefault();

                if (medicoADesactivar != null)
                {
                    lblNombreMedicoDesactivar.Text = medicoADesactivar.Nombre + " " + medicoADesactivar.Apellido;
                    hfMedicoIdDesactivar.Value = medicoId.ToString();
                    lblErrorModal.Visible = false;
                    chkConfirmarDesactivacion.Checked = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "showDesactivarModal();", true);
                }
                else
                {
                    Session["MensajeExito"] = "❌ Error: No se encontró el médico para desactivar.";
                    panelExito.CssClass = "alert alert-danger text-center";
                    panelExito.Visible = true;
                }
            }
        }

        protected void btnConfirmarDesactivar_Click(object sender, EventArgs e)
        {
            // Aquí va la lógica para confirmar la desactivación
            if (!chkConfirmarDesactivacion.Checked)
            {
                lblErrorModal.Text = "Debes confirmar la desactivación.";
                lblErrorModal.Visible = true;
                return; // Detener el proceso si no se ha confirmado
            }

            try
            {
                int medicoId = int.Parse(hfMedicoIdDesactivar.Value);
                MedicoNegocio negocio = new MedicoNegocio();
                negocio.desactivarMedico(medicoId); // Asume que tienes este método en tu Negocio

                Session["MensajeExito"] = "✔️ Médico desactivado con éxito.";
                // Ocultar el modal con JavaScript o en el code-behind
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "var myModal = new bootstrap.Modal(document.getElementById('modalConfirmacionDesactivar')); myModal.hide();", true);

                // Recargar la lista de médicos para reflejar el cambio
                Response.Redirect(Request.RawUrl); // Redirige a la misma página para un refresh completo
                                                   // Alternativamente, puedes llamar a CargarMedicos() y hacer que el panelExito se muestre.
            }
            catch (Exception ex)
            {
                lblErrorModal.Text = "❌ Error al desactivar el médico: " + ex.Message;
                lblErrorModal.Visible = true;
                // Puedes también mostrar un mensaje de error en la página principal si lo deseas
                // Session["MensajeExito"] = "❌ Error al desactivar: " + ex.Message;
                // panelExito.CssClass = "alert alert-danger text-center";
                // panelExito.Visible = true;
            }
        }
    }    
}