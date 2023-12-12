// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:amplify/amplify.module.dart' as _i4;
import 'package:flyingdarts/flyingdarts.module.dart' as _i5;
import 'package:flyingdarts_app/foobar.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:profile/profile.module.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.ProfilePackageModule().init(gh);
    await _i4.AmplifyPackageModule().init(gh);
    await _i5.FlyingdartsPackageModule().init(gh);
    gh.factory<_i6.FooBar>(() => const _i6.FooBar());
    return this;
  }
}
