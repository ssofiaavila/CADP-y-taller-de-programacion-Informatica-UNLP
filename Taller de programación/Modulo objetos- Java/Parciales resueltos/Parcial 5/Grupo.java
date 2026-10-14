/*
a) Agregar un paciente P al grupo y retornar su número identificatorio en el grupo (ID).
b) Obtener un paciente del grupo dado un ID válido (1 a 10).
c) Aplicar una dosis a un paciente. Se recibe una dosis D (double) y se debe modificar su
última dosis recibida a D y disminuir la glucosa en un valor aleatorio entre 0 y 1.
 */
package parciales;

/**
 *
 * @author Sofia
 */
public abstract class Grupo {
    private Diabetico[] pacientes;
    private int dimL;

    public Grupo() {
        this.pacientes = new Diabetico[10];
        int i;
        for (i=0;i<dimL;i++){
            pacientes[i]=null;
        }
        this.dimL=0;
    }

    public int getDimL() {
        return dimL;
    }
    
    public void agregarPaciente(Diabetico p1){
        pacientes[dimL]=p1;
        dimL++;
        System.out.println("Su id es "+ dimL);
        
        }
    public Diabetico obtenerPaciente(int id){
        if (id<= dimL){
            return pacientes[id];
        }
        else
            return null;
    }
    public abstract void aplicarFarmaco(double dosis);
    public void imprimirPacientes(){
        String aux= "Pacientes ";
        int i;
        for (i=0;i<dimL;i++){
            if (pacientes[i]!= null){
                aux=aux+ "Nombre: "+ pacientes[i].getNombre()+ "ID: "+ i+ " Dosis "+ pacientes[i].getDosis()+ " Glucosa: "+ pacientes[i].getGlucosa();
            }
        }
        System.out.println(aux);
    }
}

   
