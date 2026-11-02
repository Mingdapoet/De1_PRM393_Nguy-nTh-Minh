import 'package:shared_preferences/shared_preferences.dart';

class ColorRepository {
  final SharedPreferences prefs;

  ColorRepository(this.prefs);

  int getColorIndex() {
    return prefs.getInt('appbar_color') ?? 0;
  }

  Future<void> saveColorIndex(int index) async {
    await prefs.setInt('appbar_color', index);
  }
}
