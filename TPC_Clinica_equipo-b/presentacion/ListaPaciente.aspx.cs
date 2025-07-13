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

        //Evento para cargar los pacientes al iniciar la pagina
        private void CargarPaciente()
        {
            // Instancia de PacienteNegocio para obtener la lista de pacientes
            PacienteNegocio negocio = new PacienteNegocio();
            dgvPacientes.DataSource = negocio.listarPacientes();
            dgvPacientes.DataBind();

        }

        //protected void chkActivo_CheckedChanged(object sender, EventArgs e)
        //{
        //    // Este evento se dispara cuando se cambia el estado del CheckBox
        //    CheckBox chkActivo = (CheckBox)sender;

        //    // Verifica si el CheckBox está dentro de un GridViewRow
        //    if (chkActivo.NamingContainer is GridViewRow row)
        //    {
        //        // Obtiene el índice de la fila y el ID del paciente desde DataKeys
        //        int index = row.RowIndex;
        //        if (index >= 0 && index < dgvPacientes.DataKeys.Count)
        //        {
        //            // Obtiene el ID del paciente y el nuevo estado del CheckBox
        //            int idPaciente = Convert.ToInt32(dgvPacientes.DataKeys[index].Value);
        //            bool nuevoEstado = chkActivo.Checked;

        //            // Muestra un mensaje de confirmación antes de cambiar el estado
        //            ViewState["PacienteIdEstado"] = idPaciente;
        //            ViewState["NuevoEstado"] = nuevoEstado;
        //            lblConfirmacionEstado.Text = nuevoEstado
        //                ? "¿Deseás activar este paciente?"
        //                : "¿Deseás desactivar este paciente?";
        //            pnlConfirmarEstado.Visible = true;
        //        }
        //    }
        //}

        //protected void btnConfirmarEstado_Click(object sender, EventArgs e)
        //{
        //    // Ocultar mensajes previos de error/éxito al inicio
        //    if (lblErrorEstadoPaciente != null) lblErrorEstadoPaciente.Visible = false;
        //    if (lblExitoEstadoPaciente != null) lblExitoEstadoPaciente.Visible = false;
        //    if (pnlConfirmarEstado != null) pnlConfirmarEstado.Visible = false; // Ocultar el panel de confirmación

        //    try
        //    {
        //        // Verificar que los datos necesarios estén en ViewState
        //        if (ViewState["PacienteIdEstado"] != null && ViewState["NuevoEstado"] != null)
        //        {
        //            // Recuperar el ID del paciente y el nuevo estado desde ViewState
        //            int idPaciente = (int)ViewState["PacienteIdEstado"];
        //            bool nuevoEstado = (bool)ViewState["NuevoEstado"];

        //            // Instanciar la capa de negocio
        //            PacienteNegocio negocio = new PacienteNegocio();
        //            negocio.actualizarEstadoPaciente(idPaciente, nuevoEstado);

        //            // Si la operación fue exitosa, mostrar mensaje de éxito
        //            Session["PacienteMensaje"] = "✔️ Estado actualizado correctamente.";
        //            Response.Redirect(Request.RawUrl); // Recarga la página para mostrar el mensaje y reflejar el cambio
        //        }
        //        else
        //        {
        //            // Si faltan datos en ViewState, mostrar un error
        //            if (lblErrorEstadoPaciente != null)
        //            {
        //                lblErrorEstadoPaciente.Text = "⚠️ Error: No se pudo obtener la información del paciente para actualizar el estado.";
        //                lblErrorEstadoPaciente.Visible = true;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        if (lblErrorEstadoPaciente != null)
        //        {
        //            lblErrorEstadoPaciente.Text = "⚠️ Error al actualizar el estado del paciente: " + ex.Message;
        //            lblErrorEstadoPaciente.Visible = true;
        //        }

        //        Console.WriteLine("Excepción completa en btnConfirmarEstado_Click: " + ex.ToString());

        //    }
        //    finally
        //    {
        //        // Limpiar ViewState después de intentar la operación.
        //        ViewState["PacienteIdEstado"] = null;
        //        ViewState["NuevoEstado"] = null;
        //    }
        //}

        //protected void btnCancelarEstado_Click(object sender, EventArgs e)
        //{
        //    // Se cancela el cambio de estado y se oculta el panel de confirmación
        //    pnlConfirmarEstado.Visible = false;
        //    ViewState["PacienteIdEstado"] = null;
        //    ViewState["NuevoEstado"] = null;
        //}
    }
}
