

part of 'routers_import.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page, path: "/", initial: true),
    AutoRoute(page: OnboardRoute.page,),
    AutoRoute(page: AuthRoute.page,),
    AutoRoute(page: LoginRoute.page,),
    AutoRoute(page: RegisterRoute.page,),
    AutoRoute(page: GeneralRoute.page,),
    AutoRoute(page: OtpRoute.page,),
    AutoRoute(page: DashboardRoute.page,),
    AutoRoute(page: FilterPostRoute.page,),
    AutoRoute(page: ProfileRoute.page,),
    AutoRoute(page: UpdateProfileRoute.page,),
    AutoRoute(page: CategoryListRoute.page,),
    AutoRoute(page: AddPostsRoute.page,),
    AutoRoute(page: UpdatePostRoute.page,),
  ];
}