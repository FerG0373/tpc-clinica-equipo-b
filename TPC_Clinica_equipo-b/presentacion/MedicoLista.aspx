<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="MedicoLista.aspx.cs" Inherits="presentacion.MedicoLista" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <%--Título--%>
        <asp:Label ID="lblTituloListaMedicos" runat="server" Text="Lista de Médicos" CssClass="text-center mb-4 d-block fs-1 fw-semibold"></asp:Label>
        <div class="table-responsive">
            <asp:Panel ID="panelExito" runat="server" CssClass="alert alert-success text-center" Visible="false" Style="opacity: 1;">
                <asp:Label ID="lblMensajeExito" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:UpdatePanel ID="updListaMedicos" runat="server">
                <ContentTemplate>
                    <%--GridView--%>
                    <asp:GridView runat="server" ID="dgvMedicos" AutoGenerateColumns="false" DataKeyNames="Id"
                        OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged"
                        OnPageIndexChanging="dgvMedicos_PageIndexChanging"
                        CssClass="table table-bordered table-hover table-striped"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center"
                        AllowPaging="True" PageSize="10"
                        OnRowCommand="dgvMedicos_RowCommand">
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

                            <asp:TemplateField HeaderText="Turnos de Trabajo">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnVerTurnos" runat="server"
                                        CommandName="VerTurnos"
                                        CommandArgument='<%# Eval("Id") %>'
                                        Text="📅"
                                        ToolTip="Ver Turnos de Trabajo">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Activo">
                                <ItemTemplate>
                                    <%# ((bool)Eval("Activo")) ? "<span class='text-success fw-bold'>🟢 SÍ</span>" : "<span class='text-danger fw-bold'>🔴 NO</span>" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Botón para editar--%>
                            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />
                            <%--Botón para desactivar--%>
                            <asp:TemplateField HeaderText="Activar/Desactivar">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnAccion" runat="server"
                                        CommandName='<%# ((bool)Eval("Activo")) ? "DesactivarMedico" : "ActivarMedico" %>'
                                        CommandArgument='<%# Eval("PersonaId") %>'
                                        OnClientClick='<%# ((bool)Eval("Activo")) ? "return confirm(\"¿Está seguro que quiere DESACTIVAR este médico?\");" : "return confirm(\"¿Está seguro de que quiere ACTIVAR este médico?\");" %>'
                                        Style="text-decoration: none;">
                                        <%# ((bool)Eval("Activo")) ? "🗑️" : "🔄" %>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--Botón--%>
            <div class="text-center mt-5">
                <a href="MedicoFormulario.aspx" class="btn btn-success px-4 mb-5 me-4">🞤 Agregar Médico</a>
                <a href="Default.aspx" class="btn btn-warning px-4 mb-5">Atrás</a>
            </div>
        </div>
    </div>
</asp:Content>
