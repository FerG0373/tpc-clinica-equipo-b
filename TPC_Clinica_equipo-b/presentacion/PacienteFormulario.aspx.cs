using dominio;
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
            if (Session["usuario"] == null)
            {
                Response.Redirect("UsuarioLogin.aspx", false);
            }
            else
            {
                Usuario logueado = (Usuario)Session["usuario"];  // Obtener el objeto del usuario y verificar su perfil.
                if (logueado.TipoUsuario != "Administrador" && logueado.TipoUsuario != "Recepcionista")
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
        }

        protected void btnGuardarPaciente_Click(object sender, EventArgs e)
        {
            // Resetear mensajes de error y éxito
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

                // Crear una nueva instancia de Paciente
                dominio.Paciente nuevoPaciente = new dominio.Paciente
                {
                    // Asignar los valores del formulario al nuevo paciente
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

                // Crear una instancia de PacienteNegocio para manejar la lógica de negocio
                PacienteNegocio negocio = new PacienteNegocio();

                // Verificar si el paciente ya existe por DNI
                if (negocio.existePacientePorDni(nuevoPaciente.Dni))
                {
                    // Si ya existe, mostrar un mensaje de error
                    lblErrorPaciente.Text = "⚠️ Ya existe un paciente con ese DNI.";
                    lblErrorPaciente.Visible = true;
                    return;
                }

                // Si no existe, agregar el nuevo paciente
                negocio.agregarPaciente(nuevoPaciente);
                lblExitoPaciente.Text = "✔ Paciente agregado correctamente.";
                lblExitoPaciente.Visible = true;

                // Limpiar el formulario después de agregar el paciente
                LimpiarFormularioPaciente();
            }
            catch (Exception ex)
            {
                // Manejar cualquier error que ocurra durante el proceso
                lblErrorPaciente.Text = "⚠️ Error al agregar paciente: " + ex.Message;
                lblErrorPaciente.Visible = true;
            }
        }

        //Función para limpiar el formulario de paciente
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