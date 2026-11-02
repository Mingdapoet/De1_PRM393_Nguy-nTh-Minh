import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/color_repository.dart';

part 'color_viewmodel.g.dart';

const appBarColors = [Colors.blue, Colors.green, Colors.purple];
const colorNames = ['Xanh dương', 'Xanh lá', 'Tím'];

// override trong main
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

@riverpod
ColorRepository colorRepository(Ref ref) {
  return ColorRepository(ref.watch(sharedPreferencesProvider));
}

@riverpod
class ColorViewModel extends _$ColorViewModel {
  @override
  int build() {
    return ref.read(colorRepositoryProvider).getColorIndex();
  }

  Future<void> changeColor(int index) async {
    state = index;
    await ref.read(colorRepositoryProvider).saveColorIndex(index);
  }
}
