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

        // Al cargar la página, cargamos las especialidades
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEspecialidades();
            }
        }

        // Cargamos las especialidades al cargar la página
        private void CargarEspecialidades()
        {
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            dgvEspecialidades.DataSource = negocio.listarEspecialidades();
            dgvEspecialidades.DataBind();

        }

        // Al hacer clic en el botón "Agregar Especialidad", validamos la entrada y agregamos la especialidad
        protected void btnAgregarEspecialidad_Click1(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["IdAEditar"]);
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

                    // Creamos una nueva especialidad
                    dominio.Especialidad nuevaEspecialidad = new dominio.Especialidad
                    {
                        Descripcion = descripcion,
                        Activo = true
                    };

                    // Agregamos la especialidad a la base de datos
                    negocio.agregarEspecialidad(nuevaEspecialidad);
                    CargarEspecialidades();
                    txtEspecialidad.Text = string.Empty;

                    // Mostramos mensaje de éxito
                    lblError.Visible = false;
                    lblExito.Text = "✔️ Especialidad agregada exitosamente.";
                    lblExito.Visible = true;
                }

                catch (Exception ex)
                {
                    // En caso de error, mostramos mensaje de error
                    lblExito.Visible = false;
                    lblError.Text = "⚠️ Error al agregar la especialidad: " + ex.Message;
                    lblError.Visible = true;
                }
            }

            else
            {
                // Si la descripción está vacía, mostramos mensaje de error
                lblExito.Visible = false;
                lblError.Text = "⚠️ La descripción no puede estar vacía.";
                lblError.Visible = true;
            }
        }

        // Al hacer clic en el CheckBox, guardamos el ID de la especialidad y el nuevo estado en ViewState
        protected void chkActivo_CheckedChanged(object sender, EventArgs e)
        {
            // Verificamos que el sender sea un CheckBox
            CheckBox chkActivo = (CheckBox)sender;

            // Verificación adicional de seguridad
            if (chkActivo.NamingContainer is GridViewRow row)
            {
                // Verifica que el índice sea válido
                if (row.RowIndex >= 0 && row.RowIndex < dgvEspecialidades.DataKeys.Count)
                {
                    // Obtenemos el ID de la especialidad desde DataKeys
                    int especialidadId = Convert.ToInt32(dgvEspecialidades.DataKeys[row.RowIndex].Value);
                    bool nuevoEstado = chkActivo.Checked;

                    // Guardar en ViewState y mostrar confirmación
                    ViewState["IdAActualizar"] = especialidadId;
                    ViewState["NuevoEstado"] = nuevoEstado;

                    // Mostrar mensaje dinámico
                    lblConfirmarEstadoMensaje.Text = nuevoEstado
                        ? "¿Estás seguro de que querés <strong>activar</strong> esta especialidad?"
                        : "¿Estás seguro de que querés <strong>desactivar</strong> esta especialidad?";

                    // Mostrar el panel de confirmación
                    pnlConfirmarEstado.Visible = true;
                }
            }
        }

        // Guardamos el ID y el nuevo estado en ViewState al hacer clic en el checkbox
        protected void btnConfirmarEstado_Click(object sender, EventArgs e)
        {
            // Verificamos que tengamos el ID y el nuevo estado en ViewState
            if (ViewState["IdAActualizar"] != null && ViewState["NuevoEstado"] != null)
            {
                // Obtenemos el ID de la especialidad y el nuevo estado
                int especialidadId = Convert.ToInt32(ViewState["IdAActualizar"]);
                bool nuevoEstado = Convert.ToBoolean(ViewState["NuevoEstado"]);

                try
                {
                    // Crear instancia de la capa de negocio y actualizar el estado
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
                    // En caso de error, mostramos mensaje de error
                    lblError.Text = "Error al actualizar el estado: " + ex.Message;
                    lblError.Visible = true;
                }
            }
        }

        // Si cancela, ocultamos el panel
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
            // Verificamos que el sender sea un Button
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            ViewState["IdAEliminar"] = id;

            // Mostramos mensaje de confirmación
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

        // Al hacer clic en "Editar", cargamos los datos de la especialidad en el panel de edición
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            // Verificamos que el sender sea un Button
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            // Guardamos el ID en ViewState para usarlo al guardar los cambios
            EspecialidadNegocio negocio = new EspecialidadNegocio();
            dominio.Especialidad especialidad = negocio.obtenerEspecialidadPorId(id);

            // Verificamos que la especialidad no sea nula
            if (especialidad != null)
            {
                ViewState["IdAEditar"] = especialidad.Id;
                txtEditarDescripcion.Text = especialidad.Descripcion;

                pnlEditarEspecialidad.Visible = true;
                lblErrorEdicion.Visible = false;
                lblExitoEdicion.Visible = false;
            }
        }

        // Al hacer clic en "Guardar Edición", validamos la entrada y actualizamos la especialidad
        protected void btnGuardarEdicion_Click(object sender, EventArgs e)
        {
            if (ViewState["IdAEditar"] != null)
            {
                // Verificamos que el ID esté en ViewState
                int id = Convert.ToInt32(ViewState["IdAEditar"]);
                string nuevaDescripcion = txtEditarDescripcion.Text.Trim();

                // Validamos que la descripción no esté vacía
                if (string.IsNullOrEmpty(nuevaDescripcion))
                {
                    // Si la descripción está vacía, mostramos mensaje de error
                    lblExitoEdicion.Visible = false;
                    lblErrorEdicion.Text = "⚠️ La descripción no puede estar vacía.";
                    lblErrorEdicion.Visible = true;
                    return;
                }

                // Creamos una instancia de la capa de negocio
                EspecialidadNegocio negocio = new EspecialidadNegocio();

                // Validación de duplicado excluyendo el ID actual
                if (negocio.existeOtraEspecialidad(nuevaDescripcion, id))
                {
                    // Si ya existe otra especialidad con la misma descripción, mostramos mensaje de error
                    lblExitoEdicion.Visible = false;
                    lblErrorEdicion.Text = "⚠️ Ya existe otra especialidad con esa descripción.";
                    lblErrorEdicion.Visible = true;
                    return;
                }

                // Si la descripción es válida, modificamos la especialidad
                negocio.modificarEspecialidad(id, nuevaDescripcion);
                CargarEspecialidades();
                pnlEditarEspecialidad.Visible = false;
                ViewState["IdAEditar"] = null;

                // Mostramos mensaje de éxito
                lblErrorEdicion.Visible = false;
                lblExitoEdicion.Text = "✔️ Especialidad actualizada correctamente.";
                lblExitoEdicion.Visible = true;
            }
        }

        // Al hacer clic en "Cancelar Edición", ocultamos el panel de edición y limpiamos los campos
        protected void btnCancelarEdicion_Click(object sender, EventArgs e)
        {
            pnlEditarEspecialidad.Visible = false;
            ViewState["IdAEditar"] = null;
            txtEditarDescripcion.Text = string.Empty;
        }
    }
}