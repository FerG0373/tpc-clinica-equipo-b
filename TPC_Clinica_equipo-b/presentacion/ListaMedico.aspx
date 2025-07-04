<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaMedico.aspx.cs" Inherits="presentacion.ScrMedico" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>Lista de Médicos</h1>
        <asp:GridView runat="server" ID="dgvMedicos" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="DNI" DataField="DNI" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:BoundField HeaderText="Matrícula" DataField="Matricula" />
                <asp:BoundField HeaderText="Email" DataField="Email" />

                <asp:TemplateField HeaderText="Especialidad(es)">
                    <ItemTemplate>
                        <asp:DropDownList runat="server" ID="ddlEspecialidades" CssClass="form-control"
                            DataSource='<%# Eval("Especialidades") %>'
                            DataTextField="Descripcion"
                            DataValueField="Id" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="Activo" DataField="Activo" />
                <asp:CommandField HeaderText="" ShowSelectButton="true" SelectText="📝" />
                <%--Espacio asignado para el botón de editar y eliminar--%>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
