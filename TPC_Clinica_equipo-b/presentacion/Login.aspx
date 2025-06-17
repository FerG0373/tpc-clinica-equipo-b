<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="presentacion.Login" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="LoginMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/misestilos.css" rel="stylesheet" />
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
            <!-- formulario de login acá -->
            <div class="login-box text-center">
                <h5 class="mb-4"><i class="bi bi-lock"></i>Iniciar Sesión</h5>

                <form method="post">
                    <div class="mb-3 text-start">
                        <label for="email" class="form-label">Email o Usuario</label>
                        <input type="text" class="form-control" id="email" name="Email"  />
                    </div>

                    <div class="mb-3 text-start">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="Password"  />
                    </div>

                    <div class="d-grid mb-2">
                        <button type="submit" class="btn btn-primary">Ingresar</button>
                    </div>

                    <div class="mb-2">
                        <a href="/RecuperarClave" class="text-muted">¿Olvidaste tu contraseña?</a>
                    </div>

                    <hr />

                    <div class="d-grid">
                        <asp:Button ID="btnRegistro" class="btn btn-outline-primary w-100" OnClick="btnRegistro_Click" runat="server" Text="Registro" />
                    </div>

                    <div class="mt-2">
                        <a href="/Ayuda" class="text-muted">Ayuda</a>
                    </div>
                </form>
            </div>
    </div>

</asp:Content>
