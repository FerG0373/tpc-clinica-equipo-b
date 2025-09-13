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
    public partial class TurnoListaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string turnoId = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (!string.IsNullOrEmpty(turnoId))
                {
                    try
                    {
                        btnEditar.PostBackUrl = "~/TurnoFormulario.aspx?id=" + turnoId;

                        TurnoNegocio negocio = new TurnoNegocio();
                        Turno seleccionado = (negocio.listarTurnos(turnoId))[0];

                        if (seleccionado != null)
                        {
                            lblFecha.Text = seleccionado.Fecha.ToShortDateString();
                            lblHora.Text = seleccionado.Hora.ToString(@"hh\:mm");
                            lblDNI.Text = seleccionado.Paciente.Dni;
                            lblPaciente.Text = seleccionado.Paciente.Apellido + ", " + seleccionado.Paciente.Nombre;
                            lblEspecialidad.Text = seleccionado.Especialidad.Descripcion;
                            lblMedico.Text = seleccionado.Medico.Apellido + ", " + seleccionado.Medico.Nombre;
                            lblEstado.Text = seleccionado.Estado;
                            lblEstado.CssClass = GetEstadoCssClass(seleccionado.Estado);
                            lblMotivo.Text = seleccionado.Motivo;
                            lblObservaciones.Text = seleccionado.Observaciones;
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }                    
                }         
            }
        }

        protected string GetEstadoCssClass(object estado)
        {
            string estadoTexto = estado.ToString().Trim().ToLower();

            switch (estadoTexto)
            {
                case "nuevo":
                    return "fw-bold text-success"; // Verde y negrita.
                case "reprogramado":
                    return "fw-bold text-primary"; // Azul claro y negrita.
                case "cancelado":
                    return "fw-bold text-danger"; // Rojo y negrita.
                case "no asistio":
                case "cerrado":
                    return "fw-bold text-dark"; // Negro y negrita.
                default:
                    return "fw-bold"; // Negrita por defecto para cualquier otro caso.
            }
        }
    }
}