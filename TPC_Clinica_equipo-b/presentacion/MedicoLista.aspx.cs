﻿using dominio;
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

                // Guarda el ID en el HiddenField del modal. Esto es crucial para el botón de Confirmar.
                hfMedicoIdDesactivar.Value = medicoId.ToString();

                //Reiniciar el checkbox del modal (desmarcado por defecto).
                chkConfirmarDesactivacion.Checked = false;
                // Ocultar cualquier mensaje de error previo del modal.
                lblErrorModal.Visible = false;

                // Mostrar el modal. Necesitas la función JavaScript para esto.
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModalScript", "mostrarMensajeDesactivar();", true);
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
                negocio.desactivarMedico(medicoId);

                Session["MensajeExito"] = "✔️ Médico desactivado con éxito.";
                // Ocultar el modal con JavaScript o en el code-behind
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "var myModal = new bootstrap.Modal(document.getElementById('modalConfirmacionDesactivar')); myModal.hide();", true);

                Response.Redirect(Request.RawUrl); 
            }
            catch (Exception ex)
            {
                lblErrorModal.Text = "❌ Error al desactivar el médico: " + ex.Message;
                lblErrorModal.Visible = true;
            }
        }
    }    
}