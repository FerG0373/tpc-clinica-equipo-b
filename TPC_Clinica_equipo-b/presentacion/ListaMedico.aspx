<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaMedico.aspx.cs" Inherits="presentacion.ListaMedico" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Médicos</h1>
        <div class="table-responsive">
            <asp:Panel ID="panelExito" runat="server" CssClass="alert alert-success text-center" Visible="false" Style="opacity: 1;">
                <asp:Label ID="lblMensajeExito" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:GridView runat="server" ID="dgvMedicos" AutoGenerateColumns="false" DataKeyNames="Id"
                OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged"
                OnPageIndexChanging="dgvMedicos_PageIndexChanging"
                CssClass="table table-bordered table-hover table-striped"
                HeaderStyle-CssClass="text-center table-primary"
                RowStyle-CssClass="text-center"
                AllowPaging="True" PageSize="10">
                <Columns>
                    <asp:BoundField HeaderText="DNI" DataField="DNI" />
                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Matrícula" DataField="Matricula" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />

                    <asp:TemplateField HeaderText="Especialidad(es)">
                        <ItemTemplate>
                            <%# getDescripcionEspecialidades(Eval("Especialidades"))%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Activo">
                        <ItemTemplate>
                            <%# ((bool)Eval("Activo")) ? "<span class='text-success fw-bold'>🟢 SÍ</span>" : "<span class='text-danger fw-bold'>🔴 NO</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />
                    <asp:CommandField HeaderText="Borrar" ShowSelectButton="true" SelectText="🗑️" />
                </Columns>
            </asp:GridView>
            <div class="text-center mt-5">
                <a href="FormularioMedico.aspx" class="btn btn-success btn-lg px-4 mb-5">🞤 Agregar Médico
                </a>
            </div>
        </div>
    </div>
</asp:Content>
