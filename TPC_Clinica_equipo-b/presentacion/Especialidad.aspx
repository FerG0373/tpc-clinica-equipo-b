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
                            <asp:CommandField HeaderText="Borrar" ShowSelectButton="true" SelectText="🗑️" />
                            <asp:TemplateField HeaderText="Activo">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkActivo" runat="server" Checked='<%# Eval("Activo") %>' AutoPostBack="true"
                                        OnCheckedChanged="chkActivo_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <h3 class="text-center mb-4">Agregar Especialidad</h3>

                <!-- Formulario -->
                <div class="mb-3">
                    <label for="txtEspecialidad" class="form-label">Nombre de la especialidad</label>
                    <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control" placeholder="Ej. Cardiología" />
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger mt-2 d-block"></asp:Label>
                </div>

                <!-- Botón Agregar -->
                <asp:Button ID="btnAgregarEspecialidad" runat="server" Text="Agregar" OnClick="btnAgregarEspecialidad_Click" Style="display: none;" />
                <div class="d-grid">
                    <button type="button" class="btn btn-success" onclick="document.getElementById('<%= btnAgregarEspecialidad.ClientID %>').click();">
                        <i class="fas fa-calendar-plus me-2"></i>Agregar
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
