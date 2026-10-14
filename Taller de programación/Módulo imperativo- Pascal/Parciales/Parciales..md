1. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. Se desea procesar la información de una semana. Se pide:
a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (1..7), código de la obra, asiento, monto. La lectura finaliza con el código de 
obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente
b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente
c. Realice un módulo recursivo que informe el contenido de la lista generada en b)



2. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. Implementar un programa que
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y 
valor de la expensa. La lectura finaliza cuando llega el código de identificación -1
b. Ordene el vector, aplicando el método de inserción, para obtener el vector ordenado por código de identificación de la oficina
c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector.
En caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario, informar que el código buscado no existe


3. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta
a. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación
(2010..2018), marca y modelo
b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la cantidad de autos de dicha marca que posee la agencia. Mostrar resultado
c. Contenta un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación
d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado


4. En un colegio secundario, cada alumno participa de un proyecto de ciencias. El proyecto de un alumno pertenece a un tópico (volcanes, vida marina, migración de las aves, 
etc.). Un mismo alumno pudo haber presentado más de un proyecto (en distintos tópicos). En la última hora del evento, las personas visitantes pueden votar el proyecto 
del alumno que más le gustó.
a. Realice un programa para el sistema de votación. Un voto consiste en el nombre del alumno y el tópico en el cual pertenece el proyecto
b. Almacene esta información en una estructura óptima para la búsqueda, ordenada por nombre de alumno. Para cada alumno, almacene todos sus proyectos ordenados por tópico.
c. Al finalizar la carga (se lee el alumno ‘zzz’) se debe informar:
i. Cuál fue el proyecto ganador: nombre del alumno, tópico y cantidad de votos
ii. Número de votos totales, es decir la suma de los votos de todos los proyectos en los que participa un alumno, ordenados alfabéticamente por nombre de alumno



5. Una caja de supermercados registra las cantidades vendidas de sus productos en stock del lunes al viernes de una semana particular. Implementar un programa que:
a. Genere 5 listas ordenadas por el código de producto de forma ascendente con los productos vendidos cada uno de los días de semana. De cada producto se conoce código de producto, cantidad vendida y código de cliente. La lectura finaliza cuando se lee el código de producto -1. Tener en cuenta que un producto puede ser vendido, en distintos días de esa semana y también más de una vez en el mismo día
b. Genere una nueva lista que contenga para cada código de producto, la cantidad total vendida en la semana. Esta lista debe quedar ordenada por código de producto, en forma ascendente
c. Invoque a un módulo recursivo que recibe la lista generada en b) y devuelve el código de producto que más se vendió en esa semana



6. Una pizzería recibe pedidos telefónicos de sus clientes. De cada pedido interesa conocer: DNI del cliente, nombre, fecha y monto a abonar por el pedido.
a. Lea la información de los pedidos telefónicos hasta ingresar uno con monto 0. A partir de esto, genere una estructura que almacene para cada DNI de cliente, 
su nombre y una lista con información de la fecha y monto de pedidos realizados. La estructura debe estar ordenada por DNI y ser eficiente para la búsqueda por dicho 
criterio. A partir de la estructura generada en 1) realice módulos independientes para
b. Informar la cantidad de clientes que realizaron pedidos en una fecha que se lee de teclado
c. Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide con uno ingresado


7. Se desea procesar información de los viajes de una agencia de remises. De cada viaje se conoce número identificador del remis, código de localidad de destino, 
fecha y costo del viaje. Se pide implementar un programa que:
a. Invoque a un módulo que a partir de la lectura (que finaliza con la localidad de destino ‘xxx’) de los viajes de la agencia, genere un árbol binario ordenado donde
para cada destino se contenga información de la cantidad de viajes realizados a ese destino. El árbol debe ser eficiente para la búsqueda por código de destino,
b. Lea un valor que representa el código de destino e invoque a un módulo que reciba el árbol generado en a) y el valor leído y retorne la cantidad de viajes realizados
a ese destino. El programa debe informar el resultado obtenido
c. Lea un código de destino e invoque a un módulo que reciba el árbol generado en a) y el código leído y retorne la cantidad de viajes realizados a todos los códigos de 
destino inferiores al código leído. El programa debe informar el resultado


8. Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los clientes. Implementar un programa en Pascal con:
a. Un módulo que lea la información de las asistencias realizadas en cada sucursal y que genere un árbol ordenado por código de cliente, donde cada nodo contenga código
de cliente, DNI del cliente y la cantidad de asistencias realizadas en todas las
sucursales. De cada asistencia se lee: código de sucursal (1.5), DNI del cliente, código del cliente, fecha y cantidad de minutos que asistió. La lectura finaliza con 
el código de cliente -1, el cual no se procesa.
b. Un módulo que reciba el árbol generado en a) y un código de cliente y devuelva una lista con los códigos de los clientes cuyo código es menor al código ingresado y
el DNI es par.


9. Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 
5: no tiene) y costo abonado por sesión. Implemente un programa que:
a. Genere un ABB ordenado por cód. de paciente. Para ello, genere información hasta el paciente con dni 0. A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con código y dni de los pacientes de osde, sabiendo que cómo máximo son 100. La estructura debe ordenarse por código ascendentemente.
c) Dado un código de paciente, aumentar el costo abonado por sesión en un monto recibido. Considere que el paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.


10. Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno
5: no tiene) y costo abonado
por sesión. Implemente un programa que:
a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con dni 0. A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con dni y cód. de paciente de los pacientes de ioma, ordenados por dni descendente.
c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.

11. Implementar un programa que procese la información de los participantes a un concurso
de preguntas y respuestas. De cada participante se lee el código de participante, código de ciudad de
origen y edad. El ingreso de los participantes finaliza cuando se lee el código -1.
Implementar un programa que:
a) Genere un ABB a partir de la información leída, ordenado por código de participante.
b) Contenga un módulo que reciba el árbol generado en a) y un código de ciudad y retorne una lista
con los participantes de esa ciudad.
c) Invoque al módulo de b) y luego muestre el contenido de la lista resultante utilizando un módulo
recursivo.
d) Muestre la cantidad de participantes cuyos códigos están comprendidos entre dos valores
determinados. Para ello implementar un módulo que reciba el árbol generado en a) y dos valores y
devuelva la cantidad pedida.
e) Informe la edad promedio de los participantes del concurso.


12. Una familia de 4 integrantes llevan registro de sus gastos (tipo de gasto y monto
gastado). Se pide:
a) Generar una estructura que almacene los gastos de los integrantes de la familia, agrupados según
el integrante. Por cada integrante, se leen gastos hasta tipo de gasto ‘zzz’. Los gastos de cada
integrante deben ordenarse por tipo de gasto.
b) Imprimir la estructura generada en a.
c) A partir de la estructura generada en a, realice un merge para obtener los montos totales gastados
por cada tipo de gasto. Genere un ABB con monto total y tipo de gasto, ordenado por monto total.
d) A partir del ABB, busque e imprima el tipo de gasto con mayor monto total.



13. Una perfumería dispone en papel de la información de las ventas de sus productos. De
cada venta conoce: código de producto, tipo de producto, fecha, cantidad de unidades vendida y
monto.
Se pide realizar un programa que:
a) A partir de la información de ventas ingresadas por teclado, genere un ABB que almacene para
cada código de producto: su tipo, la cantidad total de unidades vendidas y el monto total vendido
(entre todas las ventas realizadas). El ABB debe ordenarse por código de producto. El ingreso de
información finaliza cuando se lee cantidad vendida 0.
b) Luego de generado el ABB, informar (implementar un módulo para cada inciso):
i - El tipo de los productos cuyo código está comprendido entre los valores 1500 y 2200.
ii – La cantidad de productos con monto total vendido comprendido entre 10000 y 50000.
