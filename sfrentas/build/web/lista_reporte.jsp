<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Obtener la lista de usuarios directamente en esta página --%>
<%
    com.rs.modelo.UsuarioDAO dao = new com.rs.modelo.UsuarioDAO();
    java.util.List<com.rs.modelo.Usuario> listaUsuarios = dao.listarUsuarios();
    request.setAttribute("listaUsuarios", listaUsuarios);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="icon" type="image/x-icon" href="AcosoZer0Batiz/Imagenes/favicon.ico">
        <link href="css/OverallDesigns_3.css" rel="stylesheet" type="text/css" />
        <link href="css/DiesenoAgregar222.css" rel="stylesheet" type="text/css" />
        <link href="css/1Buttons_Lista_Reporte.css" rel="stylesheet" type="text/css"/>
        <link href="css/1OverallDesings_Menu_Buttons.css" rel="stylesheet" type="text/css" />
        <title>Agregar</title>
    </head>
    <body>
        <a class="navbar-brand" href="index.jsp">
            <img src="AcosoZer0Batiz/Imagenes/logo.png" alt="AcosoZer0Batiz">
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
                  ><img src="img/usuario.png" alt="60" height="60"
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
                  
      </div><div id="indicador1">
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
              <image xlink:href="https://static.vecteezy.com/system/resources/previews/004/693/027/original/flat-design-house-icon-free-free-vector.jpg" width="100%" height="100%" preserveAspectRatio="xMinYMin slice"></image>
              <text class="svg-masked-text" x="50%" y="50%" dy=".3em">Inicio</text>
            </g>
          </svg>
        </div>
        <!-- Repeat for other items -->
      </div>
    </main>

  </a>
</div>

<div class="container">
    <a href="INFORMATIVO/index.html">

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
              <image xlink:href="https://st2.depositphotos.com/4410397/7230/v/450/depositphotos_72302047-stock-illustration-magnifier-icon.jpg" width="100%" height="100%" preserveAspectRatio="xMinYMin slice"></image>
              <text class="svg-masked-text" x="50%" y="50%" dy=".3em">Informate</text>
            </g>
          </svg>
        </div>
        <!-- Repeat for other items -->
      </div>
    </main>

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
              <image xlink:href="https://lh3.googleusercontent.com/drive-storage/AJQWtBP5ti00V_3DtLgW-zZWEYmOBVGhj6xC41JNJPK2AGkvev56afcqnLf4-NxrHahKy947O7iaBTo9ihPMPDLx1Vh2b6ND2Dxt4fSz-LG8xsO-kDY=h360" width="100%" height="100%" preserveAspectRatio="xMinYMin slice"></image>
              <text class="svg-masked-text" x="50%" y="50%" dy=".3em">AcosoZer0Batiz</text>
            </g>
          </svg>
        </div>
        <!-- Repeat for other items -->
      </div>
    </main>

  </a>
</div>

</div>
                      
                  </div>
    
        <div class="container1 mt-5">
            <div class="row"><div id="indicador1">
                <div class="container2">
    <div class="text">
        Agregar Reporte
    </div>
    <form action="ReporteServlet?action=insert" method="POST">
        <div class="form-row">
            <div class="input-data">
                <input type="text" name="nombres" class="form-control" required>
                <div class="underline"></div>
                <label for="nombres">Nombres:</label>
            </div>
            <div class="input-data">
                <input type="text" name="descripcion" class="form-control" required>
                <div class="underline"></div>
                <label for="descripcion">Descripción:</label>
            </div>
        </div>
        <div class="form-row">
            <div class="input-data">
    <input type="text" id="turno" name="turno" class="form-control" required readonly>
    <div class="underline"></div>
    <label for="turno">Turno:</label>
</div>

<select id="opciones">
    <option value="Matutino">Matutino</option>
    <option value="Vespertino">Vespertino</option>
</select>

<script>
    document.getElementById('opciones').addEventListener('change', function() {
        document.getElementById('turno').value = this.value;
    });
</script>


            <div class="input-data">
                <input type="text" name="lugar" class="form-control" required>
                <div class="underline"></div>
                <label for="lugar">Lugar:</label>
            </div>
        </div><div style="display: none">
        <div class="form-row">
            
            <div class="input-data">
                <input type="number" name="precio" class="form-control" value="1">
                <div class="underline"></div>
                <label for="precio">Precio:</label>
            </div>
            <div class="input-data">
                <input type="number" name="cantreporte" class="form-control" value="1">
                <div class="underline"></div>
                <label for="cantreporte">Cantreporte:</label>
            </div>
            <div class="input-data">
        <input type="text" name="correou" class="form-control" value="${correo}">
        <div class="underline"></div>
        <label for="correou">Correo:</label>
    </div>
        </div></div>
        <div class="form-row">
            <div class="input-data">
                <input type="text" name="imagen" class="form-control" required>
                <div class="underline"></div>
                <label for="imagen">Imagen:</label>
            </div>
            <div class="input-data">
                <input type="date" name="fechasuceso" class="form-control" required>
                <div class="underline"></div>
                <label for="fechasuceso">Fecha del suceso:</label>
            </div>
        </div>


        <div class="form-row submit-btn">
            <div class="input-data">
                <div class="inner"></div>
                <input id="btnGenerarPDF" class="btn btn-danger" type="submit" value="Agregar">
            </div>
        </div>
    </form>
</div>

                <div class="col-sm-7">
                    <table class="table1 table1-responsive">
                        <thead class="">
                            <tr class="text-center">
                                
                                <th>NOMBRE</th>
                                <th>DESCRIPCION</th>
                                <th>Turno</th>
                                <th>Lugar</th>
                                <th>FECHA</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>

<c:forEach var="reporte" items="${reportes}">
        <c:if test="${reporte.correou == correo}">

    <tr class="text-center">
        <td>${reporte.nombres}</td>
        <td>${reporte.descripcion}</td>
        <td>${reporte.turno}</td>
        <td>${reporte.lugar}</td>
        <td>${reporte.fechasuceso}</td>
    <td class="d-flex">
<ul class="horizontal-list">
    <li>
        <a class="btn1 btn1-warning" href="ReporteServletActionInsertReport?correo=${correo}&idReporte=${reporte.idReporte}">
            <span class="text">Enviar PDF </span>
            <span class="icon1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path fill="none" d="M14 2H6a2 2 0 0 0-2 2v16c0 1.1.9 2 2 2h12a2 2 0 0 0 2-2V8l-6-6z"/>
                    <path d="M14 3v5h5M16 13H8M16 17H8M10 9H8"/>
                </svg>
            </span>
        </a>
    </li>    
    <li>
        <a class="btn1 btn1-warning noselect" href="editar_reporte.jsp?idReporte=${reporte.idReporte}">
            <span class="text">Editar</span>
            <span class="icon1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M4.586 16.757l-2.586 2.586v-11.343l8-8 1.414 1.414-8 8zM19.414 7.757l-10 10-3.414-3.414 10-10 3.414 3.414zM21 4c0-0.553-0.447-1-1-1-0.553 0-1 0.447-1 1s0.447 1 1 1c0.553 0 1-0.447 1-1zM14 6c-0.553 0-1 0.447-1 1s0.447 1 1 1c0.553 0 1-0.447 1-1s-0.447-1-1-1zM4 20h16v2h-16v-2z"></path>
                </svg>
            </span>
        </a>
    </li>
    <li>
        <a class="btn btn-danger noselect" href="ReporteServlet?action=delete&idReporte=${reporte.idReporte}">
            <span class="text">Eliminar</span>
            <span class="icon1">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path>
                </svg>
            </span>
        </a>
    </li>

</ul>





    </tr>    </c:if>

</c:forEach>

                        </tbody>
                    </table>
                </div></div>
            </div>
        </div>   
    
    
    <div id="indicador2">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
        
          
         <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="container col-lg-9">
               <div class="modal-content">
                   <div class="modalimage">
                         <div class="recuadro">
                         <img id="modalimage" src="img/image1.jpg" class="rounded-image"> </div>
                  </div>

<div id="indicador3">
<div class="pr-2 pt-1">
    
    <button type="button" class="close" data-dismiss="modal">
        <span aria-hidden="true">&times;</span>
    </button></div>
</div>

                      
                  <div class="text-center1">
                     <img src="img/usuario.png" width="100" height="100" />
                  </div>
                   <div class="olapapu">
                   <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
  <defs>
    <filter id="goo">
      <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
      <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo"></feColorMatrix>
      <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
    </filter>
  </defs>
</svg></div>
<div class="modal-header text-center">
<div class="buttons"><div id="btts">
<ul class="nav nav-pills">

                           <li class="ButtonFormSession">

  <button class="blob-btn" id="InicioSesionForm">
Inicio    <span class="blob-btn__inner">
      <span class="blob-btn__blobs">
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
      </span>
    </span></button></li>
  
    <li class="ButtonFormSession">
  <button class="blob-btn" id="RegistroForm">
Registro
<span class="blob-btn__inner">
      <span class="blob-btn__blobs">
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
      </span>
    </span>
  </button></li></ul></div>
</div>


</div>

<div class="modal-body">
  <div class="tab-content" id="pills-tabContent">
    <!-- Iniciar Session -->
    <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
      <form action="Controlador">
        <div class="form-group">
          <label>Email address</label>
          <input type="email" name="txtemail" class="form-control" placeholder="email@example.com" />
        </div>
        <div class="form-group">
          <label>Password</label>
          <input type="password" name="txtpass" class="form-control" placeholder="Password" />
        </div>
        <div class="ola">
          <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
        </div>
      </form>
    </div>
    <!-- Registrarse -->
    <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
      <form action="Controlador">
        <div class="form-group">
          <label>Nombres</label>
          <input type="text" name="txtnom" class="form-control" placeholder="Nombre Apellido Paterno Apellido Materno" />
        </div>
        <div class="form-group">
          <label>Boleta</label>
          <input type="text" maxlength="10" name="txtboleta" class="form-control" placeholder="2023090001" />
        </div>
        <div class="form-group">
          <label>Grupo</label>
          <input type="text" name="txtdire" class="form-control" placeholder="4IV9" />
        </div>
        <div class="form-group">
          <label>Correo Electrónico</label>
          <input type="email" name="txtemail" class="form-control" placeholder="correoejemplo@gmail.com" />
        </div>
        <div class="form-group">
          <label>Contraseña</label>
          <input type="password" name="txtpass" class="form-control" placeholder="n0m3l0" />
        </div>
        <div class="ola">
          <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
        </div>
      </form>
    </div>
  </div>
</div>

               </div>
            </div>
         </div>
      </div>
    
    
    </div>
          <script>
              
    var imagenes = [];
    for (var i = 2; i <= 7; i++) {
        var rutaImagen = "img/image" + i + ".jpg";
        imagenes.push(rutaImagen);
    }
    
    var indice = 0;
    
    setInterval(function() {
        var loginImg = document.getElementById("modalimage");
        loginImg.src = imagenes[indice];
        indice++;
        if (indice == imagenes.length) {
            indice = 0;
        }
    }, 3000);
</script>
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
    </body>
</html>