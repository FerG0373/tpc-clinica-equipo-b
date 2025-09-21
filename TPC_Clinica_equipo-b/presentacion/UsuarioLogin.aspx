<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="UsuarioLogin.aspx.cs" Inherits="presentacion.UsuarioLogin" %>

<asp:Content ID="LoginMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="login-box text-center">
            <h5 class="mb-4"><i class="bi bi-lock"></i>Iniciar Sesión</h5>
            <div class="mb-3 text-start">
                <label for="txtUsuario" class="form-label">DNI</label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3 text-start">
                <label for="txtPassword" class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
            </div>
            <div class="d-grid mb-2">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary mt-3 mb-3" OnClick="btnIngresar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
