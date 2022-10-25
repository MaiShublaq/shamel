
import 'package:image_picker/image_picker.dart';
import 'package:shamel/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum prefKeys{
  loggedIn,
  name,
  email,
  image,
  nationalId,
  city,
  mobile,
  birthDate,
  nationality,
  genderType,
  token,
  lang,
  pickedFile,
}
class SharedPrefController {
  SharedPrefController._();

  static final SharedPrefController _instance = SharedPrefController._();


  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> save({ required User user}) async{

    await _sharedPreferences.setString(prefKeys.name.toString(), user.name);
    await _sharedPreferences.setString(prefKeys.nationalId.toString(), user.nationalId);
    await _sharedPreferences.setString(prefKeys.email.toString(), user.email!);
    await _sharedPreferences.setString(prefKeys.image.toString(), user.image);
    await _sharedPreferences.setString(prefKeys.mobile.toString(), user.mobile);
    await _sharedPreferences.setString(prefKeys.city.toString(), user.city);
    await _sharedPreferences.setString(prefKeys.nationality.toString(), user.nationality);
    await _sharedPreferences.setString(prefKeys.birthDate.toString(), user.birthDate);
    await _sharedPreferences.setString(prefKeys.genderType.toString(), user.genderType);
    await _sharedPreferences.setString(prefKeys.token.toString(), 'Bearer '+user.token);
    await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), true);

  }


  bool get loggedIn {
    return _sharedPreferences.getBool(prefKeys.loggedIn.toString()) ?? false;
  }
  String get name {
    return _sharedPreferences.getString(prefKeys.name.toString()) ?? '';
  }

  String get token{
    return _sharedPreferences.getString(prefKeys.token.toString())?? '';
  }
  String get nattionalId{
    return _sharedPreferences.getString(prefKeys.nationalId.toString())?? '';
  }
  String get language{
    return _sharedPreferences.getString(prefKeys.lang.toString())??'';
  }
  String get email{
    return _sharedPreferences.getString(prefKeys.email.toString())??'';
  }
  String get image{
    return _sharedPreferences.getString(prefKeys.image.toString())??'';
  }
  String get mobile{
    return _sharedPreferences.getString(prefKeys.mobile.toString())??'';
  }
  String get city{
    return _sharedPreferences.getString(prefKeys.city.toString())??'';
  }
  String get nationality{
    return _sharedPreferences.getString(prefKeys.nationality.toString())??'';
  }
  String get birthDate{
    return _sharedPreferences.getString(prefKeys.birthDate.toString())??'';
  }
  String get genderType{
    return _sharedPreferences.getString(prefKeys.genderType.toString())??'';
  }


  Future<bool> logout() async{
    return await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), false);
  }



  Future<bool> clear()async{
    return await _sharedPreferences.clear();
  }

  Future<bool> setLang({required String lang}) async{
    return await _sharedPreferences.setString(prefKeys.lang.toString(), lang);
  }
}