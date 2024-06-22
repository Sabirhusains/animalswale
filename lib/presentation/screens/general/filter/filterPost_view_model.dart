part of 'filterPost_imports.dart';


class FilterpostViewModel {

  final Repository repository;

  FilterpostViewModel({required this.repository});

  VelocityBloc<FilterPostModel> filterRatePostBloc = VelocityBloc<FilterPostModel>(FilterPostModel());
  final TextEditingController rateController = TextEditingController();


  fetchAllFilterRateData(context)async {
    var filterRateData = await repository.dashboardRepo.filterRateApi(rateController.text,context);
    if(filterRateData.success != 'false'){
      filterRatePostBloc.onUpdateData(filterRateData);
    }

  }



}