part of 'dashboard_imports.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late DashboardViewModel dashboardViewModel;
  UserData? userData;

  @override
  void initState() {
    getUserId();
    dashboardViewModel =
        DashboardViewModel(repository: context.read<Repository>());
    dashboardViewModel.fetchAllDashboardData(context);
    super.initState();
  }

  getUserId() async {
    var userdata = await Utils.get("userData") ?? userData;
    userData = UserData.fromJson(json.decode(userdata));
    print('USer ID ==-=--=----=-=-->${userData!.id}');
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
              InitData initData = state.data.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    20.h.heightBox,
                    //Banner Widget
                    BannerWidget(banners: initData.banners),
                    40.h.heightBox,
                    //Category Widget
                    CategoryWidget(
                      categories: initData.categories,
                    ),
                    40.h.heightBox,
                    //Post Widget
                    PostWidget(
                      posts: initData.posts,
                      userId: userData!.id!,
                    ),
                    40.h.heightBox,
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        onPressed: () {},
        child:const Icon(FeatherIcons.plus,color:MyColors.white,),
      ),
    );
  }
}
