import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static SharedPreferences _appPref;
  static const KEY_IS_LOGIN = "is_login";
  static const KEY_DEFAULT_LAN = "default_lan";
  static const KEY_DEFAULT_LAN_CODE = "default_lan_code";
  static const KEY_ONCE_PROMPT_TO_ADD_LOCATION = "once_prompt_to_add_location";
  static const KEY_IS_LOCATION_SEL_FINISH = "is_location_sel_finish";

  static PrefManager _instance;

  static Future<PrefManager> getInstance() async {
    if (_instance == null) {
      _instance = PrefManager();
    }

    if (_appPref == null) {
      _appPref = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  bool get isLogin {
    return _appPref.getBool(KEY_IS_LOGIN) ?? false;
  }

  set isLogin(bool token) {
    _appPref.setBool(KEY_IS_LOGIN, token);
  }

  String get defaultLan {
    return _appPref.getString(KEY_DEFAULT_LAN) ?? "English";
  }

  set defaultLan(String defaultLan) {
    _appPref.setString(KEY_DEFAULT_LAN, defaultLan);
  }

  String get defaultLanCode {
    return _appPref.getString(KEY_DEFAULT_LAN) ?? "en";
  }

  set defaultLanCode(String defaultLanCode) {
    _appPref.setString(KEY_DEFAULT_LAN, defaultLanCode);
  }

  bool get oncePromptAddLoc {
    return _appPref.getBool(KEY_ONCE_PROMPT_TO_ADD_LOCATION) ?? false;
  }

  set oncePromptAddLoc(bool flag) {
    _appPref.setBool(KEY_ONCE_PROMPT_TO_ADD_LOCATION, flag);
  }

  bool get isLocationSelFinish {
    return _appPref.getBool(KEY_IS_LOCATION_SEL_FINISH) ?? false;
  }

  set isLocationSelFinish(bool flag) {
    _appPref.setBool(KEY_IS_LOCATION_SEL_FINISH, flag);
  }
}
