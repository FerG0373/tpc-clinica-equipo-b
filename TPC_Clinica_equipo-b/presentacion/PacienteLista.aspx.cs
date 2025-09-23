using dominio;
using negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class Pacientes : System.Web.UI.Page
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
                    btnAgregarPaciente.Visible = false;

                    Response.Redirect("Default.aspx", false);
                }
            }

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
            List<Paciente> listaPacientes = negocio.listarPacientes();

            // Filtros
            string filtroTexto = txtFiltroRapido.Text.Trim().ToLower();
            string sexo = ddlSexo.SelectedValue;
            string cobertura = ddlCobertura.SelectedValue;
            string activo = ddlActivo.SelectedValue;

            if (!string.IsNullOrEmpty(filtroTexto))
            {
                listaPacientes = listaPacientes.Where(p =>
                    (!string.IsNullOrEmpty(p.Dni) && p.Dni.ToLower().Contains(filtroTexto)) ||
                    (!string.IsNullOrEmpty(p.Nombre) && p.Nombre.ToLower().Contains(filtroTexto)) ||
                    (!string.IsNullOrEmpty(p.Apellido) && p.Apellido.ToLower().Contains(filtroTexto))
                ).ToList();
            }

            if (!string.IsNullOrEmpty(sexo))
                listaPacientes = listaPacientes.Where(p => p.Sexo == sexo).ToList();

            if (!string.IsNullOrEmpty(cobertura))
                listaPacientes = listaPacientes.Where(p => p.TipoCobertura == cobertura).ToList();

            if (!string.IsNullOrEmpty(activo))
            {
                bool activoBool = bool.Parse(activo);
                listaPacientes = listaPacientes.Where(p => p.Activo == activoBool).ToList();
            }

            dgvPacientes.DataSource = listaPacientes;
            dgvPacientes.DataBind();

        }

        protected void dgvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPacientes.PageIndex = e.NewPageIndex; // Cambia el índice de la página actual
            CargarPaciente(); // Vuelve a cargar los pacientes para reflejar el cambio de página
        }

        protected void txtFiltroRapido_TextChanged(object sender, EventArgs e)
        {
            CargarPaciente();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarPaciente();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtFiltroRapido.Text = string.Empty;
            ddlSexo.SelectedIndex = 0;
            ddlCobertura.SelectedIndex = 0;
            ddlActivo.SelectedIndex = 0;

            CargarPaciente();
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string dni = btn.CommandArgument;

            // Redirigimos con el parámetro DNI
            Response.Redirect("PacienteVerDetalle.aspx?dni=" + dni, false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
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
