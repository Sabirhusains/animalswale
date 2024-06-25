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
  List<Category>? categoriesList;

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
              if(state.data.data != null){
                InitData initData = state.data.data!;
                categoriesList = initData.categories;
                return SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
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
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        onPressed: () =>categoriesList!.isNotEmpty? AutoRouter.of(context).push(AddPostsRoute(categoryList: categoriesList)): null,
        child:const Icon(FeatherIcons.plus,color:MyColors.white,),
      ),
    );
  }
}
