import 'country.dart';
import 'country_code_to_symbol.dart';

class CountriesInfo {
  final dynamic _data;
  static const currencyCodeToSymbol = CurrencyCodeToSymbol();
  CountriesInfo(this._data);
  // return country details based on countryId
  Country? getCountryById({required String countryId}) {
    final country = _data[countryId];
    if (country == null) return null;
    return Country.fromJson({"countryCode": countryId, ...country});
  }

  /// return list of countries
  List<Country> getCountries() {
    List<Country> res = [];
    final countries = _data as Map<String, dynamic>;
    countries.forEach((key, value) {
      res.add(Country.fromJson({"countryCode": key, ...value}));
    });
    return res;
  }

  /// return list of Cities based on provided CountryId and State.
  List<String> getCities({required String countryId, required String state}) {
    List<String> res = [];
    List<dynamic> cities = _data[countryId]["states"][state] as List<dynamic>;
    for (var element in cities) {
      res.add(element["name"]);
    }
    return res;
  }

  /// return list of states based on provided countryId
  List<String> getStates({required String countryId}) {
    List<String> res = [];
    final states = _data[countryId]["states"] as Map<String, dynamic>;
    states.forEach((key, value) {
      res.add(key);
    });
    return res;
  }
}
