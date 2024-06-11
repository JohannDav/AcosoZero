<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
   contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <link rel="icon" type="image/x-icon" href="AcosoZer0Batiz/Imagenes/favicon.ico">
      <link href="css/IndexDesigns.css" rel="stylesheet" type="text/css" />
      <link href="css/OverallDesigns001.css" rel="stylesheet" type="text/css" />
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

      <title> AcosoZer0Batiz </title>
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
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      
         <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
               <li class="nav-item active">
                   <a class="nav-link" href="INFORMATIVO/index.html">
                     <div class="menu_index">
                        <img src="data:image/jpeg;base64,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" />
                        <img class="top rar" src="SOFTUX/IMAGENES/OLA2.jpg" />
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
                        <img src="SOFTUX/IMAGENES/HALO2.jpg" />
                        <img class="top rar" src="SOFTUX/IMAGENES/halo.jpg" />
                     </div>
                  </a><div class="texto" style="font-family: 'Pacifico', cursive; font-size: 48px; font-weight: bold; color: #ffffff; text-align: center;">
    Empresa
  </div>
               </li>
               <li class="nav-item active">
                  <a class="nav-link" href="./ReporteServlet?action=list">
                     <div class="menu_index">
                        <img src="SOFTUX/IMAGENES/HALO2.jpg" />
                        <img class="top rar" src="SOFTUX/IMAGENES/halo.jpg" />
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
<!-- Campo de entrada para la búsqueda -->
<input type="text" id="searchInput" placeholder="Buscar..." onkeyup="searchProducts()">
<!-- Botón de selección -->
<select id="searchOption" onchange="searchProducts()">
    <option value="name">Buscar por nombre</option>
    <option value="description">Buscar por descripción</option>
</select>

<!-- Div para mostrar los resultados de la búsqueda -->
<div id="productResults"></div>

<script>
    function searchProducts() {
        // Obtener el texto ingresado en el campo de búsqueda
        var searchText = document.getElementById('searchInput').value.toLowerCase();
        // Obtener la opción de búsqueda seleccionada
        var searchOption = document.getElementById('searchOption').value;
        
        // Obtener todos los elementos de producto
        var products = document.querySelectorAll('[data-product-name], [data-product-description]');
        
        // Iterar sobre cada producto y mostrar u ocultar según la búsqueda
        products.forEach(function(product) {
            var name = product.getAttribute('data-product-name').toLowerCase();
            var description = product.getAttribute('data-product-description').toLowerCase();
            if ((searchOption === 'name' && name.includes(searchText)) || (searchOption === 'description' && description.includes(searchText))) {
                product.style.display = 'block'; // Mostrar el producto si coincide con la opción de búsqueda
            } else {
                product.style.display = 'none'; // Ocultar el producto si no coincide
            }
        });
    }

</script>

<c:forEach items="${reportes}" var="p">
<div class="wrapper" data-product-name="${p.getNombres()}" data-product-description="${p.getDescripcion()}">
  <div class="container">
    <div class="top"></div>
    <div class="bottom">
      <div class="left">
        <div class="details">
          <h1>${p.getNombres()}</h1>
          <p>£250</p>
        </div>
                              <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">
                         
        <div class="buy"><i class="material-icons">add_shopping_cart</i></div></a>
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
          <th>Height</th>
        </tr>
        <tr>
          <td>${p.getDescripcion()}</td>
          <td>4000mm</td>
        </tr>
      </table>
    </div>
  </div>
</div>
</c:forEach>



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
      
      <script>
              
$('.buy').click(function(){
  $(this).closest('.bottom').addClass("clicked");
});

$('.remove').click(function(){
  $(this).closest('.bottom').removeClass("clicked");
});


    var imagenes = [];
    for (var i = 1; i <= 60; i++) {
        var rutaImagen = "SOFTUX/IMAGENES/image" + i + ".jpg";
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