import 'package:hive/hive.dart';
import 'package:repay/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
save_client_info(phone_number,profile_image,full_name,country, balance, username) async{

  final preferences = await StreamingSharedPreferences.instance;
  final settings = MyAppSettings(preferences);

// set value
  phone_number == settings.phone_number.getValue().toString() ? print("Dont Save"):settings.phone_number.setValue(phone_number);
  profile_image == "/media/${settings.profile_image.getValue().toString()}" ? print("Dont Save") :settings.profile_image.setValue("/media/$profile_image");
  full_name == settings.full_name.getValue().toString() ? print("Dont Save") :settings.full_name.setValue(full_name);
  country == settings.country.getValue().toString() ? print("Dont Save") :settings.country.setValue(country);
  balance == settings.balance.getValue().toString() ? print("Dont Save") :settings.balance.setValue(balance);
  username == settings.username.getValue().toString() ? print("Dont Save") :settings.username.setValue(username);
    
}
class MyAppSettings {
  MyAppSettings(StreamingSharedPreferences preferences)
      : phone_number = preferences.getString('phone_number', defaultValue: "0"),
        profile_image = preferences.getString('profile_image', defaultValue: 'media/profile_images/profile_image.png'),
        full_name = preferences.getString('full_name', defaultValue: 'full_name'),
        country = preferences.getString('country', defaultValue: 'country'),
        balance = preferences.getString('balance', defaultValue: 'balance'),
        username = preferences.getString('username', defaultValue: 'Username'),
        unread = preferences.getString('unread', defaultValue: 'unread');

  final Preference<String> phone_number;
  final Preference<String> profile_image;
  final Preference<String> full_name;
  final Preference<String> country;
  final Preference<String> balance;
  final Preference<String> username;
  final Preference<String> unread;
}