1. La UNLP desea un sistema que le permita administrar sus proyectos, investigaciones y subsidios. Un proyecto tiene un nombre, un código, un directos y
los investigadores que participan en el proyecto (hasta 50 como máximo). De cada investigador se desea saber su nombre, apellido, categoría (1 a 5) y su especialidad. 
Cualquier investigador puede pedir hasta un máximo de 5 subsidios. De cada subsidio se desea saber el monto pedido, el motivo y si fue otorgado o no.
a. Implemente el modelo de clases teniendo en cuenta:
i. Un proyecto solo debería poder construirse con el nombre y el código
ii. Un investigador solo debería poder construirse con nombre y apellido, categoría y especialidad
iii. Un subsidio solo debería poder construirse con el monto solicitado y el motivo. Un subsidio siempre se crea en estado no otorgado.
b. Implemente métodos (en las clases correspondientes) que permitan:
i. Void agregarInvestigador( unInvestigador) //agrega un investigador a un proyecto
ii. Void agregarSubsidio(unSubsidio) //agrega un subsidio a un investigador
iii. Double dineroTotalOtorgado () //devuelve la cantidad de dinero de todos los subsidios otorgados a todos los investigadores de un proyecto
iv. Int cantidadDeSubsidios (String nombre y apellido) //devuelve la cantidad de subsidios (otorgados o no) solicitador por el investigador llamado *nombre y apellido*
v. Void otorgarTodos (String nombre y apellido) // otorga todos los subsidios pendientes que tiene el investigador llamado *nombre y apellido*
vi. String toString () // devuelve un string que tiene el nombre del proyecto, su código, el nombre y apellido del director, el total de dinero otorgado y el nombre y 
apellido de cada investigador. 
Para cada investigador, además, se debe agregar la categoría del mismo y el dinero de sus subsidios otorgados
NOTA: puede crear todos los métodos auxiliares que considere necesario
c. Escriba un programa principal que instancie un proyecto con un director y dos investigadores. Asigne dos subsidios a cada investigador y otorgue los subsidios del
primero de ellos, luego imprima todos los datos del toString pedido.


2. Representar un concurso de baile. El concurso tiene a lo sumo N parejas. Cada pareja tiene 2 participantes y un estilo de baile. De los participantes se tiene DNI, 
nombre y edad.
a. Genere las clases necesarias. Provea constructores para iniciar: el concurso para un máximo de N parejas (inicialmente sin parejas cargadas), las parejas y los 
participantes a partir de toda su información.
b. Implemente métodos en las clases adecuadas para permitir:
i. Agregar una pareja al concurso. Asuma que hay lugar
ii. Obtener la diferencia de edad de la pareja
iii. Obtener la pareja con mas diferencia de edad del concurso
c. Realice un programa que instancie un concurso, cargue 2 parejas y a partir del concurso, muestre: los nombres de los participantes de la pareja con más diferencia de edad.


3. Una escuela de música necesita un sistema para realizar un concurso entre sus alumnos. El concurso está dividido en 5 géneros musicales y en cada genero se pueden inscribir
hasta N alumnos como máximo. De cada alumno se registra su nombre, edad, instrumento que toca y puntaje obtenido.
a. Genere las clases necesarias. Implemente constructores para iniciar el concurso sin alumnos inscriptos, recibiendo N (el máximo de alumnos por género musical). Los alumnos
deben instanciarse dando valor a todos sus atributos y con puntaje -1
b. Implemente métodos en las clases que corresponda permitir:
i. Dado un alumno y un género musical valido, inscriba al alumno en dicho género. Asuma que hay lugar
ii. Dado un puntaje y un nombre de alumno, asigne el puntaje a dicho alumno. NOTA: el alumno podría no estar inscripto en el concurso
iii. Devolver el alumno que haya obtenido el mayor puntaje en todo el concurso
c. Realice un programa que instancie un concurso con un máximo de 20 alumnos por género. Instancie 5 alumnos e inscriba a cada uno en algún género musical. Asigne puntaje
a cada uno. Imprima el resultado de la consulta pedida

4. Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) 
del día, la información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene obra social y costo a abonar por la sesión.
a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; los pacientes a partir de toda su información.
b) Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en el primer día y turno libre. Retornar un string con el día y turno asignados. Asuma que hay un turno libre.
-Dado un día D y turno T, liberar ese turno. Asuma que D y T son válidos.
- Calcular y devolver el turno (es decir, horario) con más pacientes agendados.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. Libere turnos agendados.
Para finalizar, imprima el resultado del inciso b.iii.

5. Un Laboratorio realiza experimentos para evaluar la eficacia de un nuevo fármaco para
la diabetes y para ello conformó dos grupos de pacientes: Grupo Alfa y Grupo Beta.
Ambos grupos registran la información de a lo sumo 10 pacientes (identificados de 1 a 10). De cada
paciente se guarda: nombre, último resultado de glucosa (double) y última dosis recibida de fármaco
(double). Sin embargo, los grupos difieren en la forma de aplicar el fármaco a los pacientes (esto se
detalla más adelante)
1) Genere las clases necesarias, cada una con los constructores, estado, getters y setters
adecuados. Tenga en cuenta que los grupos inicialmente no tienen pacientes.
2) Agregue a la clases que corresponda los métodos necesarios para:
a) Agregar un paciente P al grupo y retornar su número identificatorio en el grupo (ID).
b) Obtener un paciente del grupo dado un ID válido (1 a 10).
c) Aplicar una dosis a un paciente. Se recibe una dosis D (double) y se debe modificar su
última dosis recibida a D y disminuir la glucosa en un valor aleatorio entre 0 y 1.
d) Aplicar una dosis D (double) de fármaco a los pacientes del grupo, teniendo en cuenta
que: en el Grupo Alfa se le aplica la dosis D a todos los pacientes; en el Grupo Beta se
le aplica la dosis D a los pacientes cuya glucosa supera el valor 2.5.
e) Obtener la representación string del grupo, la cual se compone por el ID,. nombre,
última glucosa y última dosis de todos los pacientes del grupo
3) Realice un programa que instancie un Grupo Alfa y un Grupo Beta. Llene cada grupo con
pacientes (el primero con 3 y el segundo con 4). Aplique una dosis D de fármaco (leída por
teclado) a los pacientes de cada grupo. Imprima la representación string de cada grupo.


6. Queremos representar dos tipos de urnas electrónicas: electorales (usada en elecciones
donde se presentan varias listas) y de referéndum (usada para saber si la población está a favor/en
contra de la aprobación de una ley).
● Cualquier urna se caracteriza por su número de urna y un contador de votos en blanco.
● Una urna electoral es una urna que se caracteriza además por la cantidad de listas existentes y
por mantener un contador de votos para cada lista (son “L” listas, y están numeradas desde 0).
● Una urna de referéndum es una urna que se caracteriza además por mantener un contador de
votos a favor y un contador de votos en contra.
A) Realice el modelo de clases. Implemente las clases con sus atributos y métodos para
obtener/modificar el valor de aquellos que considere adecuado.
B) Implemente constructores. El constructor de las urnas electorales recibe dos números “U” y “L” e
inicia el número de urna a “U”, la cant. de listas a “L”, y todos los contadores de votos a 0. El
constructor de las urnas de referéndum recibe un nro. “U” e inicia el número de urna a “U” y todos sus
contadores de votos a 0.
C) Incorpore los métodos listados a continuación:
i. Cualquier urna debe saber responder al mensaje votarEnBlanco que incrementa en 1 el contador
de votos en blanco.
ii. Las urnas electorales deben responder a los mensajes:
● validarNumeroDeLista: recibe un nro. “N” y devuelve un boolean indicando si N es un nro. de lista
válido.
● votarPorLista: recibe un nro. de lista válido “I” y debe incrementar en 1 el contador de votos de
esa lista.
● devolverVotosPorLista: recibe un nro de lista válido “I” y devuelve la cantidad de votos para esa
lista.
iii. Las urnas de referéndum deben responder a los mensajes:
● votarAFavor: incrementa en 1 el contador de votos a favor.
● votarEnContra: incrementa en 1 el contador de votos en contra.
iv. Ambos tipos de urnas deben saber responder al mensaje calcularGanador pero de manera
diferente:
● Para las urnas electorales debe devolver el nro. de la lista ganadora. En caso de empate entre 2
o más listas, se elegirá una como ganadora – indistintamente.
● Para las urnas de referéndum debe devolver un nro. -1 si hubo empate, 0 si ganó la opción En
Contra, 1 si gano la opción A Favor.
v. Ambos tipos de urnas deben saber responder al mensaje calcularTotalVotos pero de manera
diferente:
● Para las urnas electorales debe devolver la suma de votos en blanco y votos a favor de cada
lista.
● Para las urnas de referéndum debe devolver la suma de votos en blanco, a favor y en contra.
II) Realice un programa que instancie una urna electoral para la mesa “203” con 5 listas y una urna
de referéndum para la mesa “203”. Luego, lea DNIs de personas que llegan a votar a la mesa, hasta
que se ingresa el DNI 0. Cada persona vota en ambas urnas de la siguiente manera. Para la urna
electoral, la persona ingresa un nro. “N”: si “N” corresponde a una lista válida se debe votar por la
lista “N” y en caso contrario se debe votar en blanco. Para la urna de referéndum, la persona ingresa
un número “M”: si “M” es positivo se debe votar a favor, si es negativo se debe votar en contra, y si
es 0 debe votar en blanco. Al finalizar la votación, calcular la opción ganadora en ambas urnas y
mostrar el resultado en consola. Además mostrar para cada urna el porcentaje de votos que obtuvo
la opción ganadora respecto al total de votos.
