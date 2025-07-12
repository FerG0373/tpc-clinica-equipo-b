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
    public partial class FormularioPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarPaciente_Click(object sender, EventArgs e)
        {
            lblErrorPaciente.Visible = false;
            lblExitoPaciente.Visible = false;

            try
            {
                // Validaciones básicas de campos obligatorios
                if (string.IsNullOrWhiteSpace(txtDni.Text) ||
                    string.IsNullOrWhiteSpace(txtNombre.Text) ||
                    string.IsNullOrWhiteSpace(txtApellido.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    lblErrorPaciente.Text = "⚠️ DNI, Nombre, Apellido  y Email son obligatorios.";
                    lblErrorPaciente.Visible = true;
                    return;
                }

                DateTime? fechaNacimiento = null; // Inicializa como null
                if (!string.IsNullOrWhiteSpace(txtFechaNacimiento.Text))
                {
                    if (DateTime.TryParse(txtFechaNacimiento.Text.Trim(), out DateTime fechaValida))
                    {
                        fechaNacimiento = fechaValida;
                    }
                    else
                    {
                        lblErrorPaciente.Text = "⚠️ La fecha de nacimiento no es válida.";
                        lblErrorPaciente.Visible = true;
                        return; // Sale del método si la fecha tiene un formato incorrecto
                    }
                }

                dominio.Paciente nuevoPaciente = new dominio.Paciente
                {
                    Dni = txtDni.Text.Trim(),
                    Nombre = txtNombre.Text.Trim(),
                    Apellido = txtApellido.Text.Trim(),
                    FechaNacimiento = fechaNacimiento,
                    Sexo = ddlSexo.SelectedValue,
                    Telefono = txtTelefono.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    TipoCobertura = txtTipoCobertura.Text.Trim(),
                    Activo = true
                };

                PacienteNegocio negocio = new PacienteNegocio();

                // Verificar si el paciente ya existe por DNI
                if (negocio.existePacientePorDni(nuevoPaciente.Dni))
                {
                    lblErrorPaciente.Text = "⚠️ Ya existe un paciente con ese DNI.";
                    lblErrorPaciente.Visible = true;
                    return;
                }

                negocio.agregarPaciente(nuevoPaciente);
                lblExitoPaciente.Text = "✔ Paciente agregado correctamente.";
                lblExitoPaciente.Visible = true;

                LimpiarFormularioPaciente();
            }
            catch (Exception ex)
            {

                lblErrorPaciente.Text = "⚠️ Error al agregar paciente: " + ex.Message;
                lblErrorPaciente.Visible = true;
            }
        }

        private void LimpiarFormularioPaciente()
        {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtFechaNacimiento.Text = "";
            ddlSexo.SelectedIndex = 0;
            txtTelefono.Text = "";
            txtEmail.Text = "";
            txtTipoCobertura.Text = "";
        }
    }
}