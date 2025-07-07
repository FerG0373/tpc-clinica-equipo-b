using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class MedicoNegocio
    {
        public List<Medico> listarMedicos()
        {
            AccesoDatos datos = new AccesoDatos();
            EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();

            List<Medico> listaMedicos = new List<Medico>();
            var relacionEspecialidadMedico = negocioEspecialidad.listarEspecialidadesMedicos();

            try
            {
                datos.setearProcedimiento("SP_listarMedicos");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Matricula = (string)datos.Lector["Matricula"];
                    aux.Email = (string)datos.Lector["Email"];

                    aux.Especialidades = new List<Especialidad>();
                    foreach (var relacion in relacionEspecialidadMedico)
                    {
                        if (relacion.MedicoId == aux.Id)
                        {
                            aux.Especialidades.Add(relacion.Especialidad);
                        }
                    }

                    aux.Activo = (int)datos.Lector["Activo"];

                    listaMedicos.Add(aux);
                }
                return listaMedicos;
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

        public void agregarMedico(Medico medico)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_altaMedico");

                datos.setearParametro("@dni", medico.Dni);
                datos.setearParametro("@nombre", medico.Nombre);
                datos.setearParametro("@apellido", medico.Apellido);
                datos.setearParametro("@matricula", medico.Matricula);

                string especialidadesIds = string.Join(",", medico.Especialidades.Select(elemento => elemento.Id));
                datos.setearParametro("@especialidades", especialidadesIds);

                datos.setearParametro("@email", medico.Email);
                datos.setearParametro("pass", medico.Pass);

                datos.ejecutarAccion();
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
