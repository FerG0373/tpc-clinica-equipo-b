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
                datos.setearConsulta("SELECT id, diaSemana, horaInicio, horaFin, activo FROM TurnoTrabajo");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    TurnoTrabajo aux = new TurnoTrabajo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];
                    aux.Activo = (bool)datos.Lector["Activo"];

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

        public List<(int MedicoId, TurnoTrabajo TurnoTrabajo)> listarTurnosDeTrabajoPorMedicos()
        {
            AccesoDatos datos = new AccesoDatos();
            List<(int MedicoId, TurnoTrabajo TurnoTrabajo)> listaTurnosDeTrabajoPorMedicos = new List<(int, TurnoTrabajo)>();

            try
            {
                datos.setearConsulta("SP_turnoTrabajoListarPorMedicos");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    TurnoTrabajo aux = new TurnoTrabajo();
                    int MedicoId = (int)datos.Lector["Medico_Id"];
                    aux.Id = (int)datos.Lector["Id"];
                    aux.DiaSemana = (string)datos.Lector["DiaSemana"];
                    aux.HoraInicio = (TimeSpan)datos.Lector["HoraInicio"];
                    aux.HoraFin = (TimeSpan)datos.Lector["HoraFin"];

                    listaTurnosDeTrabajoPorMedicos.Add((MedicoId,aux));
                }
                return listaTurnosDeTrabajoPorMedicos;
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
