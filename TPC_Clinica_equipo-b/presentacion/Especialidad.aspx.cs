using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace presentacion
{
    public partial class Especialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEspecialidades();
            }
        }

        private void CargarEspecialidades()
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            dgvEspecialidades.DataSource = negocio.listarEspecialidades();
            dgvEspecialidades.DataBind();

        }
        protected void btnAgregarEspecialidad_Click1(object sender, EventArgs e)
        {
            string descripcion = txtEspecialidad.Text.Trim();

            if (!string.IsNullOrEmpty(descripcion))
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                try
                {
                    // Verificamos si ya existe
                    if (negocio.existeEspecialidad(descripcion))
                    {
                        lblExito.Visible = false;
                        lblError.Text = "⚠️ La especialidad ingresada ya se encuentra registrada en el sistema.";
                        lblError.Visible = true;
                        return;
                    }

                    dominio.Especialidad nuevaEspecialidad = new dominio.Especialidad
                    {
                        Descripcion = descripcion,
                        Activo = true
                    };

                    negocio.agregarEspecialidad(nuevaEspecialidad);
                    CargarEspecialidades();
                    txtEspecialidad.Text = string.Empty;

                    // ✅ Mostrar mensaje de éxito
                    lblError.Visible = false;
                    lblExito.Text = "✔️ Especialidad agregada exitosamente.";
                    lblExito.Visible = true;
                }
                catch (Exception ex)
                {
                    lblExito.Visible = false;
                    lblError.Text = "⚠️ Error al agregar la especialidad: " + ex.Message;
                    lblError.Visible = true;
                }
            }
            else
            {
                lblExito.Visible = false;
                lblError.Text = "⚠️ La descripción no puede estar vacía.";
                lblError.Visible = true;
            }
        }


        protected void chkActivo_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkActivo = (CheckBox)sender;

            // Verificación adicional de seguridad
            if (chkActivo.NamingContainer is GridViewRow row)
            {
                // Verifica que el índice sea válido
                if (row.RowIndex >= 0 && row.RowIndex < dgvEspecialidades.DataKeys.Count)
                {
                    int especialidadId = Convert.ToInt32(dgvEspecialidades.DataKeys[row.RowIndex].Value);
                    bool nuevoEstado = chkActivo.Checked;

                    // Guardar en ViewState y mostrar confirmación
                    ViewState["IdAActualizar"] = especialidadId;
                    ViewState["NuevoEstado"] = nuevoEstado;

                    // Mostrar mensaje dinámico
                    lblConfirmarEstadoMensaje.Text = nuevoEstado
                        ? "¿Estás seguro de que querés <strong>activar</strong> esta especialidad?"
                        : "¿Estás seguro de que querés <strong>desactivar</strong> esta especialidad?";

                    pnlConfirmarEstado.Visible = true;
                }
            }
        }

        protected void btnConfirmarEstado_Click(object sender, EventArgs e)
        {
            if (ViewState["IdAActualizar"] != null && ViewState["NuevoEstado"] != null)
            {
                int especialidadId = Convert.ToInt32(ViewState["IdAActualizar"]);
                bool nuevoEstado = Convert.ToBoolean(ViewState["NuevoEstado"]);

                try
                {
                    EspecialidadNegocio negocio = new EspecialidadNegocio();
                    negocio.actualizarEstadoEspecialidad(especialidadId, nuevoEstado);

                    // Limpiar y recargar
                    ViewState["IdAActualizar"] = null;
                    ViewState["NuevoEstado"] = null;
                    pnlConfirmarEstado.Visible = false;

                    CargarEspecialidades();
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error al actualizar el estado: " + ex.Message;
                    lblError.Visible = true;
                }
            }
        }

        protected void btnCancelarEstado_Click(object sender, EventArgs e)
        {
            pnlConfirmarEstado.Visible = false;
            ViewState["IdAActualizar"] = null;
            ViewState["NuevoEstado"] = null;

            // Refrescamos para evitar que el CheckBox quede con estado visual incorrecto
            CargarEspecialidades();
        }

        // Guardamos el ID en ViewState al hacer clic en "Eliminar"
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            ViewState["IdAEliminar"] = id;

            pnlConfirmarEliminacion.Visible = true;
        }

        // Si confirma, eliminamos
        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            if (ViewState["IdAEliminar"] != null)
            {
                int id = Convert.ToInt32(ViewState["IdAEliminar"]);

                // Crear instancia de la capa de negocio
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                negocio.eliminarEspecialidad(id); // le pasás el ID

                // Limpiar
                ViewState["IdAEliminar"] = null;
                pnlConfirmarEliminacion.Visible = false;

                CargarEspecialidades();
            }
        }

        // Si cancela, ocultamos el panel
        protected void btnCancelarEliminar_Click(object sender, EventArgs e)
        {
            pnlConfirmarEliminacion.Visible = false;
            ViewState["IdAEliminar"] = null;

        }
    }
}