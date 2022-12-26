programa Parcial10
areas
  general:AreaPC(10,10,20,20)
  areaFiscal:AreaP(4,1,4,1)
  areaR1:AreaP(1,1,1,1)
  areaR2:AreaP(2,1,2,1)
  areaR3:AreaP(3,1,3,1)
robots
  robot fiscal
  variables
    idMax,idAux,total,cantAux:numero
  comenzar
    total:=-1
    EnviarMensaje(1,r1)
    EnviarMensaje(2,r2)
    EnviarMensaje(3,r3)
    repetir 3
      RecibirMensaje(idAux,*)
      si idAux=1
        RecibirMensaje(cantAux,r1)
      sino
        si idAux=2
          RecibirMensaje(cantAux,r2)
        sino
          RecibirMensaje(cantAux,r3)
      si cantAux> total
        total:=cantAux
        idMax:=idAux
    Informar(idMax)
    Informar(total)
  fin
  robot corredor
  variables
    cant,id,miAv,miCa,caRandom,avRandom:numero
  comenzar
    cant:=0
    miAv:=PosAv
    miCa:=PosCa
    RecibirMensaje(id,jefe)
    repetir 3
      Random(avRandom,10,20)
      Random(caRandom,10,20)
      BloquearEsquina(avRandom,caRandom)
      Pos(avRandom,caRandom)
      mientras HayFlorEnLaEsquina
        tomarFlor
        cant:=cant+1
      Pos(miAv,miCa)
      LiberarEsquina(avRandom,caRandom)
    EnviarMensaje(id,jefe)
    EnviarMensaje(cant,jefe)
  fin
variables
  jefe:fiscal
  r1,r2,r3:corredor
comenzar
  AsignarArea(jefe,areaFiscal)
  AsignarArea(r1,areaR1)
  AsignarArea(r1,general)
  AsignarArea(r2,areaR2)
  AsignarArea(r2,general)
  AsignarArea(r3,areaR3)
  AsignarArea(r3,general)
  Iniciar(jefe,4,1)
  Iniciar(r1,1,1)
  Iniciar(r2,2,1)
  Iniciar(r3,3,1)
fin