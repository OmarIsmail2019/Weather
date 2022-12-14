import 'package:elgaw/model/weather_model.dart';
import 'package:elgaw/screens/SearchHome.dart';
import 'package:elgaw/view_model/weather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return BlocProvider(
        create: (context) => WeatherCubit(),
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (text) async {
                  cityName = text;
                  WeatherCubit.get(context).getWeatherByCity(city: cityName);
                  WeatherModel weather = await WeatherCubit.get(context)
                      .getWeatherByCity(city: cityName);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchHome()));
                  },
                  child: const Text('Search'))
            ],
          ),
        ));
  }
}

