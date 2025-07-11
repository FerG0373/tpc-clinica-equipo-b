using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace presentacion
{
    public partial class ScrMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                MedicoNegocio negocio = new MedicoNegocio();
                dgvMedicos.DataSource = negocio.listarMedicos();
                dgvMedicos.DataBind();

                // Mostrar mensaje si existe.
                if(Session["MensajeExito"] != null)
                {
                    lblMensajeExito.Text = Session["MensajeExito"].ToString();
                    panelExito.Visible = true;
                    // Borra el mensaje de la sesión para que no vuelva a aparecer al recargar.
                    Session.Remove("MensajeExito");
                }
            }
        }            

        protected void dgvMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvMedicos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioMedico.aspx?id" + id);
        }

        public string getDescripcionEspecialidades(object especialidades)
        {
            var listaEspecialidades = especialidades as List<dominio.Especialidad>;
            if (listaEspecialidades == null || listaEspecialidades.Count == 0)
                return "Sin especialidades";

            return string.Join("; ", listaEspecialidades.Select(item => item.Descripcion));
        }
    }
}