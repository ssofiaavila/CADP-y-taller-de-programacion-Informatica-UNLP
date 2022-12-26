/*
en el Grupo Beta se le aplica la dosis D a los pacientes cuya glucosa supera el valor 2.5.
 */
package parciales;

/**
 *
 * @author Sofia
 */
public class GrupoBeta extends Grupo{

    public GrupoBeta() {
        super();
    }
    public void aplicarFarmaco(double dosis){
        int i;
        for (i=0;i< super.getDimL();i++){
            if (super.obtenerPaciente(i).getGlucosa()>= 2.5){
                super.obtenerPaciente(i).setGlucosa(dosis);
            }
        }
    }
    
}
