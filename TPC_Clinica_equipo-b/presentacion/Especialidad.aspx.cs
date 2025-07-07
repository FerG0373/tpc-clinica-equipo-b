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

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            string descripcion = txtEspecialidad.Text.Trim();
            if (!string.IsNullOrEmpty(descripcion))
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                try
                {
                    dominio.Especialidad nuevaEspecialidad = new dominio.Especialidad
                    {
                        Descripcion = descripcion
                    };
                    negocio.agregarEspecialidad(nuevaEspecialidad);
                    CargarEspecialidades();
                    txtEspecialidad.Text = string.Empty; // Limpiar el campo de texto
                }
                catch (Exception ex)
                {
                    lblError.Text = "⚠️ Error al agregar la especialidad: " + ex.Message;
                }
            }
            else
            {
                lblError.Text = "⚠️ La descripción no puede estar vacía.";
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
                    try
                    {
                        int especialidadId = Convert.ToInt32(dgvEspecialidades.DataKeys[row.RowIndex].Value);
                        bool nuevoEstado = chkActivo.Checked;

                        EspecialidadNegocio negocio = new EspecialidadNegocio();
                        negocio.actualizarEstado(especialidadId, nuevoEstado);

                        // Opcional: Recargar los datos si es necesario
                        // CargarEspecialidades();
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = $"Error al actualizar: {ex.Message}";
                        lblError.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "Índice de fila no válido. Recargando datos...";
                    lblError.Visible = true;
                    CargarEspecialidades();
                }
            }
        }
    }
}