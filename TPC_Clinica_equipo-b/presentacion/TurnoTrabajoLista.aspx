<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoTrabajoLista.aspx.cs" Inherits="presentacion.TurnoTrabajoLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
    <%--Título--%>
    <asp:Label ID="lblTurnoTrabajoLista" runat="server" Text="Turnos de Trabajo" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>
    <div class="table-responsive">
        <asp:Panel ID="panelExito" runat="server" CssClass="alert alert-success text-center" Visible="false" Style="opacity: 1;">
            <asp:Label ID="lblMensajeExito" runat="server" Text=""></asp:Label>
        </asp:Panel>
        <asp:UpdatePanel ID="updTurnoTrabajoLista" runat="server">
            <ContentTemplate>
                <%--GridView--%>
                <asp:GridView runat="server" ID="dgvTurnoTrabajo" AutoGenerateColumns="false" DataKeyNames="Id"
                    OnSelectedIndexChanged="dgvTurnoTrabajo_SelectedIndexChanged"
                    OnPageIndexChanging="dgvTurnoTrabajo_PageIndexChanging"
                    CssClass="table table-bordered table-hover table-striped"
                    HeaderStyle-CssClass="text-center table-primary"
                    RowStyle-CssClass="text-center"
                    AllowPaging="True" PageSize="10"
                    OnRowCommand="dgvTurnoTrabajo_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="Dia de la Semana" DataField="DiaSemana" />
                        <asp:BoundField HeaderText="Hora Inicio" DataField="HoraInicio" DataFormatString="{0:hh\:mm}"/>
                        <asp:BoundField HeaderText="Hora Fin" DataField="HoraFin" DataFormatString="{0:hh\:mm}"/>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%--Botón--%>
        <div class="text-center mt-5">
            <a href="TurnoTrabajo.aspx" class="btn btn-success btn-lg px-4 mb-5">🞤 Agregar Turno Trabajo</a>
        </div>
    </div>
</div>
</asp:Content>
