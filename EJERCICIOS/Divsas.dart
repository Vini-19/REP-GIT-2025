void main(){

    double euro = 29.33;
    double dolar = 26.09;

    print('Elige la opcion de conversion');
    print('1.Dolar');
    print('2.Euro');
    String? opcion = stdin.readLineSync();

    switch(opcion){
        case '1':
            print('ingrese la cantidad en lempiras para convertir a dolar');
            String? valor = stdin.readLineSync();
            double cant_moneda = double.tryParse(valor??);
            double resultado = cant_moneda*dolar;
            print('$cant_moneda es equivalente a $resultado');
            break;
        case '2':
            print('ingrese la cantidad en lempiras para convertir a euro');
            String? valor = stdin.readLineSync();
            double cant_moneda = double.tryParse(valor??);
            double resultado = cant_moneda*euro;
            print('$cant_moneda es equivalente a $resultado');
            break;
        default;
        print('opcion no valida');
    }


}