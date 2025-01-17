

import 'dart:io';

import 'package:animalswale_app/data/data_source/remote/api_constants.dart';
import 'package:animalswale_app/data/repository/repository.dart';
import 'package:animalswale_app/main.dart';
import 'package:animalswale_app/presentation/screens/general/dashboard/dashboard_imports.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/constants/my_colors.dart';
import '../../../../common_widgets/common_widget_imports.dart';
import '../dashboard_model.dart';

part 'update_post.dart';
part 'update_post_view_model.dart';