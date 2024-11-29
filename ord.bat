@ECHO OFF
TITLE Carpeta privada
cd .\ >>Nul
md .\Programa >>Nul
cd .\Programa >>Nul
move ..\start.bat >>Nul
md .\data >>Nul
attrib +h .\data >>Nul
md .\data\Usuarios >>Nul
attrib +h .\data\Usuarios >>Nul
cd .\data >>Nul
move ..\..\\inicio.bat >>Nul
move ..\..\iniciarsesion.bat >>Nul
move ..\..\crearusuario.bat >>Nul
md ..\launcher >>Nul
cd .. >>Nul
md .\data\Carpetaprivada >>Nul
attrib +h .\data\Carpetaprivada >>Nul
cd .\launcher >>Nul
attrib +h ..\launcher >>Nul
move ..\..\ord.bat >>Nul
cd .. >>Nul
start.bat