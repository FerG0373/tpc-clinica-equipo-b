<%@ Page Title="Turnos de trabajo del médico" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoTrabajoMedicoLista.aspx.cs" Inherits="presentacion.TurnoTrabajoMedicoLista" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <%--Título--%>
        <asp:Label ID="lblTurnoTrabajoMedico" runat="server" Text="👨‍⚕️👩‍⚕️ Turnos de Trabajo del Médico:" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>
        <div class="table-responsive">
            <asp:Panel ID="panelExito" runat="server" CssClass="alert alert-success text-center" Visible="false" Style="opacity: 1;">
                <asp:Label ID="lblMensajeExito" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:UpdatePanel ID="updTurnoTrabajoMedico" runat="server">
                <ContentTemplate>
                    <%--GridView--%>
                    <asp:GridView runat="server" ID="dgvTurnoTrabajoMedico" AutoGenerateColumns="false" DataKeyNames="Id"
                        CssClass="table table-bordered table-hover table-striped"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center"
                        AllowPaging="True" PageSize="10">
                        <Columns>
                            <asp:BoundField HeaderText="Dia" DataField="DiaSemana" />
                            <asp:BoundField HeaderText="Hora Inicio" DataField="HoraInicio" DataFormatString="{0:hh\:mm}" />
                            <asp:BoundField HeaderText="Hora Fin" DataField="HoraFin" DataFormatString="{0:hh\:mm}" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--Botón--%>
            <div class="text-center mt-5">
                <asp:Button ID="btnAsignar" runat="server" Text="🞤 Asignar" CssClass="btn btn-success px-4 me-4" OnClick="btnAsignar_Click" />
                <asp:Button ID="btnAtras" runat="server" Text="Atrás" CssClass="btn btn-warning px-4" OnClick="btnAtras_Click" />
            </div>
        </div>
    </div>
</asp:Content>
