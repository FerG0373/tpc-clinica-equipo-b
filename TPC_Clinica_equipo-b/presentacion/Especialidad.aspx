<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Especialidad.aspx.cs" Inherits="presentacion.Especialidad" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Lista de Especialidades</h2>
                <div class="table-responsive">
                    <asp:GridView ID="dgvEspecialidades" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="Id"
                        EnableViewState="true"
                        CssClass="table table-bordered table-hover table-striped"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center">
                        <Columns>
                            <asp:BoundField HeaderText="Especialidad" DataField="Descripcion" />

                            <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />

                            <asp:TemplateField HeaderText="Borrar">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnEliminar"
                                        runat="server"
                                        CssClass="btn btn-sm"
                                        Text="🗑️"
                                        CommandArgument='<%# Eval("Id") %>'
                                        OnClick="btnEliminar_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:CheckBox
                                        ID="chkActivo"
                                        runat="server"
                                        Checked='<%# Eval("Activo") %>'
                                        AutoPostBack="true"
                                        OnCheckedChanged="chkActivo_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Panel ID="pnlConfirmarEliminacion" runat="server" Visible="false" CssClass="alert alert-warning mt-3">
                        <p>¿Estás seguro de que deseas eliminar esta especialidad?</p>
                        <asp:Button
                            ID="btnConfirmarEliminar"
                            runat="server"
                            Text="Sí, eliminar"
                            CssClass="btn btn-danger"
                            OnClick="btnConfirmarEliminar_Click" />
                        <asp:Button
                            ID="btnCancelarEliminar"
                            runat="server"
                            Text="Cancelar"
                            CssClass="btn btn-secondary"
                            OnClick="btnCancelarEliminar_Click" />
                    </asp:Panel>
                    <asp:Panel ID="pnlConfirmarEstado" runat="server" Visible="false" CssClass="alert alert-warning mt-3">
                        <asp:Label ID="lblConfirmarEstadoMensaje" runat="server" CssClass="mb-2 d-block"></asp:Label>
                        <asp:Button
                            ID="btnConfirmarEstado"
                            runat="server"
                            Text="Sí, Cambiar estado"
                            CssClass="btn btn-danger"
                            OnClick="btnConfirmarEstado_Click" />
                        <asp:Button
                            ID="btnCancelarEstado"
                            runat="server"
                            Text="Cancelar"
                            CssClass="btn btn-secondary"
                            OnClick="btnCancelarEstado_Click" />
                    </asp:Panel>
                </div>

                <h3 class="text-center mb-4">Agregar Especialidad</h3>

                <!-- Formulario -->
                <div class="mb-3">
                    <label for="txtEspecialidad" class="form-label">Nombre de la especialidad</label>
                    <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control" placeholder="Ej. Cardiología" />
                    <asp:Label ID="lblExito" runat="server" CssClass="text-success fw-bold" Visible="false"></asp:Label>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger mt-2 d-block" Visible="false"></asp:Label>
                </div>

                <!-- Botón Agregar -->
                <asp:LinkButton
                    ID="btnAgregarEspecialidad"
                    runat="server"
                    OnClick="btnAgregarEspecialidad_Click1"
                    CssClass="btn btn-success d-grid mb-3"
                    CausesValidation="false">
                    <i class="fas fa-calendar-plus me-2"></i>Agregar
                </asp:LinkButton>
            </div>
        </div>
</asp:Content>
