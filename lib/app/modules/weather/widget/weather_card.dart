import 'package:flutter/material.dart';
import 'package:weather_app/app/data/enums.dart';
import 'package:weather_app/app/modules/weather/model/weather/weather.dart';
import 'package:weather_app/app/utils/conversion_util.dart';
import 'package:weather_app/app/utils/date_util.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.weather, required this.width})
      : super(key: key);
  final Weather weather;
  final double width;

  @override
  Widget build(BuildContext context) {
    UnitOptions unit = weather.request?.unit == UnitOptions.m.name
        ? UnitOptions.m
        : UnitOptions.f;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      weather.location?.name ?? '',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      weather.location?.country ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black54),
                    ),
                    Text(
                      weather.location?.localtime?.time ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.blueGrey),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${weather.current?.temperature ?? 0}${weather.request?.unit == UnitOptions.m.name ? '°C' : '°F'}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      weather.location?.localtime?.weekdayName ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black54),
                    ),
                    Text(
                      'Feels like ${weather.current?.feelslike ?? 0}${weather.request?.unit == UnitOptions.m.name ? '°C' : '°F'}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.blueGrey),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipOval(
                child: Image.network(
                  weather.current?.weatherIcons?.first ?? '',
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const CircularProgressIndicator(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                weather.current?.weatherDescriptions?.first ?? '- -',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Temperature : ${weather.current?.temperature ?? 0} ${ConversionUtil.getTemperatureLongUnit(unit)}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Humidity : ${weather.current?.humidity ?? 0}%',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Pressure : ${weather.current?.pressure ?? 0} Millibar',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Wind speed : ${weather.current?.windSpeed ?? 0} ${ConversionUtil.getWindUnit(unit)}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
