@ECHO OFF
cls
echo Cargando
timeout 1 >Nul
cls
echo Cargando .
timeout 1 >Nul
cls
echo Cargando ..
timeout 1 >Nul
cls
echo Cargando ...
timeout 1 >Nul
cls
echo Cargando
timeout 1 >Nul
cls
echo Cargando .
timeout 1 >Nul
cls
echo Cargando ..
timeout 1 >Nul
cls
echo Cargando ...
timeout 1 >Nul
cls
echo Cargando
timeout 1 >Nul
cls
echo Cargando .
timeout 1 >Nul
cls
echo Cargando ..
timeout 1 >Nul
cls
goto cargado

:error1
cls
echo La respuesta anterior es invalida, porvafor limitese a responder con si o no

:cargado
echo Hola usuario bienvenido, este programa tiene la utilidad de este programa es de crear una carpeta privada.
echo Para acceder a dicha carpeta necesitaras un nombre de usuario y una contrasena, una vez dicho esto, tienes una cuenta?

set /p respuesta1=
if /i %respuesta1%==si goto accesocuenta
if /i %respuesta1%==no goto crearcuenta
goto error1

:accesocuenta
cd .\data
iniciarsesion.bat

:crearcuenta
cd .\data
crearusuario.bat