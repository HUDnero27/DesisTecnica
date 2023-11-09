# Instrucciones para Levantar el Proyecto

Este archivo `readme.md` proporciona las instrucciones necesarias para configurar y levantar el proyecto "Sistema de Votación" en tu entorno local.

## Requisitos

Asegúrate de tener los siguientes requisitos instalados en tu sistema:

- XAMPP v3.3.0
- PHP 8.2.4
- jQuery 3.6.0
- HTML 5

## Configuración de XAMPP

1. Inicia XAMPP y asegúrate de que los servicios de Apache y MySQL estén activos.

2. Si al iniciar MySQL te encuentras con un problema de puerto ocupado en el puerto 3306, es posible que debas cambiar el puerto en la configuración de MySQL. Puedes hacerlo siguiendo estos pasos:

   a. Abre XAMPP Control Panel.
   
   b. Haz clic en el botón "Config" para MySQL.
   
   c. En la pestaña "my.ini," busca la línea que contiene el número de puerto, que suele ser `port = 3306`.
   
   d. Cambia el número de puerto a `port = 3308` u otro número de puerto disponible si lo deseas.

   e. Guarda los cambios y reinicia MySQL.

3. Coloca los archivos del proyecto en la carpeta `htdocs` de XAMPP. Puedes encontrar esta carpeta en la ubicación donde has instalado XAMPP.

4. Accede al proyecto a través de tu navegador web utilizando la URL `http://localhost/nombre_de_proyecto`.

5. Deberías poder ver y utilizar el sistema de votación en tu navegador.

## Archivos y Base de Datos

Todos los archivos necesarios para el proyecto, incluida la base de datos "sistema_votacion," se encuentran en este repositorio de GitHub (https://github.com/HUDnero27/DesisTecnica.git). 

Para usar la base de datos, puedes seguir estos pasos:

1. Descarga el archivo "sistema_votacion.sql" desde el repositorio.

2. Importa el archivo "sistema_votacion.sql" al sistema de gestión de bases de datos phpMyAdmin.

3. Verifica la conexión a la base de datos en el archivo "connect.php". La configuración de la base de datos se encuentra en `mysqli_connect` y utiliza el usuario "root" y la contraseña "123456789" (ten en cuenta que esta contraseña es local y puede variar según configuración).



## Notas Adicionales Importantes

Se modificó el puerto original 3306 ya que estaba ocupado al momento de ejecutar las herramientas, puede que a ti no te ocurra.

No conseguí que el sistema guardara la información de los checkbox, marcan como Array. Para solucionar esto podría hacer un for donde 
hiciera un insert a la BDD por cada selección que el rut ingresa, esto aportaría a la escalabilidad sin embargo fue algo que no alcancé a
implementar.

Faltan las comunas de todas las regiones de Chile que no sean la Región Metropolitana, esto debido a que solo se comprueba funcionalidad,
si se selecciona otra región que no sea la R.M no mostrará comunas por que la relación está región->comunas comprobando que efectivamente
realiza el filtro por región, de la misma manera comuna es a candidato y todas las comunas con el ID = 1 muestran candidatos.


¡Gracias!



