using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class TurnoTrabajoNegocio
    {
        public List<TurnoTrabajo> listarTurnosDeTrabajo()
        {
            AccesoDatos datos = new AccesoDatos();
            List<TurnoTrabajo> listaTurnosDeTrabajo = new List<TurnoTrabajo>();

            try
            {
                datos.setearConsulta("SELECT id, diaSemana, horaInicio, horaFin FROM TurnoTrabajo");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    TurnoTrabajo aux = new TurnoTrabajo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];

                    listaTurnosDeTrabajo.Add(aux);
                }
                return listaTurnosDeTrabajo;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<(int MedicoId, TurnoTrabajo TurnoTrabajo)> listarTurnosDeTrabajoMedicos()
        {
            AccesoDatos datos = new AccesoDatos();
            List<(int MedicoId, TurnoTrabajo TurnoTrabajo)> listaTurnosDeTrabajoPorMedicos = new List<(int, TurnoTrabajo)>();

            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
