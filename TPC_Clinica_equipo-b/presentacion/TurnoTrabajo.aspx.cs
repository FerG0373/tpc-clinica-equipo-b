using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace presentacion
{
    public partial class TurnosTrabajo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool validarFormulario()
        {
            // Ocultar mensajes de error al inicio
            lblErrorDiaSemana.Visible = false;
            lblErrorHoraInicio.Visible = false;
            lblErrorHoraFin.Visible = false;

            bool validacionExitosa = true;
            TimeSpan horaInicio = TimeSpan.Zero;
            TimeSpan horaFin = TimeSpan.Zero;

            // Validación Día de la semana (DropDownList)
            if (string.IsNullOrEmpty(ddlDiaSemana.SelectedValue))
            {
                lblErrorDiaSemana.Text = "⚠️ Debe seleccionar un día válido.";
                lblErrorDiaSemana.Visible = true;
                validacionExitosa = false;
            }

            // Validación Hora Inicio
            if (string.IsNullOrWhiteSpace(txtHoraInicio.Text))
            {
                lblErrorHoraInicio.Text = "⚠️ Debe ingresar la hora de inicio.";
                lblErrorHoraInicio.Visible = true;
                validacionExitosa = false;
            }
            else if (!TimeSpan.TryParse(txtHoraInicio.Text, out horaInicio))
            {
                lblErrorHoraInicio.Text = "⚠️ Formato de hora de inicio inválido.";
                lblErrorHoraInicio.Visible = true;
                validacionExitosa = false;
            }

            // Validación Hora Fin
            if (string.IsNullOrWhiteSpace(txtHoraFin.Text))
            {
                lblErrorHoraFin.Text = "⚠️ Debe ingresar la hora de fin.";
                lblErrorHoraFin.Visible = true;
                validacionExitosa = false;
            }
            else if (!TimeSpan.TryParse(txtHoraFin.Text, out horaFin))
            {
                lblErrorHoraFin.Text = "⚠️ Formato de hora de fin inválido.";
                lblErrorHoraFin.Visible = true;
                validacionExitosa = false;
            }

            // Validar que Hora Fin sea mayor que Hora Inicio
            // Solo si las validaciones anteriores fueron exitosas
            if (validacionExitosa && horaFin <= horaInicio)
            {
                lblErrorHoraFin.Text = "⚠️ La hora de fin debe ser mayor que la hora de inicio.";
                lblErrorHoraFin.Visible = true;
                validacionExitosa = false;
            }

            return validacionExitosa;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!validarFormulario())
            {
                // Si la validación falla, el método validarFormulario ya mostró los errores y sale del método.
                return;
            }

            try
            {
                TurnoTrabajo nuevo = new TurnoTrabajo();
                TurnoTrabajoNegocio negocio = new TurnoTrabajoNegocio();

                nuevo.DiaSemana = ddlDiaSemana.SelectedValue;
                nuevo.HoraInicio = TimeSpan.Parse(txtHoraInicio.Text);
                nuevo.HoraFin = TimeSpan.Parse(txtHoraFin.Text);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    negocio.Modificar(nuevo);
                }
                else
                {
                    negocio.Agregar(nuevo);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("TurnoTrabajoLista.aspx", false);
        }
    }
}