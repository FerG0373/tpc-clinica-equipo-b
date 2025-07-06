<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaMedico.aspx.cs" Inherits="presentacion.ScrMedico" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Médicos</h1>
        <div class="table-responsive">
            <asp:GridView runat="server" ID="dgvMedicos" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged"
                CssClass="table table-bordered table-hover table-striped"
                HeaderStyle-CssClass="text-center table-primary"
                RowStyle-CssClass="text-center">
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
                    <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />
                    <asp:CommandField HeaderText="Borrar" ShowSelectButton="true" SelectText="🗑️" />
                </Columns>
            </asp:GridView>
            <div class="text-center mt-5">
                <a href="FormularioMedico.aspx" class="btn btn-success btn-lg px-4">
                    🞤 Agregar Médico
                </a>
            </div>
        </div>
    </div>
</asp:Content>
