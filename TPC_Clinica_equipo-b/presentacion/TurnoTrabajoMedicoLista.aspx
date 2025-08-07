<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoTrabajoMedicoLista.aspx.cs" Inherits="presentacion.TurnoTrabajoMedicoLista" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <%--Título--%>
        <asp:Label ID="lblTurnoTrabajoMedico" runat="server" Text="Turnos de Trabajo del Médico" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>
        <div class="table-responsive">
            <asp:Panel ID="panelExito" runat="server" CssClass="alert alert-success text-center" Visible="false" Style="opacity: 1;">
                <asp:Label ID="lblMensajeExito" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:UpdatePanel ID="updTurnoTrabajoMedico" runat="server">
                <contenttemplate>
                    <%--GridView--%>
                    <asp:GridView runat="server" ID="dgvTurnoTrabajoMedico" AutoGenerateColumns="false" DataKeyNames="Id"
                        OnSelectedIndexChanged="dgvTurnoTrabajoMedico_SelectedIndexChanged"
                        OnPageIndexChanging="dgvTurnoTrabajoMedico_PageIndexChanging"
                        CssClass="table table-bordered table-hover table-striped"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center"
                        AllowPaging="True" PageSize="10"
                        OnRowCommand="dgvTurnoTrabajoMedico_RowCommand">
                        <columns>
                            <asp:BoundField HeaderText="Dia" DataField="DiaSemana" />
                            <asp:BoundField HeaderText="Hora Inicio" DataField="HoraInicio" DataFormatString="{0:hh\:mm}" />
                            <asp:BoundField HeaderText="Hora Fin" DataField="HoraFin" DataFormatString="{0:hh\:mm}" />
                            <asp:TemplateField HeaderText="Activo">
                                <itemtemplate>
                                    <%# ((bool)Eval("Activo")) ? "<span class='text-success fw-bold'>🟢 SÍ</span>" : "<span class='text-danger fw-bold'>🔴 NO</span>" %>
                                </itemtemplate>
                            </asp:TemplateField>
                        </columns>
                    </asp:GridView>
                </contenttemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
