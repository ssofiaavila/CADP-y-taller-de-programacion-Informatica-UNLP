/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

Agendar al paciente P en el primer día y turno libre. Retornar un string con el día y turno asignados. Asuma que hay un turno libre.
 */
package parciales;

/**
 *
 * @author Sofia
 */
public class Agenda4 {
    private Paciente4[][] registro;
    private int[] dimL;

    public Agenda4(){
        int i,j;
        for (i=0;i<6;i++){
            for (j=0;j<5;j++){
                registro[i][j]=null;
            }
        }
        dimL= new int[5];
        for (i=0;i<5;i++)
           dimL[i]=0;
    }
    public void agendarPaciente( Paciente p){
        int i=0;
        while ((i<5)){
            if (dimL[i] < 6){
                this.registro[dimL[i]][i]=p; 
                dimL[i]++;
                int dia=i+1;
                System.out.println("Turno para el dia "+ dia + " en el turno "+ dimL[i]);
                i=5;
            }
            else
                i++;
        }
    }
    
    /*Dado un día D y turno T, liberar ese turno. Asuma que D y T son válidos.*/
    public void liberarTurno(int dia,int turno){
        registro[turno][dia]=null;
    }
    
    /*- Calcular y devolver el turno (es decir, horario) con más pacientes agendados.*/
    public int turnoConMasPacientes(){
        int max,cant,i,j;
        max=0;
        for (i=0;i<6;i++){
            cant=0;
            for (j=0;j<5;j++){
                if (registro[i][j] != null)
                    cant++;
            }
            if (cant>max)
                max=i;
                
        }
        return max;
    }
}
