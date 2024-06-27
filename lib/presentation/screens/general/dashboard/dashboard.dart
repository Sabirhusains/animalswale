part of 'dashboard_imports.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isConnectedInternet = false;
  StreamSubscription? internetConnectionStreamSubscription;
  late DashboardViewModel dashboardViewModel;
  UserData? userData;
  List<Category>? categoriesList;


  @override
  void initState() {
    getUserId();
    dashboardViewModel =
        DashboardViewModel(repository: context.read<Repository>());
    dashboardViewModel.fetchAllDashboardData(context);
    super.initState();
    // internetConnectionStreamSubscription = InternetConnection().onStatusChange.listen((event){
    //   switch (event){
    //
    //     case InternetStatus.connected:
    //       setState(() {
    //         isConnectedInternet = true;
    //       });
    //       break;
    //     case InternetStatus.disconnected:
    //       setState(() {
    //         isConnectedInternet = false;
    //       });
    //       break;
    //     default:
    //       setState(() {
    //         isConnectedInternet = false;
    //       });
    //       break;
    //   }
    // });
  }

  getUserId() async {
    var userdata = await Utils.get("userData") ?? userData;
    userData = UserData.fromJson(json.decode(userdata));
  }

  void filterPostsByCategory(int categoryId) async {
    bool result = await dashboardViewModel.categoryFilter(categoryId, context);
    if (result) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<InitResponse>,
            VelocityState<InitResponse>>(
          bloc: dashboardViewModel.dashboardBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is VelocityUpdateState) {
              if (state.data.data != null) {
                InitData initData = state.data.data!;
                categoriesList = initData.categories;
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.h.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: "Hello"
                            .richText
                            .headlineLarge(context)
                            .size(16.sp)
                            .withTextSpanChildren([
                          TextSpan(
                              text: " ${userData!.name!.capitalized}",
                              style: const TextStyle(
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ]).make(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: "Lets gets somethings?"
                            .text
                            .bodyLarge(context)
                            .make(),
                      ),
                      40.h.heightBox,
                      //Banner Widget
                      BannerWidget(banners: initData.banners),
                      40.h.heightBox,
                      //Category Widget
                      CategoryWidget(
                        categories: initData.categories,
                        onCategorySelected: filterPostsByCategory,
                      ),
                      40.h.heightBox,
                      //Post Widget
                      FadedScaleAnimation(
                        child: PostWidget(
                          type: "Dashboard",
                          posts: initData.posts,
                          categoryList: initData.categories,
                          userId: userData!.id!,
                        ),
                      ),
                      40.h.heightBox,
                    ],
                  ),
                );
              }
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        onPressed: () async {
          final result = categoriesList!.isNotEmpty
              ? await AutoRouter.of(context)
                  .push(AddPostsRoute(categoryList: categoriesList))
              : null;
          if (result == true) {
            await dashboardViewModel.fetchAllDashboardData(context);
          }
        },
        child: const Icon(
          FeatherIcons.plus,
          color: MyColors.white,
        ),
      ),
    );
  }
}
