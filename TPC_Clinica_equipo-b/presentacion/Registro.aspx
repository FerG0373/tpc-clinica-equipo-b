<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="presentacion.Registro" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4 shadow-sm" style="width: 100%; max-width: 400px;">
            <h3 class="text-center mb-4">Crear Cuenta</h3>

            <div class="form-group mb-3">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-user"></i>
                    </span>
                    <input type="text" class="form-control" placeholder="Nombre completo" />
                </div>
            </div>

            <div class="form-group mb-3">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-envelope"></i>
                    </span>
                    <input type="email" class="form-control" placeholder="Dirección de Email" />
                </div>
            </div>

            <div class="form-group mb-3">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-phone"></i>
                    </span>
                    <select class="form-select" style="max-width: 100px;">
                        <option selected>+971</option>
                        <option>+54</option>
                        <option>+387</option>
                        <option>+1</option>
                    </select>
                    <input type="text" class="form-control" placeholder="Numero de Telefono" />
                </div>
            </div>

            <div class="form-group mb-3">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-lock"></i>
                    </span>
                    <input type="password" class="form-control" placeholder="Crear constraseña" />
                </div>
            </div>

            <div class="form-group mb-4">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-lock"></i>
                    </span>
                    <input type="password" class="form-control" placeholder="Repetir constraseña" />
                </div>
            </div>

            <button class="btn btn-primary w-100">Crear Cuenta</button>
            <div class="text-center mt-2">
                <small>Tenes cuenta? <a href="#">Iniciar Sesion</a></small>
            </div>
        </div>
    </div>

</asp:Content>
