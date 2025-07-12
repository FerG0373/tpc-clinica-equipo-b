using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class EditarPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                chkActivo.Checked = true;
                string dni = Request.QueryString["dni"];
                if (!string.IsNullOrEmpty(dni))
                {
                    PacienteNegocio negocio = new PacienteNegocio();
                    dominio.Paciente paciente = negocio.buscarPorDni(dni);
                    if (paciente != null)
                    {
                        txtDni.Text = paciente.Dni;
                        txtNombre.Text = paciente.Nombre;
                        txtApellido.Text = paciente.Apellido;
                        txtFechaNacimiento.Text = paciente.FechaNacimiento?.ToString("dd-MM-yyyy");
                        ddlSexo.SelectedValue = paciente.Sexo;
                        txtTelefono.Text = paciente.Telefono;
                        txtEmail.Text = paciente.Email;
                        txtTipoCobertura.Text = paciente.TipoCobertura;
                        txtHistorialClinico.Text = paciente.HistorialClinico;
                        chkActivo.Checked = paciente.Activo;
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Resetear errores
            lblNombreError.Visible = false;
            lblApellidoError.Visible = false;
            lblFechaError.Visible = false;
            lblEmailError.Visible = false;
            lblErrorEditarPacienteGeneral.Visible = false;
            lblExitoEditarPaciente.Visible = false;

            bool hayErrores = false;

            // Validaciones manuales
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                lblNombreError.Text = "⚠ El nombre es obligatorio.";
                lblNombreError.Visible = true;
                hayErrores = true;
            }

            if (string.IsNullOrWhiteSpace(txtApellido.Text))
            {
                lblApellidoError.Text = "⚠ El apellido es obligatorio.";
                lblApellidoError.Visible = true;
                hayErrores = true;
            }

            if (hayErrores)
            {
                lblErrorEditarPacienteGeneral.Text = "⚠ Revisá los campos marcados.";
                lblErrorEditarPacienteGeneral.Visible = true;
                return;
            }

            try
            {
                dominio.Paciente paciente = new dominio.Paciente
                {
                    Dni = txtDni.Text.Trim(),
                    Nombre = txtNombre.Text.Trim(),
                    Apellido = txtApellido.Text.Trim(),
                    FechaNacimiento = !string.IsNullOrEmpty(txtFechaNacimiento.Text)
                        ? Convert.ToDateTime(txtFechaNacimiento.Text)
                        : (DateTime?)null,
                    Sexo = ddlSexo.SelectedValue,
                    Telefono = txtTelefono.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    TipoCobertura = txtTipoCobertura.Text.Trim(),
                    HistorialClinico = txtHistorialClinico.Text.Trim(),
                    Activo = chkActivo.Checked
                };

                PacienteNegocio negocio = new PacienteNegocio();
                negocio.modificarPaciente(paciente);

                lblErrorEditarPacienteGeneral.Visible = false;
                lblExitoEditarPaciente.Text = "✔ Paciente actualizado correctamente.";
                lblExitoEditarPaciente.Visible = true;
            }
            catch (Exception ex)
            {
                lblExitoEditarPaciente.Visible = false;
                lblErrorEditarPacienteGeneral.Text = "⚠ Error al actualizar paciente: " + ex.Message;
                lblErrorEditarPacienteGeneral.Visible = true;
            }
        }
    }
}