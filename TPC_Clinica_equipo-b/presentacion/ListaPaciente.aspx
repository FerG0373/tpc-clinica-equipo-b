<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaPaciente.aspx.cs" Inherits="presentacion.Pacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista Pacientes</h1>
        <div class="table-responsive">
            <asp:GridView runat="server" ID="dgvPacientes"
                AutoGenerateColumns="false"
                CssClass="table table-bordered table-hover table-striped"
                DataKeyNmaes="Id"
                HeaderStyle-CssClass="text-center table-primary"
                RowStyle-CssClass="text-center">
                <Columns>

                    <asp:BoundField HeaderText="DNI" DataField="DNI" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                    <asp:BoundField
                        HeaderText="Fecha Nacimiento"
                        DataField="FechaNacimiento"
                        DataFormatString="{0:dd/MM/yyyy}"
                        HtmlEncode="false" />
                    <asp:BoundField HeaderText="Sexo" DataField="Sexo" />
                    <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:BoundField HeaderText="Historial Clinico" DataField="HistorialClinico" />
                    <asp:BoundField HeaderText="Tipo de Cobertura" DataField="TipoCobertura" />

                    <%-- Boton Editar --%>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:Button
                                ID="btnEditar"
                                runat="server"
                                Text="📝"
                                CssClass="btn btn-sm"
                                PostBackUrl='<%# Eval("Dni", "~/EditarPaciente.aspx?dni={0}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Checkbox Estado --%>
                    <asp:TemplateField HeaderText="Activo">
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
            <asp:Panel ID="pnlConfirmarEstado" runat="server" CssClass="alert alert-warning mt-3" Visible="false">
                <asp:Label ID="lblConfirmacionEstado" runat="server" />
                <div class="mt-2">
                    <asp:Button 
                        ID="btnConfirmarEstado" 
                        runat="server" 
                        Text="Sí, confirmar" 
                        CssClass="btn btn-success btn-sm"
                        OnClick="btnConfirmarEstado_Click" />
                    <asp:Button 
                        ID="btnCancelarEstado" 
                        runat="server" 
                        Text="Cancelar" 
                        CssClass="btn btn-secondary btn-sm"
                        OnClick="btnCancelarEstado_Click" />
                </div>
            </asp:Panel>
            <div class="text-center mt-5">
                <a href="FormularioPaciente.aspx" class="btn btn-success btn-lg px-4 mb-4">+ Agregar Paciente
                </a>
            </div>
        </div>
    </div>
</asp:Content>
