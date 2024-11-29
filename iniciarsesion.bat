@ECHO OFF
TITLE Carpeta privada
goto salto7

:crearus
cd ..
cls
crearusuario.bat

:error10
cls
echo Su respuesta no es valida porfavor rasponda con si o no.

:error9
echo El nombre de usuario %user% no a sido encontrado.

:error11
echo Estas seguro que posee una cuenta?
set /p pregun1=
IF /i %pregun1%==si goto salto7
IF /i %pregun1%==no goto crearus
goto error10


:salto7
set verify==FALSE
cls
echo Para poder acceder a su carpeta privada u otras opciones inserta tu nombre de usuario:
SET /p user=
cd .\Usuarios
cls
ECHO Buscando usuario
timeout >>Nul 1
cls
ECHO Buscando usuario.
timeout >>Nul 1
cls
ECHO Buscando usuario..
timeout >>Nul 1
cls
ECHO Buscando usuario...
timeout >>Nul 1
cls

IF EXIST %user% cd %user% && FIND user.txt "%user%" >>Nul && goto con
cls
goto:error9
:inicia
echo %user% su contrasena a sido cambiada, ahora:
:con
cd .\contra
echo Introduzca su contrasena:
set /p contra3=
FIND con.txt "%contra3%" >>Nul && cd .. && goto opc
cls
echo La contrasena introducida no es correcta le quedan 2 intentos
echo Introduzca su contrasena:
set /p contra3=
FIND con.txt "%contra3%" >>Nul && cd .. && goto opc
cls
echo La contrasena introducida no es correcta le quedan 1 intentos
echo Introduzca su contrasena:
set /p contra3=
FIND con.txt "%contra3%" >>Nul && cd .. && goto opc
cd ..\..\..
cls
echo Has superado el maximo numero de errores, estas seguro que esta es tu cuenta?

:error12
set /p preg1=
IF /i %preg1%==si goto camb1
cls
IF /i %preg1%==no goto error11
cls
echo Su respuesta no es valida porfavor limitese a responder con si o no.
echo Estas seguro que esta es tu cuenta?
goto error12

:camb1
cd .\Usuarios\%user%\contra
cls
:error14
echo Quieres cambiar tu contrasena?
set /p preg2=
IF /i %preg2%==si goto camb2
cls
IF /i %preg2%==no goto error13
cls
echo Su respuesta no es valida porfavor limitese a responder con si o no.
goto error14

:camb2
cls
cd ..\seguridad
type preg.txt
set /p res1=
FIND res.txt "%res1%" >>Nul && goto camb3
cls
echo La respuesta no es valida (2 intentos restantes)
type preg.txt
set /p res1=
FIND res.txt "%res1%" >>Nul && goto camb3
cls
echo La respuesta no es valida (1 intentos restantes)
type preg.txt
set /p res1=
FIND res.txt "%res1%" >>Nul && goto camb3
cls
cd ..\..\..
cls
echo Volviendo al inicio
timeout 3 >> Nul
inicio.bat

:camb3
cd ..\contra
cls
echo Para cambiar la contrasena porfavor inserte su nueva contrasena:
set /p ncontra1=
cls
echo Repita la contrasena nuevamente para confirmar el cambio de contrasena:
set /p ncontra2=
if %ncontra1%==%ncontra2% goto cambf

:error15
cls
echo Las contrasenas no coinciden entre si.
echo Para cambiar la contrasena porfavor inserte su nueva contrasena:
set /p ncontra1=
cls
echo Repita la contrasena para verificar que es correcta:
set /p ncontra2=
if %ncontra1%==%ncontra2% goto cambf
goto error15

:cambf
cls
del con.txt
echo %ncontra1% >> con.txt
cls
echo Su contrasena se a cambiado con exito
IF %verify%==TRUE goto change2
echo Volviendo atras, porfavor espere
timeout 3 >>Nul
cls
cd ..
goto inicia

:change2
echo Volviendo al menu de usuario, porfavor espere
timeout 3 >>Nul
cls
cd ..
goto opc

:error16
cd ..
cls
echo Su respuesta no es valida

:opc
set verify==TRUE
cls
cd .\nombre

echo Hola bienvenido.
type name.txt
echo Has accedido correctamente a tu usuario %user%. Que desea hacer? (Selecione su respuesta por los numero de las opciones que se muestran en pantalla)
echo 1. Cambiar la contrasena
echo 2. Cambiar el nombre de Usuario
echo 3. Cambiar su nombre real
echo 4. Acceder a su carpeta privada
echo 5. Salir del programa
echo 6. Iniciar sesion con otra cuenta
echo 7. Volver al inicio del programa
set /p opcionusiniciado=
IF %opcionusiniciado%==1 goto camb3
IF %opcionusiniciado%==2 goto cambus
IF %opcionusiniciado%==3 goto cambnus
IF %opcionusiniciado%==4 goto open
IF %opcionusiniciado%==5 goto salir
IF %opcionusiniciado%==6 goto salto7
IF %opcionusiniciado%==7 goto inicioa
goto error16

:cambus
cd ..

:error17
cls
:arrbia
echo Para cambiar el usuario porfavor inserte su nuevo usuario:
set /p user1=
cls
:error15
echo Estas seguro que quiere dejar de llamarse %user% y llamarse %user1%?
set /p us=
if /i %us%==si goto cambusf
if /i %us%==no goto error17
cls
echo Respuesta no valida responda solo on si o no
goto error15

:cambusf
cls
del user.txt
echo %user1% >> user.txt
cd ..
ren %user% %user1%
cd ..\Carpetaprivada
attrib -h %user%
ren %user% %user1%
set user=%user1%
attrib +h %user%
cls
echo Su usuario se a cambiado con exito
echo Volviendo al menu de opciones, porfavor espere
timeout 3 >>Nul
cls
cd ..\Usuarios\%user%
goto opc

:cambnus
cls
echo Para cambiar el nombre porfavor inserte su nuevo nombre:
set /p nreal=
cls

:error18
echo Estas seguro que quiere que su nombre real apartir de ahora sea %nreal%?
set /p sus=
if /i %sus%==si goto cambrus
if /i %sus%==no goto cambnus
cls
echo Respuesta no valida responda solo on si o no
goto error18

:cambrus
cls
del name.txt
echo %nreal% >> name.txt
cls
echo Su nombre real se a cambiado con exito
echo Volviendo al menu de opciones, porfavor espere
timeout 3 >>Nul
cls
cd ..
goto opc

:inicioa
cd ..\..\..
cls
inicio.bat

:salir
cls
exit

:open
cd ..\..\..\Carpetaprivada
explorer .\%user%
cd ..\Usuarios\%user%\nombre
cls
echo Para cerrar el programa debes de selecionar la opcion 5 u opcion de salir el programa
goto arriba