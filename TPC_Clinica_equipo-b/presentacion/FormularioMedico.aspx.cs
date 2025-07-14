using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace presentacion
{
    public partial class FormularioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

            try
            {
                // Configuración inicial del formulario (lista de médicos).
                if (!IsPostBack)
                {
                    ddlEspecialidad.DataSource = especialidadNegocio.listarEspecialidades();
                    ddlEspecialidad.DataTextField = "descripcion";
                    ddlEspecialidad.DataValueField = "id";
                    ddlEspecialidad.DataBind();

                    ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
                    btnQuitarEspecialidad.Visible = false;
                }

                // Configuración si estamos modificando el formulario de un médico.
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "")
                {
                    lblTituloFormularioMedico.Text = "Editar Médico";

                    MedicoNegocio negocio = new MedicoNegocio();
                    Medico seleccionado = (negocio.listarMedicos(id))[0];  // Es una lista, el método listarMedicos retorna una lista de médicos.

                    // Precargar todos los campos.
                    txtDni.Text = seleccionado.Dni;
                    txtNombre.Text = seleccionado.Nombre;
                    txtApellido.Text = seleccionado.Apellido;
                    txtMatricula.Text = seleccionado.Matricula;
                    txtEmail.Text = seleccionado.Email;
                    txtPassword.Text = seleccionado.Pass;

                    lstbEspecialidadesSeleccionadas.Items.Clear();

                    if (seleccionado.Especialidades != null && seleccionado.Especialidades.Any())
                    {
                        foreach (dominio.Especialidad esp in seleccionado.Especialidades)
                        {
                            // Agrega cada especialidad del médico como un nuevo item en el ListBox
                            // El Text sería la descripción de la especialidad (ej. "Ginecología")
                            // El Value sería el ID de la especialidad (ej. "1")
                            lstbEspecialidadesSeleccionadas.Items.Add(new ListItem(esp.Descripcion, esp.Id.ToString()));
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            lblErrorDni.Visible = false;
            lblErrorNombre.Visible = false;
            lblErrorApellido.Visible = false;
            lblErrorMatricula.Visible = false;
            lblErrorEspecialidad.Visible = false;
            lblErrorEmail.Visible = false;
            lblErrorPass.Visible = false;
            lblError.Visible = false;

            bool validacionExitosa = true;

            // Validación DNI.
            if (string.IsNullOrWhiteSpace(txtDni.Text))
            {
                lblErrorDni.Text = "⚠️ Debe ingresar el número del DNI.";
                lblErrorDni.Visible = true;
                validacionExitosa = false;
            }

            // Validación Nombre
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                lblErrorNombre.Text = "⚠️ Debe ingresar el nombre del médico.";
                lblErrorNombre.Visible = true;
                validacionExitosa = false;
            }

            // Validación Apellido.
            if (string.IsNullOrWhiteSpace(txtApellido.Text))
            {
                lblErrorApellido.Text = "⚠️ Debe ingresar el apellido del médico.";
                lblErrorApellido.Visible = true;
                validacionExitosa = false;
            }

            // Validación Matrícula.
            if (string.IsNullOrWhiteSpace(txtMatricula.Text))
            {
                lblErrorMatricula.Text = "⚠️ Debe ingresar la matrícula del médico.";
                lblErrorMatricula.Visible = true;
                validacionExitosa = false;
            }

            // Validación Especialidad.
            if (lstbEspecialidadesSeleccionadas.Items.Count == 0)
            {
                lblErrorEspecialidad.Text = "⚠️ Debe seleccionar al menos una especialidad.";
                lblErrorEspecialidad.Visible = true;
                validacionExitosa = false;
            }

            // Validación Email.
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblErrorEmail.Text = "⚠️ El email es obligatorio.";
                lblErrorEmail.Visible = true;
                validacionExitosa = false;
            }

            // Validación Contraseña.
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblErrorPass.Text = "⚠️ La contraseña no puede estar vacía.";
                lblErrorPass.Visible = true;
                validacionExitosa = false;
            }

            if (!validacionExitosa)
            {
                return;  // Detiene la ejecución del método y deja los mensajes de error visibles.
            }

            try
            {
                Medico nuevo = new Medico();
                MedicoNegocio negocio = new MedicoNegocio();

                // Asigna los valores a las propiedades del objeto Medico.
                nuevo.Dni = txtDni.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Apellido = txtApellido.Text;
                nuevo.Matricula = txtMatricula.Text;
                nuevo.Email = txtEmail.Text;
                nuevo.Pass = txtPassword.Text;
                nuevo.Especialidades = new List<dominio.Especialidad>();

                foreach(ListItem item in lstbEspecialidadesSeleccionadas.Items)
                {
                    dominio.Especialidad esp = new dominio.Especialidad();
                    esp.Id = int.Parse(item.Value);
                    esp.Descripcion = item.Text;
                    nuevo.Especialidades.Add(esp);
                }

                // Determina si es agregar o modificar médico (basado en la existencia de un ID).
                if (Request.QueryString["id"] != null)
                {
                    // Es edición.
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    // negocio.modificarMedico(nuevo);
                    Session["MensajeExito"] = "Médico modificado con éxito.";
                }
                else
                {
                    // Es agregar.
                    negocio.agregarMedico(nuevo);
                    Session["MensajeExito"] = "Médico agregado con éxito.";
                }
                
                Response.Redirect("ListaMedico.aspx", false);
            }
            catch (Exception ex)
            {
                //lblError.Text = "❌ Error al guardar el médico: " + ex.Message;
                //lblError.Visible = true;
                throw ex;
            }
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaMedico.aspx");
        }

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            lblErrorEspecialidad.Visible = false;

            int id = int.Parse(ddlEspecialidad.SelectedValue);  // Ácá necesito parsearlo a entero porque el valor seleccionado viene como string.
            string texto = ddlEspecialidad.SelectedItem.Text;  // Y acá obtengo el texto visible que se usa para mostrarlo en el ListBox.

            if (id == 0)
            {
                lblErrorEspecialidad.Text = "⚠️ Debe seleccionar una especialidad.";
                lblErrorEspecialidad.Visible = true;
                return;
            }

            // Evitar duplicados.
            foreach(ListItem item in lstbEspecialidadesSeleccionadas.Items)
            {
                if(item.Value == id.ToString())  // id.ToString() porque item.Value es viene en string.
                {
                    lblErrorEspecialidad.Text = "⚠️ Esa especialidad ya fue agregada.";
                    lblErrorEspecialidad.Visible = true;
                    return;
                }
            }
            // Si no está duplicada, la agregás y ocultás el mensaje (si había)
            lstbEspecialidadesSeleccionadas.Items.Add(new ListItem(texto, id.ToString()));
            lblErrorEspecialidad.Visible = false;

            btnQuitarEspecialidad.Visible = true;
            btnQuitarEspecialidad.Enabled = false;
        }

        protected void lstbEspecialidadesSeleccionadas_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Activar botón "Quitar" solo si hay algo seleccionado.
            btnQuitarEspecialidad.Enabled = lstbEspecialidadesSeleccionadas.SelectedIndex != -1;
        }

        protected void btnQuitarEspecialidad_Click(object sender, EventArgs e)
        {
            if (lstbEspecialidadesSeleccionadas.SelectedIndex != -1)
            {
                lstbEspecialidadesSeleccionadas.Items.RemoveAt(lstbEspecialidadesSeleccionadas.SelectedIndex);
            }
            // Mostrar u ocultar el botón si hay elementos.
            btnQuitarEspecialidad.Visible = lstbEspecialidadesSeleccionadas.Items.Count > 0;

            // Habilitar solo si hay un elemento seleccionado.
            btnQuitarEspecialidad.Enabled = lstbEspecialidadesSeleccionadas.SelectedIndex != -1;
        }
    }
}