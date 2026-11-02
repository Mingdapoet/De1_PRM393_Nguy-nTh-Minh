// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'9ce5d3a1d8e34e1852c77b7a602fe3158dd8f0ca';

@ProviderFor(colorRepository)
final colorRepositoryProvider = ColorRepositoryProvider._();

final class ColorRepositoryProvider
    extends
        $FunctionalProvider<ColorRepository, ColorRepository, ColorRepository>
    with $Provider<ColorRepository> {
  ColorRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorRepositoryHash();

  @$internal
  @override
  $ProviderElement<ColorRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ColorRepository create(Ref ref) {
    return colorRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorRepository>(value),
    );
  }
}

String _$colorRepositoryHash() => r'f0f058f3384036a2db4c2c8ef84d9f95c8003433';

@ProviderFor(ColorViewModel)
final colorViewModelProvider = ColorViewModelProvider._();

final class ColorViewModelProvider
    extends $NotifierProvider<ColorViewModel, int> {
  ColorViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorViewModelHash();

  @$internal
  @override
  ColorViewModel create() => ColorViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$colorViewModelHash() => r'7680340d1edfcaa737b1d5c89d24ed17af1a4974';

abstract class _$ColorViewModel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
