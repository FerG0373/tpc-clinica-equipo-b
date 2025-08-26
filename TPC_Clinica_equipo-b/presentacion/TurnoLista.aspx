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
                        CssClass="table table-bordered table-hover text-center"
                        OnPageIndexChanging="dgvTurnos_PageIndexChanging"
                        AllowPaging="true" PageSize="8">
                        <Columns>
                            <asp:BoundField DataField="NumeroTurno" HeaderText="N° Turno" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:g}" />
                            <asp:BoundField DataField="Hora" HeaderText="Hora" />
                            <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente" />
                            <asp:BoundField DataField="NombreMedico" HeaderText="Médico" />
                            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                            <asp:BoundField DataField="EstadoTurno" HeaderText="Estado" />

                            <%-- Acciones --%>
                            <asp:TemplateField HeaderText="Ver">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnVer"
                                        runat="server"
                                        Text="👁"
                                        CommandName="Ver"
                                        CssClass="btn btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnEditar"
                                        runat="server"
                                        Text="✏️"
                                        CommandName="Editar"
                                        CssClass="btn btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Cancelar">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnCancelar"
                                        runat="server"
                                        Text="❌"
                                        CommandName="Cancelar"
                                        CssClass="btn btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>
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
