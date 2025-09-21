<%@ Page Title="Asignación de turnos" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="TurnoTrabajoAsignar.aspx.cs" Inherits="presentacion.TurnoTrabajoAsignar" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <%-- Título --%>
        <asp:Label ID="lblTurnoTrabajoAsignar" runat="server" Text="Turnos de Trabajo a Asignar" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>

        <div class="table-responsive">
            <asp:UpdatePanel ID="updTurnoTrabajoAsignar" runat="server">
                <ContentTemplate>
                    <%-- GridView --%>
                    <asp:GridView runat="server" ID="dgvTurnoTrabajoAsignar" AutoGenerateColumns="false" DataKeyNames="Id"
                        CssClass="table table-bordered table-hover table-striped"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center"
                        AllowPaging="True" PageSize="10"
                        OnPageIndexChanging="dgvTurnoTrabajoAsignar_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="Día" DataField="DiaSemana" />
                            <asp:BoundField HeaderText="Hora Inicio" DataField="HoraInicio" DataFormatString="{0:hh\:mm}" />
                            <asp:BoundField HeaderText="Hora Fin" DataField="HoraFin" DataFormatString="{0:hh\:mm}" />
                            <asp:TemplateField HeaderText="Asignar">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkAsignar" runat="server" Checked='<%# Eval("Asignado") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            
            <%-- Botones Aceptar y Cancelar --%>
            <div class="text-center mt-5">
                <asp:Button ID="btnAceptar" runat="server" Text="💾 Aceptar" CssClass="btn btn-success px-4 me-4" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="✖ Cancelar" CssClass="btn btn-danger px-4" OnClick="btnCancelar_Click" />
            </div>
            
        </div>
    </div>
</asp:Content>