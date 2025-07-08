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
                if (!IsPostBack)
                {
                    ddlEspecialidad.DataSource = especialidadNegocio.listarEspecialidades();
                    ddlEspecialidad.DataTextField = "descripcion";
                    ddlEspecialidad.DataValueField = "id";
                    ddlEspecialidad.DataBind();

                    ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
                    btnQuitarEspecialidad.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlEspecialidad.SelectedValue == "0")
                {
                    lblError.Text = "⚠️ Debe seleccionar una especialidad.";
                    lblError.Visible = true;
                    return;
                }

                lblError.Visible = false;

                Medico nuevo = new Medico();
                MedicoNegocio negocio = new MedicoNegocio();

                nuevo.Dni = txtDni.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Apellido = txtApellido.Text;
                nuevo.Matricula = txtMatricula.Text;
                nuevo.Email = txtEmail.Text;
                nuevo.Pass = txtPassword.Text;

                nuevo.Especialidades = new List<dominio.Especialidad>();
                foreach(ListItem item in lstbEspecialidadesSeleccionadas.Items)
                {
                    Especialidad esp = new Especialidad();
                    esp.Id = int.Parse(item.Value);
                    esp.Descripcion = item.Text;
                    nuevo.Especialidades.Add(esp);
                }

                negocio.agregarMedico(nuevo);
                Response.Redirect("ListaMedio.aspx", false);
            }
            catch (Exception ex)
            {
                lblError.Text = "❌ Error al guardar el médico: " + ex.Message;
                lblError.Visible = true;
            }
            
        }

        protected void btnAgregarEspecialidad_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            int id = int.Parse(ddlEspecialidad.SelectedValue);  // Ácá necesito parsearlo a entero porque el valor seleccionado viene como string.
            string texto = ddlEspecialidad.SelectedItem.Text;  // Y acá obtengo el texto visible que se usa para mostrarlo en el ListBox.

            if (id == 0)
            {
                lblError.Text = "⚠️ Debe seleccionar una especialidad.";
                lblError.Visible = true;
                return;
            }

            // Evitar duplicados.
            foreach(ListItem item in lstbEspecialidadesSeleccionadas.Items)
            {
                if(item.Value == id.ToString())  // id.ToString() porque item.Value es viene en string.
                {
                    lblError.Text = "⚠️ Esa especialidad ya fue agregada.";
                    lblError.Visible = true;
                    return;
                }
            }
            // Si no está duplicada, la agregás y ocultás el mensaje (si había)
            lstbEspecialidadesSeleccionadas.Items.Add(new ListItem(texto, id.ToString()));
            lblError.Visible = false;

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