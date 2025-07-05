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
                        <%# GetDescripcionEspecialidades(Eval("Especialidades"))%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="Activo" DataField="Activo" />
                <asp:CommandField HeaderText="" ShowSelectButton="true" SelectText="📝" />
                <asp:CommandField HeaderText="" ShowSelectButton="true" SelectText="🗑️" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
