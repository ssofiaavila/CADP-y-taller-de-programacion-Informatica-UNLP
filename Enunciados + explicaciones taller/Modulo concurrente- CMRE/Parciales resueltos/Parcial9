programa Parcia9
areas
  inicioJefe:AreaP(1,1,1,1)
  areaR1:AreaP(2,2,7,7)
  areaR2:AreaP(8,2,13,7)
  areaR3:AreaP(14,2,19,7)
robots
  robot fiscal
  variables
    cant,aux,total:numero
  comenzar
    cant:=0
    repetir 3
      RecibirMensaje(aux,*)
      cant:=cant+aux
    Informar(cant)
  fin
  robot corredor
  variables
    cant,miAv,miCa,avRandom,caRandom:numero
  comenzar
    cant:=0
    miAv:=PosAv
    miCa:=PosCa
    repetir 3
      Random(avRandom,0,5)
      Random(caRandom,0,5)
      avRandom:=avRandom+miAv
      caRandom:=caRandom+miCa
      Pos(avRandom,caRandom)
      mientras HayFlorEnLaEsquina
        tomarFlor
        cant:=cant+1
      Pos(miAv,miCa)
    EnviarMensaje(cant,jefe)
  fin
variables
  jefe:fiscal
  r1,r2,r3:corredor
comenzar
  AsignarArea(jefe,inicioJefe)
  AsignarArea(r1,areaR1)
  AsignarArea(r2,areaR2)
  AsignarArea(r3,areaR3)
  Iniciar(jefe,1,1)
  Iniciar(r1,2,2)
  Iniciar(r2,8,2)
  Iniciar(r3,14,2)
fin