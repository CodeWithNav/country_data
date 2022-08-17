import 'package:country_data/country_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('check country', () {
    Country? country = CountryData().getCountryById(countryId: 'IN');
    assert(country!.name == "India");
  });
}
