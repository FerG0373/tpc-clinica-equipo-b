using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace presentacion
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            dgvMedico.DataSource = negocio.listar();
            dgvMedico.DataBind();
        }

        protected void btnAltaUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaUsuario.aspx");
        }
    }
}