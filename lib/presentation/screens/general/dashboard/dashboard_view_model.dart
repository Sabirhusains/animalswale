part of 'dashboard_imports.dart';

class DashboardViewModel {

  final Repository repository;

  DashboardViewModel({required this.repository});


  VelocityBloc<InitResponse> dashboardBloc = VelocityBloc<InitResponse>(InitResponse());


  fetchAllDashboardData(context)async {
    var dashboardData = await repository.dashboardRepo.dashboardApi(context);
    if(dashboardData.success != 'false'){
      print("DASHBOARD DATA-=-=----->${dashboardData.data.toString()}");
      dashboardBloc.onUpdateData(dashboardData);
    }
  }


  deletePost(String postId,context) async {
    final response = await repository.postRepo.deletePostApi(postId,context);
    if (response.success  == 'true') {
      return true;
    } else {
      VxToast.show(context, msg: response.message.toString());
      return false;
    }
  }

  categoryFilter(int categoryId,context)async {
    final response = await repository.dashboardRepo.categoryFilterApi(
        categoryId, context);
    if (response.success == 'true') {
      dashboardBloc.state.data.data!.posts.clear();
      dashboardBloc.state.data.data!.posts.addAll(response.data!);
      print("dashboardBloc.state.data.data!.posts -=-=----=-->${dashboardBloc
          .state.data.data!.posts.map((e) => e.toJson())}");
      // await fetchAllDashboardData(context);
      return true;
    }
  }

}