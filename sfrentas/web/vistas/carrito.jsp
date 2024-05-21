<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <link rel="icon" type="image/x-icon" href="PresentacionAcosoZero/Informate/favicon.ico.jpg">
        <link href="css/OverallDesigns222.css" rel="stylesheet" type="text/css" />
        <link href="css/DiesenoAgregar222.css" rel="stylesheet" type="text/css" />
        <link href="css/btn_lista_reporte_edit_pdf_elim_table1.css" rel="stylesheet" type="text/css"/>
        <title>Agregar</title>
    </head>
    <body>
        <style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

* {
    margin: 0;
    padding: 0;
    outline: none;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

.container2 {
    border-radius: 10px;
    background: #fff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.container2 .text {
    text-align: center;
    font-size: 41px;
    font-weight: 600;
    font-family: 'Poppins', sans-serif;
    background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.container2 form {
    padding: 30px 0 0 0;
}

.container2 form .form-row {
    display: flex;
    margin: 32px 0;
}

form .form-row .input-data {
    width: 100%;
    height: 40px;
    margin: 0 20px;
    position: relative;
}

form .form-row .textarea {
    height: 70px;
}

.input-data input,
.textarea textarea {
    display: block;
    width: 100%;
    height: 100%;
    border: none;
    font-size: 17px;
    border-bottom: 2px solid rgba(0, 0, 0, 0.12);
}

.input-data input:focus ~ label,
.textarea textarea:focus ~ label,
.input-data input:valid ~ label,
.textarea textarea:valid ~ label {
    transform: translateY(-20px);
    font-size: 14px;
    color: #3498db;
}

.textarea textarea {
    resize: none;
    padding-top: 10px;
}

.input-data label {
    position: absolute;
    pointer-events: none;
    bottom: 10px;
    font-size: 16px;
    transition: all 0.3s ease;
}

.textarea label {
    width: 100%;
    bottom: 40px;
    background: #fff;
}

.input-data .underline {
    position: absolute;
    bottom: 0;
    height: 2px;
    width: 100%;
}

.input-data .underline:before {
    position: absolute;
    content: "";
    height: 2px;
    width: 100%;
    background: #3498db;
    transform: scaleX(0);
    transform-origin: center;
    transition: transform 0.3s ease;
}

.input-data input:focus ~ .underline:before,
.input-data input:valid ~ .underline:before,
.textarea textarea:focus ~ .underline:before,
.textarea textarea:valid ~ .underline:before {
    transform: scale(1);
}

.submit-btn .input-data {
    overflow: hidden;
    height: 45px !important;
    width: 25% !important;
}

.submit-btn .input-data .inner {
    height: 100%;
    width: 300%;
    position: absolute;
    left: -100%;
    background: -webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea);
    transition: all 0.4s;
}

.submit-btn .input-data:hover .inner {
    left: 0;
}

.submit-btn .input-data input {
    background: none;
    border: none;
    color: #fff;
    font-size: 17px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    position: relative;
    z-index: 2;
}

@media (max-width: 700px) {
    .container2 .text {
        font-size: 30px;
    }

    .container2 form {
        padding: 10px 0 0 0;
    }

    .container2 form .form-row {
        display: block;
    }

    form .form-row .input-data {
        margin: 35px 0 !important;
    }

    .submit-btn .input-data {
        width: 40% !important;
    }
}



.col-sm-7 {
    width: 40%;
}

a.btn,
a.btn1 {
    width: 150px;
    height: 50px;
    cursor: pointer;
    display: flex;
    align-items: center;
    background: red;
    border: none;
    border-radius: 5px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.15);
    background: #e62222;
    text-decoration: none;
    color: white;
    position: relative;
    overflow: hidden;
}

a.btn,
a.btn1,
a.btn span,
a.btn1 span {
    transition: 200ms;
}

a.btn .text,
a.btn1 .text {
    transform: translateX(15px);
    font-weight: bold;
}

a.btn .icon,
a.btn1 .icon {
    position: absolute;
    border-left: 1px solid #c41b1b;
    transform: translateX(110px);
    height: 40px;
    width: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
}

a.btn svg,
a.btn1 svg {
    width: 15px;
    fill: #eee;
}

a.btn:hover,
a.btn1:hover {
    background: #ff3636;
}

a.btn:hover .text,
a.btn1:hover .text {
    color: transparent;
}

a.btn:hover .icon,
a.btn1:hover .icon {
    width: 150px;
    border-left: none;
    transform: translateX(0);
}

a.btn1 {
    background: yellow;
    background: #f0ad4e; /* Color amarillo */
}

a.btn1:hover {
    background: #ffb72b; /* Color amarillo más claro en hover */
}

.horizontal-list {
    display: flex;
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.horizontal-list li {
    margin-right: 10px;
}

.table1 {
    width: 100%;
    margin: 0 10%;
    border-collapse: collapse;
}

.table1 th h1 {
    font-weight: bold;
    font-size: 1em;
    text-align: left;
    color: #185875;
}

.table1 td {
    font-weight: normal;
    font-size: 1em;
    padding-bottom: 2%;
    padding-top: 2%;
    padding-left: 2%;
    -webkit-box-shadow: 0 2px 2px -2px #0e1119;
    -moz-box-shadow: 0 2px 2px -2px #0e1119;
    box-shadow: 0 2px 2px -2px #0e1119;
}

.table1 tbody tr:nth-child(odd) {
    background-color: #323c50;
}

.table1 tbody tr:nth-child(even) {
    background-color: #2c3446;
}

.table1 th {
    background-color: #1f2739;
}

.table1 td:first-child {
    color: #fb667a;
    font-weight: normal;
    font-size: 1em;
    padding-bottom: 2%;
    padding-top: 2%;
    padding-left: 2%;
    -webkit-box-shadow: 0 2px 2px -2px #0e1119;
    -moz-box-shadow: 0 2px 2px -2px #0e1119;
    box-shadow: 0 2px 2px -2px #0e1119;
}

.table1 tr:hover {
    background-color: #464a52;
    -webkit-box-shadow: 0 6px 6px -6px #0e1119;
    -moz-box-shadow: 0 6px 6px -6px #0e1119;
    box-shadow: 0 6px 6px -6px #0e1119;
}

.table1 td:hover {
    background-color: #fff842;
    color: #403e10;
    font-weight: bold;
    box-shadow: #7f7c21 -1px 1px, #7f7c21 -2px 2px, #7f7c21 -3px 3px, #7f7c21 -4px 4px, #7f7c21 -5px 5px, #7f7c21 -6px 6px;
    transform: translate3d(6px, -6px, 0);
    transition-delay: 0s;
    transition-duration: 0.4s;
    transition-property: all;
    transition-timing-function: line;
}

.horizontal-list {
        text-align: center; /* Centra el contenido */

    list-style-type: none;
    padding: 0;
    margin: 0;
}

.horizontal-list li {
    display: inline-block;
    margin-right: 10px; /* Espacio entre botones */
}

.horizontal-list li:last-child {
    margin-right: 0; /* Eliminar margen derecho del último botón */}
.container1 {
    background: #0e1119;
    height: 50%; /* Altura del 50% de la ventana */
      width: 90%;
flex-direction: column; /* Alineación vertical */
    justify-content: center; /* Centrado vertical */
    align-items: center; /* Centrado horizontal */
    margin: 0 auto 50px auto; /* Centrado horizontal con 50px de margen inferior */
}

.container2 {
    display: inline-block;
    border: 2px solid yellow;
    max-width: 40%;
    width: 40%;
    margin-left:  3%; /* Ajustar el margen derecho */
    
    overflow-x: auto; /* Agregar barra de desplazamiento horizontal si es necesario */
}

.col-sm-7 {
    display: inline-block;
    border: 2px solid yellow;
    max-width: 50%;
    width: 55%;
    margin-right:3%; /* Ajustar el margen izquierdo */
    overflow-x: auto; /* Agregar barra de desplazamiento horizontal si es necesario */
}
* {
  margin: 0;
  box-sizing: border-box;
}

:root {
  font-size: 13px;
  font-family: "Source Sans Pro", sans-serif;
  line-height: 1.618;
  font-weight: 400;
}


a:hover {
  opacity: 0.8;
}

p {
  font-size: 1.2rem;
}

.small {
  font-size: 1rem;
  margin-top: 1em;
}

.container {
      margin: 0 10px; /* Espacio entre los contenedores */
 padding-top: 5%; /* Espacio adicional en la parte superior */
  max-width: 100%;
}

header {
  text-align: center;
  padding-bottom: 3rem;
}

h1 {
  font-size: 2.6rem;
  line-height: 1.2em;
  padding-bottom: 1rem;
  font-weight: 600;
}

svg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

circle {
  transform-origin: 50% 50%;
  transform: scale(0);
  transition: transform 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

text {
  font-size: 1.1rem;
  text-transform: uppercase;
  text-anchor: middle;
  letter-spacing: 1px;
  font-weight: 600;
}

.svg-text {
}
.svg-masked-text {
  fill: rgba(#fff, 1);
}

image {
  transform: scale(1.1);
  transform-origin: 50% 50%;
  transition: transform 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.items1 {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
}

.item1 {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  width: 300px;
  height: 200px;
  margin: 5px;
  cursor: pointer;
  border-radius: 2px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.02),
    inset 0 0px 0px 1px rgba(0, 0, 0, 0.07);
  transform: translateZ(0);
}

.item1:hover {
  circle,
  image {
    transform: scale(1);
  }
}





.items2 {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
}

.item2 {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  width: 300px;
  height: 200px;
  margin: 5px;
  cursor: pointer;
  border-radius: 2px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.02),
    inset 0 0px 0px 1px rgba(0, 0, 0, 0.07);
  transform: translateZ(0);
}

.item2:hover {
  circle,
  image {
    transform: scale(1);
  }
}





.items3 {
    background: #56d8e4;
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
}

.item3 {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  width: 300px;
  height: 200px;
  margin: 5px;
  cursor: pointer;
  border-radius: 2px;
  box-shadow: 0 5px 5px rgba(0, 0, 0, 0.02),
    inset 0 0px 0px 1px rgba(0, 0, 0, 0.07);
  transform: translateZ(0);
}

.item3:hover {
  circle,
  image {
    transform: scale(1);
  }
}

button {
  width: 12px;
  height: 12px;
  border: none;
  appearance: none;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.5);
  border-radius: 1px;

}

.options {
  position: absolute;
  top: 1rem;
  right: 1rem;
  button {
    margin-left: 0.5rem;
  }
}

.light {
  .svg-text {
    fill: rgba(#000, 0.1);
  }
}.contenedormenupagina {
  margin-top: 20px; /* Añade espacio en la parte superior del contenedor */
  display: flex;
  justify-content: center; /* Alinea los contenedores horizontalmente al centro */
}

</style>
<a class="navbar-brand" href="../index.jsp"> 
<a class="navbar-brand" href="index.jsp">
      <img src="SOFTUX/IMAGENES/LogoPaginaSinDetallePNG.png" alt="AcosoZer0Batiz">
      </a>
      <div class="dropdown-container">
         <ul class="navbars-nav btn-group my-2 my-lg-0" role="group">
            <a
               style="color: white; cursor: pointer"
               class="dropdown-toggle"
               data-toggle="dropdown">
            <i class="fas fa-user-tie"></i> ${logueo}
            </a>
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
                  <div class="contenedormenupagina">
                      
                      
<div class="container">
  <a href="./Controlador?accion=Nuevo">

    <main>
      <div class="items1">
        <!-- Ruby loop converted to HTML -->
        <div class="item1">
          <svg viewBox="0 0 300 200" preserveAspectRatio="xMidYMid slice">
            <defs>
              <clipPath id="clip-1">
                <circle cx="0" cy="0" r="150px" fill="#000"></circle>
              </clipPath>
            </defs>
            <text class="svg-text" x="50%" y="50%" dy=".3em">Inicio</text>
            <g clip-path="url(#clip-1)">
              <image xlink:href="https://th.bing.com/th/id/OIP.PT4l4YI8K-zxwRwWVpqstQAAAA?rs=1&pid=ImgDetMain" width="100%" height="100%" preserveAspectRatio="xMinYMin slice"></image>
              <text class="svg-masked-text" x="50%" y="50%" dy=".3em">Inicio</text>
            </g>
          </svg>
        </div>
        <!-- Repeat for other items -->
      </div>
    </main>
    <div class="options">
      <button class="dark"></button>
      <button class="light"></button>
    </div>
  </a>
</div>

<div class="container">
  <a href="./Controlador?accion=carrito">

    <main>
      <div class="items2">
        <!-- Ruby loop converted to HTML -->
        <div class="item2">
          <svg viewBox="0 0 300 200" preserveAspectRatio="xMidYMid slice">
            <defs>
              <clipPath id="clip-2">
                <circle cx="0" cy="0" r="150px" fill="#000"></circle>
              </clipPath>
            </defs>
            <text class="svg-text" x="50%" y="50%" dy=".3em">Informate</text>
            <g clip-path="url(#clip-2)">
              <image xlink:href="https://store-images.s-microsoft.com/image/apps.50670.13727851868390641.c9cc5f66-aff8-406c-af6b-440838730be0.d205e025-5444-4eb1-ae46-571ae6895928?q=90&w=480&h=270" width="100%" height="100%" preserveAspectRatio="xMinYMin slice"></image>
              <text class="svg-masked-text" x="50%" y="50%" dy=".3em">Informate</text>
            </g>
          </svg>
        </div>
        <!-- Repeat for other items -->
      </div>
    </main>
    <div class="options">
      <button class="dark"></button>
      <button class="light"></button>
    </div>
  </a>
</div>

               
<div class="container">
  <a href="./ReporteServlet?action=list">

    <main>
      <div class="items3">
        <!-- Ruby loop converted to HTML -->
        <div class="item3">
          <svg viewBox="0 0 300 200" preserveAspectRatio="xMidYMid slice">
            <defs>
              <clipPath id="clip-3">
                <circle cx="0" cy="0" r="150px" fill="#000"></circle>
              </clipPath>
            </defs>
            <text class="svg-text" x="50%" y="50%" dy=".3em">AcosoZer0Batiz</text>
            <g clip-path="url(#clip-3)">
              <image xlink:href="https://store-images.s-microsoft.com/image/apps.50670.13727851868390641.c9cc5f66-aff8-406c-af6b-440838730be0.d205e025-5444-4eb1-ae46-571ae6895928?q=90&w=480&h=270" width="100%" height="100%" preserveAspectRatio="xMinYMin slice"></image>
              <text class="svg-masked-text" x="50%" y="50%" dy=".3em">AcosoZer0Batiz</text>
            </g>
          </svg>
        </div>
        <!-- Repeat for other items -->
      </div>
    </main>
    <div class="options">
      <button class="dark"></button>
      <button class="light"></button>
    </div>
  </a>
</div>


                      
                  </div>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      
         <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">


            </ul>
         </div>
      </nav>
        <div class="container1 mt-5">
            <div class="d-flex">
                                            
            </div>                    
            <div class="row">             
                <div class="col-lg-9">                 
                    <table class="table">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th>Item</th>                               
                                <th>Articulo</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>Cantidad</th>                       
                                <th>Total</th>                       
                                <th>Acciones</th>                       
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${Carrito}"> 
                                <tr class="text-center tr">
                                    <td>${c.getItem()}</td>                                   
                                    <td>${c.getNombres()}
                                        <img src="${c.getImagen()}" width="130" height="110">
                                    </td>
                                    <td>${c.getDescripcion()}</td>
                                    <td>${c.getPrecioCompra()}</td>
                                    <td>        
                                        <input type="hidden" id="item1" value="${c.getIdReporte()}">
                                        <input type="number" min="1" max="10"  id="Cant" class=" form-control text-center" value="${c.getCantidad()}">
                                    </td>   
                                    <td>${c.getSubTotal()}</td>                           
                                    <td class="text-center">                                         
                                        <input type="hidden" id="item2" value="${c.getIdReporte()}">
                                        <a id="deleteItem" href="#" class="btn"><i class="fas fa-trash-alt"></i></a>                                            
                                    </td>                           
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                </div>
                <div class="col-lg-3">                  
                    <div class="card">
                        <div class="card-header">
                            Generar Compra
                        </div>
                   
                        <div class="card-footer">
                            <a href="Controlador?accion=GenerarCompra" class="btn btn-danger btn-block">Numero total de reporte</a>
                            <a href="#" data-toggle="modal" data-target="#myModalPago" class="btn btn-info btn-block">Enviar Reportes a Red De Genero</a>
                        </div>
                    </div>
                </div>
            </div>          
        </div>
        <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
          
         <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="container col-lg-9">
               <div class="modal-content">
                   <div class="modalimage">
                         <div class="recuadro">
                         <img id="modalimage" src="SOFTUX/IMAGENES/HALO2.jpg" class="rounded-image"> </div>
                  </div>
                  <div class="pr-2 pt-1">
                     <button
                        type="button"
                        class="close"
                        data-dismiss="modal">
                     <span aria-hidden="true">&times;</span>
                     </button>
          </div>
                      
                  <div class="text-center">
                     <img src="img/user.png" width="100" height="100" />
                  </div>
                  <div class="modal-header text-center">
                     <ul class="nav nav-pills">
                        <li class="ButtonFormSession">
                           <button id="InicioSesionForm">Iniciar Sesisón</button>
                        </li>
                        <li class="ButtonFormSession">
                           <button id="RegistroForm">Registro</button>
                        </li>
                     </ul>
                  </div>
                  <div class="modal-body">
                     <div class="tab-content" id="pills-tabContent">
                        <!-- Iniciar Session -->
                        <div
                           class="tab-pane fade show active"
                           id="pills-iniciar"
                           role="tabpanel">
                           <form action="Controlador">
                              <div class="form-group">
                                 <label>Email address</label>
                                 <input
                                    type="email"
                                    name="txtemail"
                                    class="form-control"
                                    placeholder="email@example.com" />
                              </div>
                              <div class="form-group">
                                 <label>Password</label>
                                 <input
                                    type="password"
                                    name="txtpass"
                                    class="form-control"
                                    placeholder="Password" />
                              </div>
                              <div class="ola"><button
                                 type="submit"
                                 name="accion"
                                 value="Validar"
                                 class="btn btn-outline-danger btn-block">
                              Iniciar
                              </button></div>
                           </form>
                        </div>
                        <!-- Registrarse -->
                        <div
                           class="tab-pane fade"
                           id="pills-registrar"
                           role="tabpanel">
                           <form action="Controlador">
                              <div class="form-group">
                                 <label>Nombres</label>
                                 <input
                                    type="text"
                                    name="txtnom"
                                    class="form-control"
                                    placeholder="Nombre Apellido Paterno Apellido Materno" />
                              </div>
                              <div class="form-group">
                                 <label>Boleta</label>
                                 <input
                                    type="text"
                                    maxlength="10"
                                    name="txtboleta"
                                    class="form-control"
                                    placeholder="2023090001" />
                              </div>
                              <div class="form-group">
                                 <label>Grupo</label>
                                 <input
                                    type="text"
                                    name="txtdire"
                                    class="form-control"
                                    placeholder="4IV9" />
                              </div>
                              <div class="form-group">
                                 <label>Correo Electrónico</label>
                                 <input
                                    type="email"
                                    name="txtemail"
                                    class="form-control"
                                    placeholder="correoejemplo@gmail.com" />
                              </div>
                              <div class="form-group">
                                 <label>Contraseña</label>
                                 <input
                                    type="password"
                                    name="txtpass"
                                    class="form-control"
                                    placeholder="n0m3l0" />
                              </div><div class="ola">
                              <button
                                 type="submit"
                                 name="accion"
                                 value="Registrar"
                                 class="btn btn-outline-danger btn-block">
                              Crear Cuenta
                              </button></div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
        <!-- Modal de Pago -->
                    <div class="modal-header text-center"> 
                        <label><i class="fa-dollar-sign"></i>Realizar Pago</label>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>  
                    </div>
                    <div class="modal-body"> 
                        <div class="tab-content" id="pills-tabContent">
                            <!-- Metodo Pago -->
                            <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                <form action="Controlador">
                                    <div class="form-group">
                                        <label>Card address</label>
                                        <input type="text" class="form-control" placeholder="9999-9999-9999-9999">
                                    </div>
                                    <div class="form-group">
                                        <label>Codigo Seguridad</label>
                                        <input type="text" class="form-control" placeholder="xxxx">
                                    </div>
                                    <div class="form-group">
                                        <label>Monto</label>
                                        <input type="text" name="txtmonto" value="$.${totalPagar}0" class="form-control h1">
                                    </div>                                   
                                    <button type="submit" name="accion" value="RealizarPago" class="btn btn-info btn-block">Pagar</button>
                                </form>
                            </div>

                        </div> 
                    </div>
                                    <script>                        
    /*
 * Noel Delgado | @pixelia_me
 */

var items1 = [];

function getCoordinates(e, svg) {
  var point = svg.createSVGPoint();
  point.x = e.clientX;
  point.y = e.clientY;
  return point.matrixTransform(svg.getScreenCTM().inverse());
}

function changeColor(e) {
  document.body.className = e.currentTarget.className;
}

function Item(config) {
  Object.keys(config).forEach(function (item1) {
    this[item1] = config[item1];
  }, this);
  this.el.addEventListener('mousemove', this.mouseMoveHandler.bind(this));
  this.el.addEventListener('touchmove', this.touchMoveHandler.bind(this));
}

Item.prototype = {
  update: function update(c) {
    this.clip.setAttribute('cx', c.x);
    this.clip.setAttribute('cy', c.y);
  },
  mouseMoveHandler: function mouseMoveHandler(e) {
    this.update(getCoordinates(e, this.svg));
  },
  touchMoveHandler: function touchMoveHandler(e) {
    e.preventDefault();
    var touch = e.targetTouches[0];
    if (touch) return this.update(getCoordinates(touch, this.svg));
  }
};

document.addEventListener('DOMContentLoaded', function () {
  var item1Elements = document.querySelectorAll('.item1');
  [].slice.call(item1Elements, 0).forEach(function (item1, index) {
    items1.push(new Item({
      el: item1,
      svg: item1.querySelector('svg'),
      clip: document.querySelector('#clip-1' + ' circle'),
    }));
  });

  var buttons = document.querySelectorAll('button');
  [].slice.call(buttons, 0).forEach(function (button) {
    button.addEventListener('click', changeColor);
  });
});



var items2 = [];

function getCoordinates(e, svg) {
  var point = svg.createSVGPoint();
  point.x = e.clientX;
  point.y = e.clientY;
  return point.matrixTransform(svg.getScreenCTM().inverse());
}

function changeColor(e) {
  document.body.className = e.currentTarget.className;
}

function Item(config) {
  Object.keys(config).forEach(function (item2) {
    this[item2] = config[item2];
  }, this);
  this.el.addEventListener('mousemove', this.mouseMoveHandler.bind(this));
  this.el.addEventListener('touchmove', this.touchMoveHandler.bind(this));
}

Item.prototype = {
  update: function update(c) {
    this.clip.setAttribute('cx', c.x);
    this.clip.setAttribute('cy', c.y);
  },
  mouseMoveHandler: function mouseMoveHandler(e) {
    this.update(getCoordinates(e, this.svg));
  },
  touchMoveHandler: function touchMoveHandler(e) {
    e.preventDefault();
    var touch = e.targetTouches[0];
    if (touch) return this.update(getCoordinates(touch, this.svg));
  }
};

document.addEventListener('DOMContentLoaded', function () {
  var item2Elements = document.querySelectorAll('.item2');
  [].slice.call(item2Elements, 0).forEach(function (item2, index) {
    items2.push(new Item({
      el: item2,
      svg: item2.querySelector('svg'),
      clip: document.querySelector('#clip-2' + ' circle'),
    }));
  });

  var buttons = document.querySelectorAll('button');
  [].slice.call(buttons, 0).forEach(function (button) {
    button.addEventListener('click', changeColor);
  });
});




var items3 = [];

function getCoordinates(e, svg) {
  var point = svg.createSVGPoint();
  point.x = e.clientX;
  point.y = e.clientY;
  return point.matrixTransform(svg.getScreenCTM().inverse());
}

function changeColor(e) {
  document.body.className = e.currentTarget.className;
}

function Item(config) {
  Object.keys(config).forEach(function (item3) {
    this[item3] = config[item3];
  }, this);
  this.el.addEventListener('mousemove', this.mouseMoveHandler.bind(this));
  this.el.addEventListener('touchmove', this.touchMoveHandler.bind(this));
}

Item.prototype = {
  update: function update(c) {
    this.clip.setAttribute('cx', c.x);
    this.clip.setAttribute('cy', c.y);
  },
  mouseMoveHandler: function mouseMoveHandler(e) {
    this.update(getCoordinates(e, this.svg));
  },
  touchMoveHandler: function touchMoveHandler(e) {
    e.preventDefault();
    var touch = e.targetTouches[0];
    if (touch) return this.update(getCoordinates(touch, this.svg));
  }
};

document.addEventListener('DOMContentLoaded', function () {
  var item3Elements = document.querySelectorAll('.item3');
  [].slice.call(item3Elements, 0).forEach(function (item3, index) {
    items3.push(new Item({
      el: item3,
      svg: item3.querySelector('svg'),
      clip: document.querySelector('#clip-3'  + ' circle'),
    }));
  });

  var buttons = document.querySelectorAll('button');
  [].slice.call(buttons, 0).forEach(function (button) {
    button.addEventListener('click', changeColor);
  });
});

</script>


<script>        
         document.addEventListener("DOMContentLoaded", function() {
             // Deshabilitar los formularios al cargar la página
             document.querySelector("#pills-iniciar form").style.display = "block";
             document.querySelector("#pills-registrar form").style.display = "none";
             
             const OpcionIniciarSesionForm = document.getElementById('InicioSesionForm');
             const OpcionRegistrarseForm = document.getElementById('RegistroForm');
             
         OpcionIniciarSesionForm.addEventListener('click', () => {
          document.querySelector("#pills-iniciar form").style.display = "block";
             document.querySelector("#pills-registrar form").style.display = "none";
         });
         
         OpcionRegistrarseForm.addEventListener('click', () => {
          document.querySelector("#pills-iniciar form").style.display = "none";
             document.querySelector("#pills-registrar form").style.display = "block";
         });
         
         });
         
      </script>
      <script>
         document.addEventListener('DOMContentLoaded', function() {
             // Obtener el elemento modal
             var modal = document.getElementById('myModal');
         
             // Deshabilitar la visibilidad del modal al cargar la página
             modal.style.display = 'none';
         });
         
         
         document.addEventListener('DOMContentLoaded', function() {
             // Obtener el botón de cerrar del modal
             var closeButton = document.querySelector('.close[data-dismiss="modal"]');
             
             // Obtener el elemento modal
             var modal = document.getElementById('myModal');
         
             // Agregar evento de click al botón de cerrar
             closeButton.addEventListener('click', function() {
                 // Ocultar el modal
                 modal.style.display = 'none';
             });
         });
         
      </script>
      <script>
         // Captura el elemento que activa el mini menú
         var dropdownToggle = document.querySelector('.dropdown-toggle');
         
         // Captura el mini menú
         var dropdownMenu = document.querySelector('.dropdown-menu');
         
         // Variable para controlar el estado del mini menú
         var isDropdownVisible = false;
         
         // Función para mostrar el mini menú temporalmente al pasar el cursor
         function showDropdownMenuTemporarily() {
             dropdownMenu.style.display = 'block';
             setTimeout(function() {
                 if (!isDropdownVisible) {
                     dropdownMenu.style.display = 'none';
                 }
             }, 2000); // Duración en milisegundos antes de ocultar el mini menú
         }
         
         // Función para mostrar u ocultar el mini menú
         function toggleDropdownMenu() {
             isDropdownVisible = !isDropdownVisible;
             dropdownMenu.style.display = isDropdownVisible ? 'block' : 'none';
         }
         
         // Agrega un evento para mostrar el mini menú temporalmente al pasar el cursor sobre el elemento
         dropdownToggle.addEventListener('mouseenter', function(event) {
             showDropdownMenuTemporarily();
         });
         
         // Agrega un evento para mantener visible el mini menú al presionarlo
         dropdownToggle.addEventListener('click', function(event) {
             event.preventDefault(); // Evita que el enlace se ejecute
             toggleDropdownMenu();
         });
         
         // Agrega un evento para ocultar el mini menú al hacer clic fuera del mini menú o del elemento que lo activa
         document.addEventListener('click', function(event) {
             var isClickInside = dropdownToggle.contains(event.target) || dropdownMenu.contains(event.target);
             if (!isClickInside && isDropdownVisible) {
                 toggleDropdownMenu();
             }
         });
         
            
      </script>
      <script>
         // Captura el elemento que activa el modal
         var modalToggle = document.querySelector('[data-toggle="modal"][data-target="#myModal"]');
         
         // Captura el modal
         var modal = document.getElementById('myModal');
         
         // Variable para controlar el estado del modal
         var isModalVisible = false;
         // Función para mostrar u ocultar el modal
         function toggleModal() {
             isModalVisible = !isModalVisible;
             modal.style.display = isModalVisible ? 'block' : 'none';
         }
         
         
         // Agrega un evento para mostrar el modal temporalmente al pasar el cursor sobre el elemento
         modalToggle.addEventListener('mouseenter', function(event) {
             showModalTemporarily();
         });
         
         // Agrega un evento para mantener visible el modal al presionarlo
         modalToggle.addEventListener('click', function(event) {
             event.preventDefault(); // Evita que el enlace se ejecute
             toggleModal();
             isDropdownVisible = !isDropdownVisible;
             dropdownMenu.style.display = isDropdownVisible ? 'block' : 'none';
         });
         
         // Agrega un evento para ocultar el modal al hacer clic fuera del modal o del elemento que lo activa
         document.addEventListener('click', function(event) {
             var isClickInside = modalToggle.contains(event.target) || modal.contains(event.target);
             if (!isClickInside && isModalVisible) {
                 toggleModal();
             }
         });
         
      </script>
 <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
