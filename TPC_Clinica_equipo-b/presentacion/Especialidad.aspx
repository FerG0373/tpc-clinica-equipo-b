<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Especialidad.aspx.cs" Inherits="presentacion.Especialidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h3 class="text-center mb-4">Agregar Especialidad</h3>

                <!-- Formulario -->
                <div class="mb-3">
                    <label for="txtEspecialidad" class="form-label">Nombre de la especialidad</label>
                    <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control" placeholder="Ej. Cardiología" />
                </div>

                <!-- Botón Agregar -->
                <asp:Button ID="btnAgregarEspecialidad" runat="server" Text="Agregar" Style="display: none;"  />
                <button type="button" class="custom-btn" onclick="document.getElementById('<%= btnAgregarEspecialidad.ClientID %>').click();">
                    <span class="icon-circle"><i class="fas fa-plus"></i></span>
                    <span class="btn-text">Agregar</span>
                </button>
            </div>
        </div>
    </div>
</asp:Content>
