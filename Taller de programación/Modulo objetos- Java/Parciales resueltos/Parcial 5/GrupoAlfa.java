/*
 en el Grupo Alfa se le aplica la dosis D a todos los pacientes
 */
package parciales;

/**
 *
 * @author Sofia
 */
public class GrupoAlfa extends Grupo{

    public GrupoAlfa() {
        super();
    }
    
    public void aplicarFarmaco(double dosis){
        int i,dimL=super.getdimL();
        for (i=0; i< dimL;i++){
            super.obtenerPaciente(i).setDosis(dosis);
        }
             
    }

    
    
}
