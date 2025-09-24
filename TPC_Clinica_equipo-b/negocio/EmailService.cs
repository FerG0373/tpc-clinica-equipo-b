using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace negocio
{
    public class EmailService
    {
        private SmtpClient server;
        private MailMessage email;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["emailOrigen"], ConfigurationManager.AppSettings["password"]);
            server.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["smtpSsl"]);
            server.Port = int.Parse(ConfigurationManager.AppSettings["smtpPort"]);
            server.Host = ConfigurationManager.AppSettings["smtpServer"];
        }

        public MailMessage armarCorreo(string emailDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@clinicamedica.com");
            email.To.Add(emailDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;

            return email;
        }

        public void enviarMail(MailMessage emailEnviar)
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
