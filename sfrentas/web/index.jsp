<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page
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
      <link href="css/IndexDesigns.css" rel="stylesheet" type="text/css" />
      <link href="css/OverallDesigns001.css" rel="stylesheet" type="text/css" />
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons&quot; rel="stylesheet">
      <link href="css/Buscar_Reportes1.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

      <title> AcosoZer0Batiz </title>
   </head>
   <body>

       <a class="navbar-brand" href="AcosoZer0Batiz/index.html">
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
      </div>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      
         <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
               <li class="nav-item active">
                   <a class="nav-link" href="INFORMATIVO/index.html">
                     <div class="menu_index">
                        <img src="https://i.redd.it/wixrspq3mhc51.jpg" />
                        <img class="top rar" src="img/AS1_1.png" />
                     </div> 
                  </a> <div class="texto" style="font-family: 'Pacifico', cursive; font-size: 48px; font-weight: bold; color: #ffffff; text-align: center;">
    Informate
  </div>
               </li>
               <li class="nav-item active">
                   <a class="nav-link" href="AcosoZer0Batiz/index.html">
                     <i class="fas fa-cart-plus">
                     </i>
                     <div class="menu_index">
                        <img src="img/empresa2.png" />
                        <img class="top rar" src="img/empresa1.png"/>
                     </div>
                  </a><div class="texto" style="font-family: 'Pacifico', cursive; font-size: 48px; font-weight: bold; color: #ffffff; text-align: center;">
    Empresa
  </div>
               </li>
               <li class="nav-item active">
                  <a class="nav-link" href="./ReporteServlet?action=list">
                     <div class="menu_index">
                        <img src="img/reporte2.png" />
                        <img class="top rar" src="https://i.pinimg.com/736x/e8/6c/c6/e86cc64fd3aee67168ba578921c55dc9.jpg" />
                     </div>
                  </a><div class="texto" style="font-family: 'Pacifico', cursive; font-size: 48px; font-weight: bold; color: #ffffff; text-align: center;">
    Informe
  </div>
               </li>
            </ul>
         </div>
      </nav>
      <div class="container1 mt-5">
         <div class="row">
<c:if test="${correo == 'empresa@gmail.com' or correo == 'otroemail@gmail.com' or correo == 'terceremail@gmail.com'}">
  <input type="text" id="searchInput" placeholder="Buscar..." onkeyup="searchProducts()">
  <!-- Campo de selección de fecha -->
  <input type="date" id="searchDate" onchange="searchProducts()" style="display:none;"> <!-- Nuevo campo de fecha, inicialmente oculto -->
  <!-- Botón de selección -->
  <select id="searchOption" onchange="toggleSearchFields()">
      <option value="name">Buscar por nombre</option>
      <option value="description">Buscar por descripción</option>
      <option value="date">Buscar por fecha</option> <!-- Nueva opción de búsqueda por fecha -->
  </select>
</c:if>

<!-- Div para mostrar los resultados de la búsqueda -->
<div id="productResults"></div>

<script>
    function toggleSearchFields() {
        var searchOption = document.getElementById('searchOption').value;
        var searchInput = document.getElementById('searchInput');
        var searchDate = document.getElementById('searchDate');
        
        if (searchOption === 'date') {
            searchInput.style.display = 'none';
            searchDate.style.display = 'inline-block';
        } else {
            searchInput.style.display = 'inline-block';
            searchDate.style.display = 'none';
        }
    }

    function searchProducts() {
        // Obtener el texto ingresado en el campo de búsqueda
        var searchText = document.getElementById('searchInput').value.toLowerCase();
        var searchDate = document.getElementById('searchDate').value;
        // Obtener la opción de búsqueda seleccionada
        var searchOption = document.getElementById('searchOption').value;
        
        // Obtener todos los elementos de producto
        var products = document.querySelectorAll('[data-product-name], [data-product-description], [data-product-date]');
        
        // Iterar sobre cada producto y mostrar u ocultar según la búsqueda
        products.forEach(function(product) {
            var name = product.getAttribute('data-product-name').toLowerCase();
            var description = product.getAttribute('data-product-description').toLowerCase();
            var date = product.getAttribute('data-product-date');
            
            if ((searchOption === 'name' && name.includes(searchText)) || 
                (searchOption === 'description' && description.includes(searchText)) || 
                (searchOption === 'date' && date === searchDate)) {
                product.style.display = 'block'; // Mostrar el producto si coincide con la opción de búsqueda
            } else {
                product.style.display = 'none'; // Ocultar el producto si no coincide
            }
        });
    }

    // Inicializar el estado de los campos de búsqueda
    toggleSearchFields();
</script>

<%-- Verificación del email del usuario --%>
<c:if test="${correo == 'empresa@gmail.com'}">
  <c:forEach items="${reportes}" var="p">
    <div class="wrapper" data-product-name="${p.getNombres()}" data-product-description="${p.getDescripcion()}" data-product-date="${p.getFechasuceso()}">
      <div class="container">
        <div class="top"></div>
        <div class="bottom">
          <div class="left">
            <div class="details">
              <h1>${p.getNombres()}</h1>
              <p>£250</p>
            </div>
            <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">
              <div class="buy"><i class="material-icons">add_shopping_cart</i></div>
            </a>
          </div>
          <div class="right">
            <div class="done"><i class="material-icons">done</i></div>
            <div class="details">
              <h1>${p.getNombres()}</h1>
              <p>Listo para revisión</p>
            </div>
            <div class="remove"><i class="material-icons">clear</i></div>
          </div>
        </div>
      </div>
      <div class="inside">
        <div class="icon"><i class="material-icons">info_outline</i></div>
        <div class="contents">
          <table>
            <tr>
              <th>Descripción</th>
              <th>Fecha</th>
            </tr>
            <tr>
              <td>${p.getDescripcion()}</td>
              <td>${p.getFechasuceso()}</td>
            </tr>
            <tr>
              <td>${p.getTurno()}</td>
              <td>${p.getLugar()}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </c:forEach>
</c:if>
 <h2>Página de Inicio</h2>
    <h3>Lista de Usuarios</h3>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Boleta</th>
            <th>Nombres</th>
            <th>Email</th>
            <th>Dirección</th>
        </tr>
        <c:forEach var="usuario" items="${listaUsuarios}">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.boleta}</td>
                <td>${usuario.nombres}</td>
                <td>${usuario.email}</td>
                <td>${usuario.direccion}</td>
            </tr>
        </c:forEach>
    </table>

         </div>
      </div>
      <!-- Modal Iniciar Session o Registrarse -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
          
         <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="container col-lg-9">
               <div class="modal-content">
                   <div class="modalimage">
                         <div class="recuadro">
                         <img id="modalimage" src="img/image1.jpg" class="rounded-image"> </div>
                  </div>
<style>
    .pr-2 {
        display: flex;
        justify-content: flex-end; /* Alinear hacia la derecha */
        margin-top: 5px; /* Espacio superior */
        margin-right: 5px; /* Espacio derecho */
    }

    .close {
        width: 40px;
        height: 40px;
        background-color: brown; /* Cambia a tu color preferido */
        border: none; /* Elimina el borde para que sea solo el color de fondo */
        border-radius: 5%; /* Aplica un radio de borde para que sea un círculo */
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .close span {
        font-size: 24px; /* Tamaño del ícono de cierre */
        color: white; /* Color del ícono */
    }
</style>

<div class="pr-2 pt-1">
    <button type="button" class="close" data-dismiss="modal">
        <span aria-hidden="true">&times;</span>
    </button>
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
<div class="buttons">
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
  </button></li></ul>
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
      
      <script>
              
$('.buy').click(function(){
  $(this).closest('.bottom').addClass("clicked");
});

$('.remove').click(function(){
  $(this).closest('.bottom').removeClass("clicked");
});


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
      <script src="js/index.js" type="text/javascript"></script>
   </body>
</html>