import 'package:animalswale_app/data/repository/dashboard_repo.dart';
import 'package:animalswale_app/data/repository/post_repo.dart';

import 'auth_repo.dart';

class Repository{

  final AuthRepo authRepo;
  final DashboardRepo dashboardRepo;
  final PostRepo postRepo;

  Repository({required this.authRepo,required this.dashboardRepo,required this.postRepo});

}