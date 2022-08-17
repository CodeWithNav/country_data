import 'country_info.dart';

class Country {
  late String id;
  late String name;
  late String native;
  late String phone;
  late String capital;
  late String currency;
  late String emoji;
  late String emojiU;
  late String currencyCode;
  Country.fromJson(json) {
    id = json["countryCode"];
    name = json["name"];
    phone = json["phone"];
    native = json["native"];
    currencyCode = json["currency"];
    currency = CountriesInfo.currencyCodeToSymbol.getSymbol(json["currency"]);
    emoji = json["emoji"];
    capital = json["capital"];
    emojiU = json["emojiU"];
  }
}
