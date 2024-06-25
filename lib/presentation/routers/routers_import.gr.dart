// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:animalswale_app/presentation/screens/auth/auth_imports.dart'
    as _i2;
import 'package:animalswale_app/presentation/screens/auth/login/login_imports.dart'
    as _i7;
import 'package:animalswale_app/presentation/screens/auth/otp/otp_imports.dart'
    as _i9;
import 'package:animalswale_app/presentation/screens/auth/register/register_imports.dart'
    as _i11;
import 'package:animalswale_app/presentation/screens/general/dashboard/addPosts/add_post_imports.dart'
    as _i1;
import 'package:animalswale_app/presentation/screens/general/dashboard/dashboard_imports.dart'
    as _i4;
import 'package:animalswale_app/presentation/screens/general/dashboard/dashboard_model.dart'
    as _i16;
import 'package:animalswale_app/presentation/screens/general/filter/filterPost_imports.dart'
    as _i5;
import 'package:animalswale_app/presentation/screens/general/general_imports.dart'
    as _i6;
import 'package:animalswale_app/presentation/screens/general/profile/category/category_imports.dart'
    as _i3;
import 'package:animalswale_app/presentation/screens/general/profile/profile_imports.dart'
    as _i10;
import 'package:animalswale_app/presentation/screens/general/profile/updateProfile/update_profile_imports.dart'
    as _i13;
import 'package:animalswale_app/presentation/screens/onboard/onboard_imports.dart'
    as _i8;
import 'package:animalswale_app/presentation/screens/splash/splash_import.dart'
    as _i12;
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddPostsRoute.name: (routeData) {
      final args = routeData.argsAs<AddPostsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddPosts(
          key: args.key,
          categoryList: args.categoryList,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Auth(),
      );
    },
    CategoryListRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryListRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CategoryList(
          key: args.key,
          categories: args.categories,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Dashboard(),
      );
    },
    FilterPostRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FilterPost(),
      );
    },
    GeneralRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.General(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Login(),
      );
    },
    OnboardRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardRouteArgs>(
          orElse: () => const OnboardRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.Onboard(key: args.key),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.Otp(
          key: args.key,
          mobileNo: args.mobileNo,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Profile(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Register(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreen(),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.UpdateProfile(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPosts]
class AddPostsRoute extends _i14.PageRouteInfo<AddPostsRouteArgs> {
  AddPostsRoute({
    _i15.Key? key,
    required List<_i16.Category>? categoryList,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          AddPostsRoute.name,
          args: AddPostsRouteArgs(
            key: key,
            categoryList: categoryList,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPostsRoute';

  static const _i14.PageInfo<AddPostsRouteArgs> page =
      _i14.PageInfo<AddPostsRouteArgs>(name);
}

class AddPostsRouteArgs {
  const AddPostsRouteArgs({
    this.key,
    required this.categoryList,
  });

  final _i15.Key? key;

  final List<_i16.Category>? categoryList;

  @override
  String toString() {
    return 'AddPostsRouteArgs{key: $key, categoryList: $categoryList}';
  }
}

/// generated route for
/// [_i2.Auth]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CategoryList]
class CategoryListRoute extends _i14.PageRouteInfo<CategoryListRouteArgs> {
  CategoryListRoute({
    _i15.Key? key,
    required List<_i16.Category> categories,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CategoryListRoute.name,
          args: CategoryListRouteArgs(
            key: key,
            categories: categories,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const _i14.PageInfo<CategoryListRouteArgs> page =
      _i14.PageInfo<CategoryListRouteArgs>(name);
}

class CategoryListRouteArgs {
  const CategoryListRouteArgs({
    this.key,
    required this.categories,
  });

  final _i15.Key? key;

  final List<_i16.Category> categories;

  @override
  String toString() {
    return 'CategoryListRouteArgs{key: $key, categories: $categories}';
  }
}

/// generated route for
/// [_i4.Dashboard]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FilterPost]
class FilterPostRoute extends _i14.PageRouteInfo<void> {
  const FilterPostRoute({List<_i14.PageRouteInfo>? children})
      : super(
          FilterPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterPostRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.General]
class GeneralRoute extends _i14.PageRouteInfo<void> {
  const GeneralRoute({List<_i14.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Login]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Onboard]
class OnboardRoute extends _i14.PageRouteInfo<OnboardRouteArgs> {
  OnboardRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          OnboardRoute.name,
          args: OnboardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i14.PageInfo<OnboardRouteArgs> page =
      _i14.PageInfo<OnboardRouteArgs>(name);
}

class OnboardRouteArgs {
  const OnboardRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'OnboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.Otp]
class OtpRoute extends _i14.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i15.Key? key,
    required String mobileNo,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            mobileNo: mobileNo,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i14.PageInfo<OtpRouteArgs> page =
      _i14.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.mobileNo,
  });

  final _i15.Key? key;

  final String mobileNo;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, mobileNo: $mobileNo}';
  }
}

/// generated route for
/// [_i10.Profile]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Register]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashScreen]
class SplashScreenRoute extends _i14.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.UpdateProfile]
class UpdateProfileRoute extends _i14.PageRouteInfo<void> {
  const UpdateProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          UpdateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfileRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
