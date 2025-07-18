<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaTurno.aspx.cs" Inherits="presentacion.ListaTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="text-center mt-5">Lista de Turnos</h1>
        <div class="table-responsive">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="updTurnos" runat="server">
                <ContentTemplate>
                    <asp:GridView
                        ID="dgvTurnos"
                        runat="server"
                        AutoGenerateColumns="false"
                        CssClass="table table-bordered table-hover text-center"
                        AllowPaging="true"
                        PageSize="8"
                        OnPageIndexChanging="dgvTurnos_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Hora" HeaderText="Hora" DataFormatString="{0:HH:mm}" />
                            <asp:BoundField DataField="MedicoNombre" HeaderText="Médico" />
                            <asp:BoundField DataField="PacienteNombre" HeaderText="Paciente" />
                            <asp:BoundField DataField="DNI" HeaderText="DNI" />

                            <%-- Estado con Badge --%>
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <%--<span class='<%# GetBadgeClass(Eval("Estado").ToString()) %>'>
                                        <%# Eval("Estado") %>
                                    </span>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%-- Acciones --%>
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnVer" runat="server" Text="👁" CommandName="Ver" CssClass="btn btn-info btn-sm" />
                                    <asp:Button ID="btnEditar" runat="server" Text="✏️" CommandName="Editar" CssClass="btn btn-warning btn-sm" />
                                    <asp:Button ID="btnCancelar" runat="server" Text="❌" CommandName="Cancelar" CssClass="btn btn-danger btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="text-center mt-5">
                <a href="FormularioTurno.aspx" class="btn btn-success btn-lg px-4 mb-4">➕🗓️ Nuevo Turno</a>
            </div>
        </div>
    </div>
</asp:Content>
