<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoLista.aspx.cs" Inherits="presentacion.ListaTurno" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <%--Título--%>
        <asp:Label ID="lblTurnos" runat="server" Text="Lista de Turnos" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>
        <div class="table-responsive">
            <asp:Panel ID="panelExito" runat="server" CssClass="alert alert-success text-center" Visible="false" Style="opacity: 1;">
                <asp:Label ID="lblMensajeExito" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:UpdatePanel ID="updTurnos" runat="server">
                <ContentTemplate>
                    <%--GridView--%>
                    <asp:GridView runat="server" ID="dgvTurnos" AutoGenerateColumns="false" DataKeyNames="Id"
                        CssClass="table table-bordered table-hover table-striped" HeaderStyle-CssClass="text-center table-success" RowStyle-CssClass="text-center"
                        OnPageIndexChanging="dgvTurnos_PageIndexChanging"
                        AllowPaging="true" PageSize="8">
                        <Columns>
                            <asp:TemplateField HeaderText="Fecha">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Fecha", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hora">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Hora", "{0:hh\\:mm}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="DNI" DataField="Paciente.Dni" />
                            <asp:TemplateField HeaderText="Paciente">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Paciente.Apellido") + ", " + Eval("Paciente.Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Especialidad">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Especialidad.Descripcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Medico">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Medico.Apellido") + ", " + Eval("Medico.Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Estado" DataField="Estado" />
                            <asp:CommandField HeaderText="Ver" ShowSelectButton="true" SelectText="👁️" />
                            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✏️" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="text-center mt-5">
                <a href="TurnoFormulario.aspx" class="btn btn-success btn-lg px-4 mb-4">🗓️ Nuevo Turno</a>
            </div>
        </div>
    </div>
</asp:Content>
