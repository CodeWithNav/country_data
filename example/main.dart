import 'package:country_data/country_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CountryData countryData = CountryData();
  List<Country> countries = [];
  List<String> states = [];
  List<String> cities = [];
  @override
  initState() {
    super.initState();
    initCountries();
  }

  Country? selectedCountry;
  late String selectedState;
  late String selectedCity;

  void initCountries() {
    countries = countryData.getCountries();
    selectedCountry = countries[0];
    initCountryStates();
  }

  // select country
  void selectCountry({required String countryId}) {
    selectedCountry = countryData.getCountryById(countryId: countryId);
    if (selectedCountry != null) {
      initCountryStates();
      setState(() {});
    }
  }

  void initCountryStates() {
    // select state
    states = countryData.getStates(countryId: selectedCountry!.id);
    if (states.isEmpty) states = [selectedCountry!.name];
    selectedState = states[0];
    setState(() {});
    initCities();
  }

  void selectState({required String state}) {
    selectedState = state;
    initCities();
    setState(() {});
  }

  void initCities() {
    cities = countryData.getCities(
        countryId: selectedCountry!.id, state: selectedState);
    if (cities.isEmpty) cities = [selectedState];
    selectedCity = cities[0];
    setState(() {});
  }

  void selectCity({required String city}) {
    selectedCity = city;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Select Country ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCountry!.id,
                    hint: const Text('India'),
                    items: countries
                        .map((country) => DropdownMenuItem<String>(
                              value: country.id,
                              child: Text(
                                '${country.emoji} ${country.name}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    onChanged: (countryId) {
                      if (countryId != null) {
                        selectCountry(countryId: countryId);
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Select State ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: DropdownButton<String>(
                      value: selectedState,
                      items: states
                          .map((state) => DropdownMenuItem<String>(
                                value: state,
                                child: Text(state),
                              ))
                          .toList(),
                      onChanged: (state) {
                        if (state != null) selectState(state: state);
                      }),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Select City ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: DropdownButton<String>(
                      value: selectedCity,
                      items: cities
                          .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      onChanged: (city) {
                        if (city != null) selectCity(city: city);
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
