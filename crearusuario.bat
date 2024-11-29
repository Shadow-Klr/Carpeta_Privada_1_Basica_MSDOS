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
echo Vamos a crear su usuario:
set /p nombre=Inserte su nombre real:
goto salto6
:error8
cls
echo %nombre% el nombre de usuario que esta tratando de usar ya existe, porfavor elija otro nombre de usuario.
:salto6
set /p usuario=Inserte el nombre que desea para su usuario:
cd .\Usuarios
IF EXIST %usuario% goto error8
cls
goto salto1

:error2
cls
echo Su respuesta no es valida porfavor limitese a responder con si o no.

:salto1
echo %nombre% estas seguro de que quiere que su usuario se llame %usuario%?
echo Le recordamos que el nombre de usuario elegido no se podra cambiar mas adelante
set /p confirmar1=
if /i %confirmar1%== si goto continuar
cls
if /i %confirmar1%==no goto resetuser
goto error2

:resetuser
echo %nombre% vamos a cambiar su nombre de usuario, el anterior nombre de usuario introducido fue %usuario%.
set /p %usuario%=Introduzca su nuevo nombre de usuario:
cls
goto salto2

:error3
cls
echo Su respuesta no es valida porfavor limitese a responder con si o no.

:salto2
echo %nombre% estas seguro de que quiere que su usuario se llame %usuario%?
echo Le recordamos que el nombre de usuario elegido no se podra cambiar mas adelante
set /p confirmar1=
cls
if /i %confirmar1%==si goto continuar
if /i %confirmar1%==no goto resetuser
goto error3


:continuar
cls
echo %nombre% ahora vamos a crear una contrasena para su usuario.
goto salto3
:error4
echo Las contrasenas no coinciden entre si.
:salto3
set /p contra1=Inserte una contrasena para su usuario:
cls
echo %nombre% ahora vamos a crear una contrasena para su usuario.
set /p contra2=Repita la contrasena para verificar que es correcta:
cls
if %contra1%==%contra2% goto pregunta

echo Las contrasenas no coinciden entre si.
set /p contra1=Inserte una contrasena para su usuario:
cls
echo %nombre% ahora vamos a crear una contrasena para su usuario.
set /p contra2=Repita la contrasena para verificar que es correcta:
if %contra1%==%contra2% goto pregunta
goto error4


:pregunta
cls
echo Por motivos de seguridad le pondremos varias preuntas de seguridad, porfavor selecione una pregunta de las siguientes.
echo 1 Cual es el apellido de tu abuelo?
echo 2 Cual es su direccion?
echo 3 Cual es el numero de telefono de tu madre?
echo 4 Como se llamaba su primer amigo de la infancia?
echo 5 Cual es su sueno mas brillante de la infancia?
goto salto4

:error5
cls
echo Por motivos de seguridad le pondremos varias preuntas de seguridad, porfavor selecione una pregunta de las siguientes.
echo 1 Cual es el apellido de tu abuelo?
echo 2 Cual es su direccion?
echo 3 Cual es el numero de telefono de tu madre?
echo 4 Como se llamaba su primer amigo de la infancia?
echo 5 Cual es su sueno mas brillante de la infancia?
echo la respuesta insertada no es valida, porfavor selecione la pregunta segun su numero (1, 2, 3, 4, 5)

:salto4
set op1=Cual es el apellido de tu abuelo?
set op2=Cual es su direccion?
set op3=Cual es el numero de telefono de tu madre?
set op4=Como se llamaba su primer amigo de la infancia?
set op5=Cual es su sueno mas brillante de la infancia?
set n1==1
set n2==2
set n3==3
set n4==4
set n5==5
set /p seguridad= Selecione la pregunta mediante el numero de esta:
cls
if %seguridad%=%n1% goto opcion1
if %seguridad%=%n2% goto opcion2
if %seguridad%=%n3% goto opcion3
if %seguridad%=%n4% goto opcion4
if %seguridad%=%n5% goto opcion5
goto error5

:error6
cls
goto salto5

:error7
cls
echo Su respuesta no es valida porfavor limitese a responder con si o no.
if %seguridad%=%n1% goto o1
if %seguridad%=%n2% goto o2
if %seguridad%=%n3% goto o3
if %seguridad%=%n4% goto o4
if %seguridad%=%n5% goto o5

:salto5
if %seguridad%=%n1% goto opcion1
if %seguridad%=%n2% goto opcion2
if %seguridad%=%n3% goto opcion3
if %seguridad%=%n4% goto opcion4
if %seguridad%=%n5% goto opcion5
cls

:opcion1
set security=%op1%
echo %op1%
set /p respuesta2=
:o1
echo Le recordamos que la respuesta que usted ponga servira en un futuro para poder cambiar la contrasena a si que acuerdese bien de esta.
echo Esta seguro de su respuesta?
set /p confirmar2=
if /i %confirmar2%==si goto creacion
if /i %confirmar2%==no goto error6
goto error7

:opcion2
set security=%op2%
echo %op2%
set /p respuesta2=
:o2
echo Le recordamos que la respuesta que usted ponga servira en un futuro para poder cambiar la contrasena a si que acuerdese bien de esta.
echo Esta seguro de su respuesta?
set /p confirmar2=
if /i %confirmar2%==si goto creacion
if /i %confirmar2%==no goto error6
goto error7

:opcion3
set security=%op3%
echo %op3%
set /p respuesta2=
:o3
echo Le recordamos que la respuesta que usted ponga servira en un futuro para poder cambiar la contrasena a si que acuerdese bien de esta.
echo Esta seguro de su respuesta?
set /p confirmar2=
if /i %confirmar2%==si goto creacion
if /i %confirmar2%==no goto error6
goto error7

:opcion4
set security=%op4%
echo %op4%
set /p respuesta2=
:o4
echo Le recordamos que la respuesta que usted ponga servira en un futuro para poder cambiar la contrasena a si que acuerdese bien de esta.
echo Esta seguro de su respuesta?
set /p confirmar2=
if /i %confirmar2%==si goto creacion
if /i %confirmar2%==no goto error6
goto error7

:opcion5
set security=%op5%
echo %op5%
set /p respuesta2=
:o5
echo Le recordamos que la respuesta que usted ponga servira en un futuro para poder cambiar la contrasena a si que acuerdese bien de esta.
echo Esta seguro de su respuesta?
set /p confirmar2=
if /i %confirmar2%==si goto creacion
if i %confirmar2%==no goto error6
goto error7

:creacion
cd ..\Carpetaprivada
md .\%usuario%
attrib +h .\%usuario%
cd ..\Usuarios
md .\%usuario%
cd %usuario%
echo %usuario% >> user.txt
md .\contra
md .\seguridad
md .\nombre
cd contra
echo %contra1% >> con.txt
cd ..\seguridad
echo %security% >> preg.txt
echo %respuesta2% >> res.txt
cd ..\nombre
echo %nombre% >> name.txt
cd ..\..\..
iniciarsesion.bat