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

        protected void chkActivo_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkActivo = (CheckBox)sender;

            if (chkActivo.NamingContainer is GridViewRow row)
            {
                int index = row.RowIndex;
                if (index >= 0 && index < dgvPacientes.DataKeys.Count)
                {
                    int idPaciente = Convert.ToInt32(dgvPacientes.DataKeys[index].Value);
                    bool nuevoEstado = chkActivo.Checked;

                    ViewState["PacienteIdEstado"] = idPaciente;
                    ViewState["NuevoEstado"] = nuevoEstado;
                    lblConfirmacionEstado.Text = nuevoEstado
                        ? "¿Deseás activar este paciente?"
                        : "¿Deseás desactivar este paciente?";
                    pnlConfirmarEstado.Visible = true;
                }
            }
        }

        protected void btnCancelarEstado_Click(object sender, EventArgs e)
        {
            pnlConfirmarEstado.Visible = false;
            ViewState["PacienteIdEstado"] = null;
            ViewState["NuevoEstado"] = null;
        }

        protected void btnConfirmarEstado_Click(object sender, EventArgs e)
        {
            if (ViewState["PacienteIdEstado"] != null && ViewState["NuevoEstado"] != null)
            {
                int idPaciente = (int)ViewState["PacienteIdEstado"];
                bool estado = (bool)ViewState["NuevoEstado"];

                PacienteNegocio negocio = new PacienteNegocio();
                negocio.actualizarEstadoPaciente(idPaciente, estado);

                Session["PacienteMensaje"] = "✔️ Estado actualizado correctamente.";
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}
