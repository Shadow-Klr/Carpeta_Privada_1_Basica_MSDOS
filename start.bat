@ECHO OFF
TITLE Carpeta privada
IF EXIST data AND EXIST launcher goto inicio
IF EXIST ord.bat goto launch1
echo No se en encuntra el archivo ord.bat
:launch1
IF EXIST crearusuario.bat goto launch2
echo No se en encuntra el archivo crearusuario.bat
:launch2
IF EXIST inicio.bat goto launch3
echo No se en encuntra el archivo inicio.bat
:launch3
ord.bat
:inicio
cd .\data >>Nul
inicio.bat