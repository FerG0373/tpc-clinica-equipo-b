<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Especialidad.aspx.cs" Inherits="presentacion.Especialidad" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
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
                <asp:Button ID="btnAgregarEspecialidad" runat="server" Text="Agregar" Style="display: none;" />
                <div class="d-grid">
                    <button type="button" class="btn btn-success" onclick="document.getElementById('<%= btnAgregarEspecialidad.ClientID %>').click();">
                        <i class="fas fa-calendar-plus me-2"></i>Agregar
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
