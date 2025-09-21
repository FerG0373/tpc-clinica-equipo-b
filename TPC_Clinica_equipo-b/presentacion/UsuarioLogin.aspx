<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="UsuarioLogin.aspx.cs" Inherits="presentacion.UsuarioLogin" %>

<asp:Content ID="LoginMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="login-box text-center">
            <h5 class="mb-4"><i class="bi bi-lock"></i>Iniciar Sesión</h5>
            <div class="mb-3 text-start">
                <label for="txtDni" class="form-label">DNI</label>
                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3 text-start">
                <label for="txtPass" class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" />
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="text-danger mt-2 d-block" Visible="false" />
            <%--BOTÓN--%>
            <div class="d-grid mb-2">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary mt-3 mb-3" OnClick="btnIngresar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
