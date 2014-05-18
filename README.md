La arquitectura de este proyecto es la siguinte:

- en el root folder (my_lib) encuentras:


mongoid.yml - Configuration for mongo . TODO --> mover a un paquete de configuraciones
my_lib - file that implements a fake fachade to call the delegates methods (reddit, voice bunny and mongo)
call.rb - is like a java main class to call the action:


call file call.rb 

ruby call.rb in the my_lib folder

- in the code folder (my_lib/my_lib)

Encuentras delegates para cada metodo y la clase de MongoId para almacenar los resultados

Aunque no se implementan interfaces y patrones por razones de tiempo la idea fue distribuir las clases en unidades de responsabilidad funcional (modulos)

fachade - delegate (de una manera fake por ser una prueba)


