import 'package:weather_app/app/data/enums.dart';

class ConversionUtil {
  ConversionUtil._();

  static String getTemperatureShortUnit(UnitOptions unit) =>
      unit == UnitOptions.m ? '°C' : '°F';

  static String getTemperatureLongUnit(UnitOptions unit) =>
      unit == UnitOptions.m ? 'Celsius' : 'Fahrenheit';

  static String getWindUnit(UnitOptions unit) =>
      unit == UnitOptions.m ? 'Kilometers/Hour' : ' Miles/Hour';
}
