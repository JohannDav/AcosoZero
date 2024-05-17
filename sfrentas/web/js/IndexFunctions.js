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
         