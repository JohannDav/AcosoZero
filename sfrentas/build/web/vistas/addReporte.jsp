
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/Logo.png" type="image/x-icon">
      <link rel="icon" type="image/x-icon" href="PresentacionAcosoZero/Informate/favicon.ico.jpg">
        <title>Agregar</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>AcosoZer0Batiz</i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=home"><i class="fas fa-home"></i> Inicio<span class="sr-only">(current)</span></a>
                    </li>                   
                    <li class="nav-item">
                        <a class="nav-link" href="./Controlador?accion=carrito"><i class="fas fa-cart-plus">(<label style="color: darkorange">${cont}</label>)</i> Carrito</a>
                    </li>                     

                </ul>                                           
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="../img/user.png" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#">${user}</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>
        <div class="container1 mt-5">            
            <div class="row">
                <div class="col1-sm1-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Agregar Reporte</h3>
                        </div>                
                        <div class="card-body">
                            <form action="Controlador?accion=GuardarReporte" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>ID o clave:</label>
                                    <input type="text" name="txtId" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Nombre:</label>
                                    <input type="text" name="txtNombre" class="form-control">
                                </div>                     
                                <div class="form-group">
                                    <label>Descripcion</label>
                                    <textarea name="txtDescripcion" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Precio</label>
                                    <input type="text" name="txtPrecio" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Stock</label>
                                    <input type="text" name="txtStock" class="form-control">
                                </div>
                                <div class="form-group">
                                <label>Imagen:</label>
                                    <input type="text" name="imagen" class="form-control"/>
                                </div>  
                                <div class="form-group">
                                    <label>Fecha del suceso</label>
                                    <textarea name="txtFechasuceso" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-danger" name="accion" value="GuardarReporte">Guardar</button>
                                </div>
                            </form>
                        </div>               
                    </div>
                </div> 
                <div class="col-sm-7">
                    <table class="table1 table1-responsive">
                        <thead class="">
                            <tr class="text-center">
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>DESCRIPCION</th>                               
                                <th>PRECIO</th>
                                <th>STOCK</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${reportes}">
                                <tr class="text-center">
                                    <td>${p.getId()}</td>
                                    <td>${p.getNombres()}
                                    </td>
                                    <td>${p.getDescripcion()}</td>                                    
                                    <td>${p.getPrecio()}</td>
                                    <td>${p.getStock()}</td>
                                    <td class="d-flex">
                                        <a href="#" class="btn1 btn1-warning">Editar</a>
                                        <a href="#" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>                           
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
  </body>
</html>
