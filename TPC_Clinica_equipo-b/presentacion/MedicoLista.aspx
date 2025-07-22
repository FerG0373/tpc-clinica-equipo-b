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

                    <asp:TemplateField HeaderText="Activo">
                        <ItemTemplate>
                            <%# ((bool)Eval("Activo")) ? "<span class='text-success fw-bold'>🟢 SÍ</span>" : "<span class='text-danger fw-bold'>🔴 NO</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--Botón para editar--%>
                    <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="📝" />
                    <%--Botón para desactivar--%>
                    <asp:TemplateField HeaderText="Desactivar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDesactivar" runat="server" CommandName="DesactivarMedico" CommandArgument='<%# Eval("Id") %>' Style="text-decoration: none;">🗑️</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <%--Botón--%>
            <div class="text-center mt-5">
                <a href="MedicoFormulario.aspx" class="btn btn-success btn-lg px-4 mb-5">🞤 Agregar Médico</a>
            </div>
        </div>
    </div>

    <%-- MODAL DE CONFIRMACIÓN (sin cambios, ya lo tienes bien) --%>
   <div class="modal fade" id="modalConfirmacionDesactivar" tabindex="-1" aria-labelledby="modalConfirmacionLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalConfirmacionLabel">Confirmar Desactivación</h5> <%-- Título más específico --%>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>
                    ¿Está seguro de que quiere **desactivar** este médico?
                </p>
                <p>Esta acción hará que el médico no pueda acceder al sistema.</p>
                <div class="form-check">
                    <asp:CheckBox ID="chkConfirmarDesactivacion" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkConfirmarDesactivacion">
                        Confirmo que deseo desactivar este médico.
                    </label>
                </div>
                <asp:Label ID="lblErrorModal" runat="server" Text="" CssClass="text-danger mt-2" Visible="false"></asp:Label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <%-- Asegúrate que el ID sea btnConfirmarDesactivar si ese es el nombre de tu método click --%>
                <asp:Button ID="btnConfirmarDesactivar" runat="server" Text="Desactivar" CssClass="btn btn-outline-danger" OnClick="btnConfirmarDesactivar_Click" />
                <asp:HiddenField ID="hfMedicoIdDesactivar" runat="server" />
            </div>
        </div>
    </div>
</div>

    <%-- SCRIPT PARA MOSTRAR EL MODAL (sin cambios) --%>
    <script>
        function mostrarMensajeDesactivar() {
            var myModal = new bootstrap.Modal(document.getElementById('modalConfirmacionDesactivar'));
            myModal.show();
        }
    </script>
</asp:Content>
