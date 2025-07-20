<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="EspecialidadLista.aspx.cs" Inherits="presentacion.Especialidad" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Lista de Especialidades</h2>
                <div class="table-responsive">

                    <!--GridView de la Lista de Especialidades-->
                    <asp:GridView ID="dgvEspecialidades" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="Id"
                        EnableViewState="true"
                        CssClass="table table-bordered table-hover table-striped"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center">
                        <Columns>

                            <%--Descripción--%>
                            <asp:BoundField HeaderText="Especialidad" DataField="Descripcion" />

                            <%--Boton Editar--%>
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnEditar"
                                        runat="server"
                                        CssClass="btn btn-sm"
                                        Text="📝"
                                        CommandArgument='<%# Eval("Id") %>'
                                        OnClick="btnEditar_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Boton Borrar--%>
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

                            <%--Boton Estado--%>
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

                    <!--Panel de eliminación-->
                    <asp:Panel ID="pnlConfirmarEliminacion" runat="server" Visible="false" CssClass="alert alert-warning mt-3">
                        <p>¿Estás seguro de que deseas eliminar esta especialidad?</p>

                        <!--Boton Confirmar eliminación-->
                        <asp:Button
                            ID="btnConfirmarEliminar"
                            runat="server"
                            Text="Sí, eliminar"
                            CssClass="btn btn-danger"
                            OnClick="btnConfirmarEliminar_Click" />

                        <!--Boton Cancelar Eliminación-->
                        <asp:Button
                            ID="btnCancelarEliminar"
                            runat="server"
                            Text="Cancelar"
                            CssClass="btn btn-secondary"
                            OnClick="btnCancelarEliminar_Click" />
                    </asp:Panel>

                    <!--Panel Confirmar estado-->
                    <asp:Panel ID="pnlConfirmarEstado" runat="server" Visible="false" CssClass="alert alert-warning mt-3">
                        <asp:Label ID="lblConfirmarEstadoMensaje" runat="server" CssClass="mb-2 d-block"></asp:Label>

                        <!--Boton Confirmar estado-->
                        <asp:Button
                            ID="btnConfirmarEstado"
                            runat="server"
                            Text="Sí, Cambiar estado"
                            CssClass="btn btn-danger"
                            OnClick="btnConfirmarEstado_Click" />

                        <!--Boton Cancelar estado-->
                        <asp:Button
                            ID="btnCancelarEstado"
                            runat="server"
                            Text="Cancelar"
                            CssClass="btn btn-secondary"
                            OnClick="btnCancelarEstado_Click" />
                    </asp:Panel>

                    <!--Panel Editar estado-->
                    <asp:Panel ID="pnlEditarEspecialidad" runat="server" Visible="false" CssClass="mt-3 p-3 border rounded bg-light">
                        <asp:Label ID="lblEditarTitulo" runat="server" Text="Editar especialidad" CssClass="fw-bold d-block mb-2"></asp:Label>

                        <!--Text box de Editar-->
                        <asp:TextBox 
                            ID="txtEditarDescripcion" 
                            runat="server" 
                            ValidationGroup="GrupoEditar" 
                            CssClass="form-control mb-2" />

                        <!--Label Validación de Exito-->
                        <asp:Label 
                            ID="lblExitoEdicion" 
                            runat="server" 
                            CssClass="text-success fw-bold" 
                            Visible="false">
                        </asp:Label>

                        <!--Label Validación de Error-->
                        <asp:Label 
                            ID="lblErrorEdicion" 
                            runat="server" 
                            CssClass="text-danger fw-bold" 
                            Visible="false">
                        </asp:Label>

                        <div class="d-flex gap-2 mt-2">
                            <!--Boton Guardar edición-->
                            <asp:Button
                                ID="btnGuardarEdicion"
                                runat="server"
                                Text="Guardar cambios"
                                CssClass="btn btn-success me-2"
                                ValidationGroup="GrupoEditar"
                                OnClick="btnGuardarEdicion_Click" />

                            <!--Boton Cancelar edición-->
                            <asp:Button
                                ID="btnCancelarEdicion"
                                runat="server"
                                Text="Cancelar"
                                CssClass="btn btn-secondary"
                                OnClick="btnCancelarEdicion_Click" />
                        </div>
                    </asp:Panel>
                </div>

                <h3 class="text-center mb-4 mt-4">Agregar Especialidad</h3>

                <!-- Formulario -->
                <div class="mb-3">
                    <label for="txtEspecialidad" class="form-label">Nombre de la especialidad</label>

                    <asp:TextBox 
                        ID="txtEspecialidad" 
                        runat="server" 
                        CssClass="form-control" 
                        ValidationGroup="GrupoAgregar" 
                        placeholder="Ej. Cardiología" />

                    <asp:Label ID="lblExito" runat="server" CssClass="text-success fw-bold" Visible="false"></asp:Label>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger mt-2 d-block" Visible="false"></asp:Label>
                </div>

                <!-- Botón Agregar -->
                <asp:LinkButton
                    ID="btnAgregarEspecialidad"
                    runat="server"
                    OnClick="btnAgregarEspecialidad_Click1"
                    CssClass="btn btn-success d-grid mb-3"
                    ValidationGroup="GrupoAgregar"
                    CausesValidation="false">
                    <i class="fas fa-calendar-plus me-2"></i>Agregar
                </asp:LinkButton>
            </div>
        </div>
</asp:Content>
