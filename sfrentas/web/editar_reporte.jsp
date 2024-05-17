<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <link rel="icon" type="image/x-icon" href="PresentacionAcosoZero/Informate/favicon.ico.jpg">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Editar Reporte</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarTogglerDemo03"
                aria-controls="navbarTogglerDemo03"
                aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>AcosoZer0Batiz</i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=Nuevo"
                            ><i class="fas fa-home"></i> Inicio<span
                                class="sr-only"
                                >(current)</span
                            ></a
                        >
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=carrito"
                            ><i class="fas fa-cart-plus"
                                >(<label style="color: darkorange"
                                    >${cont}</label
                                >)</i
                            >
                            Carrito</a
                        >
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./ReporteServlet?action=list"
                            >Reportes</a
                        >
                    </li>
                </ul>

                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a
                        style="color: white; cursor: pointer"
                        class="dropdown-toggle"
                        data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a
                    >
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"
                            ><img src="img/user.png" alt="60" height="60"
                        /></a>
                        <a class="dropdown-item" href="#">${user}</a>
                        <a
                            class="dropdown-item"
                            href="#"
                            data-toggle="modal"
                            data-target="#myModal"
                            >${correo}</a
                        >
                        <div class="dropdown-divider"></div>
                        <a
                            class="dropdown-item"
                            href="Controlador?accion=MisCompras"
                            >Mis Compras</a
                        >
                        <div class="dropdown-divider"></div>
                        <a
                            class="dropdown-item"
                            href="./Controlador?accion=Salir">
                            <i class="fas fa-arrow-right"> Salir</i></a
                        >
                    </div>
                </ul>
            </div>
        </nav>

        <div class="container1 mt-5">
            <div class="row">
                <div class="col1-sm1-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Editar Reporte</h3>
                        </div>
                        <div class="card-body">
                            <form
                                action="ReporteServlet?action=update"
                                method="POST">
                                <div class="form-group">
                                    <input
                                        class="form-control"
                                        type="hidden"
                                        name="idReporte"
                                        value="${param.idReporte}" />
                                    <label for="nombres">Nombres:</label>
                                    <input
                                        class="form-control"
                                        type="text"
                                        name="nombres"
                                        value="${reporte.nombres}"
                                        required />
                                </div>
                                <br />
                                <div class="form-group">
                                    <label for="descripcion"
                                        >Descripción:</label
                                    >
                                    <input
                                        class="form-control"
                                        type="text"
                                        name="descripcion"
                                        value="${reporte.descripcion}"
                                        required />
                                </div>
                                <br />
                                <div class="form-group">
                                    <label for="precio">Precio:</label>
                                    <input
                                        class="form-control"
                                        type="number"
                                        step="0.01"
                                        name="precio"
                                        value="${reporte.precio}"
                                        required />
                                </div>
                                <br />
                                <div class="form-group">
                                    <label for="cantreporte">Cantreporte:</label>
                                    <input
                                        class="form-control"
                                        type="number"
                                        name="cantreporte"
                                        value="${reporte.cantreporte}"
                                        required />
                                </div>
                                <br />
                                <div class="form-group">
                                    <label for="cantreporte">Imagen:</label>
                                    <input
                                        class="form-control"
                                        type="text"
                                        name="imagen"
                                        value="${reporte.imagen}"
                                        required />
                                </div>
                                <br />
                                <div class="form-group">
                                    <input
                                        class="btn btn-danger"
                                        type="submit"
                                        value="Actualizar" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/index.js" type="text/javascript"></script>
    </body>
</html>