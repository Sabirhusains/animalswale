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



}