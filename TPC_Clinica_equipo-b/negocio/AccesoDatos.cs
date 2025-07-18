using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        private SqlTransaction transaccion;

        public SqlDataReader Lector
        {
            get { return lector; }
        }
        public SqlTransaction Transaccion
        {
            get { return transaccion; }
        }

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=Clinica_DB; integrated security=true;");
            comando = new SqlCommand();
        }

        public void setearConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
            comando.Parameters.Clear();
        }

        public void setearProcedimiento(string procedimiento)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = procedimiento;
            comando.Parameters.Clear();
        }

        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);  // Para parámetros comunes de entrada.
        }

        public void setearParametroSalida(SqlParameter parametro)
        {
            comando.Parameters.Add(parametro);  // Necesario para mayor control, como en el caso de parámetros de salida.
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;

            try
            {
                if (transaccion != null)
                {
                    // Ya fue abierta por iniciarTransaccion()
                    comando.Transaction = transaccion;
                }
                else if (conexion.State != System.Data.ConnectionState.Open)
                {
                    conexion.Open(); // Solo abrí si no está abierta
                }
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void iniciarTransaccion()
        {
            if (conexion.State != System.Data.ConnectionState.Open)
                conexion.Open();

            transaccion = conexion.BeginTransaction();
            comando.Transaction = transaccion;
        }

        public void confirmarTransaccion()
        {
            if (transaccion != null)
                transaccion.Commit();
        }

        public void cancelarTransaccion()
        {
            if (transaccion != null)
                transaccion.Rollback();
        }

        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();

            if (transaccion != null)
                transaccion.Dispose();

            conexion.Close();
        }

    }
}
