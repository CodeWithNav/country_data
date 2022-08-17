# Country Data
A Package That Provide Country Data Like Name, PhoneCode, Currency, States and Cities etc.
Purely Written in Dart.
![example](https://github.com/CodeWithNav/country_data/blob/main/git_data/example.gif)
## Features
* Get List of Countries
```dart
    List<Country> countries = CountryData().getCountries();
```
* Get Country
```dart
    Country? country = CountryData().getCountryById(countryId:'IN');
    // Country Class contains county information.
     String id; // country id
     String name; // country name
     String native; // country native/language
     String phone; // country phone Code
     String capital; // country capital
     String currency; // country currency symbol
     String emoji; // country flag emoji
     String emojiU; // country emojiU code
     String currencyCode; // country currency code 
```
* Get States based on country code
```dart
    List<String> states = CountryData().getStates(countryId:'IN');
```
* Get Cities based on state and country code
 ```dart
    List<String> cities = CountryData().getCities(countryId:'IN',state:'Punjab');
 ```
## Getting Started
This project is a starting point for a Dart package, a library module containing code that can be shared easily across multiple Flutter or Dart projects.

For help getting started with Flutter, view our online documentation, which offers tutorials, samples, guidance on mobile development, and a full API reference.
## Contributions
Contributions of any kind are more than welcome! Feel free to fork and improve country_data in any way you want, make a pull request, or open an issue.
