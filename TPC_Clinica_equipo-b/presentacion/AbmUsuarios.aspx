<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="AbmUsuarios.aspx.cs" Inherits="presentacion.AbmUsuarios" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main runat="server" class="container mt-5">
        <h2 class="mb-4">Agregar / Editar Usuario</h2>
        <div class="row mb-3">
            <div class="col">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col">
                <asp:Label ID="lblRol" runat="server" Text="Rol"></asp:Label>
                <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Médico" Value="1" />
                    <asp:ListItem Text="Recepcionista" Value="2" />
                </asp:DropDownList>
            </div>
        </div>
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" />
    </main>
</asp:Content>
