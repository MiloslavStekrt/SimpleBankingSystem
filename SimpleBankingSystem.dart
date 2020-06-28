import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(){
  var ChackNoris =new ucet(1923, "Chack Noris");
  ChackNoris.login();
}
class ucet {
  var Account =0, pin = 0, jmeno = '', Cart = 0, lastMoney = 0, zmenaStavu = null, rozdelka = '\n=====================\n';
  Random r = new Random();
  ucet(rpin,rjmeno){
    print('Vase Carta je: $Cart');
    if(rpin <= 999){
      print('Pin je moc kratky ... ');
      rpin  = int.parse(stdin.readLineSync(encoding: utf8));
    }else if(rpin >= 10000){
      print('P je moc dlouhy ...');
      rpin = int.parse(stdin.readLineSync(encoding: utf8));
    }
    jmeno = rjmeno;
    pin = rpin;
    Cart = 100000+r.nextInt(999999-100000);
  }

  menu(){
    print(rozdelka);
    print("Vyberte moznost z menu \n1.stav uctu\n2.pridat\n3.vybrat\n4.last transaction");
    var Option = int.parse(stdin.readLineSync(encoding: utf8));
    print(rozdelka);
    switch(Option){
      case 1:
        print(ActualniStav());
        break;
      case 2:
        print(vlozitPenize(true));
        break;
      case 3:
        print(vybratPenize(true));
        break;
      case 4:
        print(lastTransaction());
        break;
      case 5:
        exit(0);
        break;
      default:
        menu();
        break;
    }
  }

  login(){
    print('Dobry den, vyta vas Bankomat \nRastantule od spolecnosti SaLa');
    var enterPin = int.parse(stdin.readLineSync(encoding: utf8));
    if(enterPin == pin)while(true) menu();
    else main();
  }

  String ActualniStav() => 'Aktualni stav uctu je: $Account';

  String vlozitPenize(bool getBack) {
    if(getBack) lastMoney = int.parse(stdin.readLineSync(encoding:  utf8));
    zmenaStavu = '+';
    return 'Na ucet bylo pripsano $lastMoney';
  }

  String vybratPenize(bool getBack) {
    if(getBack) lastMoney = int.parse(stdin.readLineSync(encoding:  utf8));
    zmenaStavu = '-';
    return 'Bylo vybrano $lastMoney';
  }

  String lastTransaction(){
    if(zmenaStavu == '+') return vlozitPenize(false);
    else if(zmenaStavu == '-') return vybratPenize(false);
  }
}