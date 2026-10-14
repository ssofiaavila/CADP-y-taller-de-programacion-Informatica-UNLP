/*
 4. Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u de los 5 días de atención y 
c/u de los 6 turnos (horarios) del día, la información del paciente que tomó el turno. De los pacientes guarda: nombre, 
si tiene obra social y costo a abonar por la sesión.
a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; los pacientes a partir de toda
su información.
b) Lea atentamente y luego implemente métodos que permitan:
    - Agendar al paciente P en el primer día y turno libre. Retornar un string con el día y turno asignados. Asuma que hay un turno libre.
    -Dado un día D y turno T, liberar ese turno. Asuma que D y T son válidos.
    - Calcular y devolver el turno (es decir, horario) con más pacientes agendados.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. Libere turnos agendados.
Para finalizar, imprima el resultado del inciso b.iii.
 */
package parciales;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Sofia
 */
public class Parcial4 {
    public static void main(String[] args) {
        Agenda4 a1= new Agenda4();
        int i;
        for (i=0;i<12;i++){
            Paciente4 p1=new Paciente4(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarBoolean(),GeneradorAleatorio.generarDouble(500));
            a1.agendarPaciente(p1);
        }
        System.out.println(a1.turnoConMasPacientes());
    }
    
}
