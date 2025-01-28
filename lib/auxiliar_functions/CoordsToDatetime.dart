  int graus(double value){

    return value.floor();
  }

  int minutos(double value){

    return ((value - value.floor())*60).floor();
  }

  int segundos (double value){
    return ((((value - value.floor())*60) - ((value - value.floor())*60).floor())*60).floor();
  }
 