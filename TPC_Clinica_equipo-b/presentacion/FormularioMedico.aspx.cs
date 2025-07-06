using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace presentacion
{
    public partial class FormularioMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
            try
            {
                if(!IsPostBack)
                {
                    ddlEspecialidad.DataSource = especialidadNegocio.listarEspecialidades();
                    ddlEspecialidad.DataValueField = "id";
                    ddlEspecialidad.DataTextField = "descripcion";
                    ddlEspecialidad.DataBind();

                    ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccionar --", "0"));
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}