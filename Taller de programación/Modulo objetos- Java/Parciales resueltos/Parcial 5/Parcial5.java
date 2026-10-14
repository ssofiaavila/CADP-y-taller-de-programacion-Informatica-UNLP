/*
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
e) Obtener la representación string del grupo, la cual se compone por el ID,
última glucosa y última dosis de todos los pacientes del grupo
3) Realice un programa que instancie un Grupo Alfa y un Gru po Beta. Llene cada grupo con
pacientes (el primero con 3 y el segundo con 4). Aplique una dosis D de fármaco (leída por
teclado) a los pacientes de cada grupo. Imprima la representación string de cada grupo.
 */
package parciales;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Sofia
 */
public class Parcial5 {
    public static void main(String[]args){
        GrupoAlfa alfa=new GrupoAlfa();
        GrupoBeta beta=new GrupoBeta();
        
        int i;
        for (i=0;i<3;i++){
            String nombre=GeneradorAleatorio.generarString(10);
            double dosis=GeneradorAleatorio.generarDouble(3);
            double glucosa= GeneradorAleatorio.generarDouble(4);
            Diabetico d1= new Diabetico(nombre,dosis,glucosa);
            alfa.agregarPaciente(d1);
        }
        for (i=0;i<4;i++){
            String nombre=GeneradorAleatorio.generarString(10);
            double dosis=GeneradorAleatorio.generarDouble(3);
            double glucosa=GeneradorAleatorio.generarDouble(3);
            Diabetico d2= new Diabetico(nombre,dosis,glucosa);
            beta.agregarPaciente(d2);
        }
        alfa.aplicarFarmaco(1);
        beta.aplicarFarmaco(3);
        System.out.println("Alfa: ");
        alfa.imprimirPacientes();
        System.out.println("Beta: ");
        beta.imprimirPacientes();
        
        
    }
}
