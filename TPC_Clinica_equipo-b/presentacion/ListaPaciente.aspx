<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ListaPaciente.aspx.cs" Inherits="presentacion.Pacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista Pacientes</h1>
        <div class="table-responsive">

            <asp:UpdatePanel ID="updPacientes" runat="server">
                <ContentTemplate>

                    <asp:Panel ID="pnlFiltroAvanzado" runat="server" CssClass="mb-4">
                        <div class="row g-3">

                            <div class="col-md-3">
                                <label>Filtro:</label>
                                <asp:TextBox
                                    ID="txtFiltroRapido"
                                    runat="server"
                                    CssClass="form-control"
                                    AutoPostBack="true"
                                    OnTextChanged="txtFiltroRapido_TextChanged"
                                    placeholder="Buscar... " />
                            </div>

                            <div class="col-md-2">
                                <label>Sexo:</label>
                                <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Todos" Value="" />
                                    <asp:ListItem Text="Masculino" Value="Masculino" />
                                    <asp:ListItem Text="Femenino" Value="Femenino" />
                                    <asp:ListItem Text="No especificado" Value="No especificado" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-2">
                                <label>Cobertura:</label>
                                <asp:DropDownList ID="ddlCobertura" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Todas" Value="" />
                                    <asp:ListItem Text="Obra Social" Value="Obra Social" />
                                    <asp:ListItem Text="Sin cobertura" Value="Sin cobertura" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-2">
                                <label>Actividad:</label>
                                <asp:DropDownList ID="ddlActivo" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Todos" Value="" />
                                    <asp:ListItem Text="Activos" Value="true" />
                                    <asp:ListItem Text="Inactivos" Value="false" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-2">
                                <label></label>
                                <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary w-100" Text="Filtrar" OnClick="btnFiltrar_Click" />
                            </div>
                            <div class="col-md-1">
                                <label></label>
                                <asp:Button ID="btnLimpiar" runat="server" CssClass="btn btn-outline-secondary w-100" Text="Limpiar" OnClick="btnLimpiar_Click" />
                            </div>

                        </div>
                    </asp:Panel>
                    <asp:GridView runat="server" ID="dgvPacientes"
                        AutoGenerateColumns="false"
                        CssClass="table table-bordered table-hover table-striped"
                        DataKeyNames="Id"
                        HeaderStyle-CssClass="text-center table-primary"
                        RowStyle-CssClass="text-center"
                        AllowPaging="true"
                        PageSize="8"
                        OnPageIndexChanging="dgvPacientes_PageIndexChanging">
                        <Columns>

                            <asp:BoundField HeaderText="DNI" DataField="DNI" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                            <asp:BoundField
                                HeaderText="Fecha Nacimiento"
                                DataField="FechaNacimiento"
                                DataFormatString="{0:dd/MM/yyyy}"
                                HtmlEncode="false"
                                Visible="false" />
                            <asp:BoundField HeaderText="Sexo" DataField="Sexo" />
                            <asp:BoundField HeaderText="Telefono" DataField="Telefono" Visible="false"/>
                            <asp:BoundField HeaderText="Email" DataField="Email" Visible="false" />
                            <asp:BoundField HeaderText="Historial Clinico" DataField="HistorialClinico" Visible="false" />
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

                            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />

                            <%--<%-- Checkbox Estado -->
                    <asp:TemplateField HeaderText="Activo">
                        <ItemTemplate>
                            <asp:CheckBox
                                ID="chkActivo"
                                runat="server"
                                Checked='<%# Eval("Activo") %>'
                                AutoPostBack="true"
                                OnCheckedChanged="chkActivo_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Ver">
                                <ItemTemplate>
                                    <asp:Button 
                                        ID="btnVer" 
                                        runat="server" 
                                        CommandName="Ver"
                                        Text="🔍"
                                        CssClass="btn btn-sm"
                                        CommandArgument='<%# Eval("Dni") %>' 
                                        OnClick="btnVer_Click"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <%--<asp:Panel ID="pnlConfirmarEstado" runat="server" CssClass="alert alert-warning mt-3" Visible="false">
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
                <asp:Label ID="lblErrorEstadoPaciente" runat="server" CssClass="text-danger" Visible="false" />
                <asp:Label ID="lblExitoEstadoPaciente" runat="server" CssClass="text-success" Visible="false" />
            </asp:Panel>--%>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="text-center mt-5">
                <a href="FormularioPaciente.aspx" class="btn btn-success btn-lg px-4 mb-4">+ Agregar Paciente
                </a>
            </div>
        </div>
    </div>
</asp:Content>
