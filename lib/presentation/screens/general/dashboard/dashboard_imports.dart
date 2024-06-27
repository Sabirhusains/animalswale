import 'dart:convert';

import 'package:animalswale_app/core/constants/my_colors.dart';
import 'package:animalswale_app/data/repository/repository.dart';
import 'package:animalswale_app/main.dart';
import 'package:animalswale_app/presentation/common_widgets/common_widget_imports.dart';
import 'package:animalswale_app/presentation/routers/routers_import.gr.dart';
import 'package:animalswale_app/presentation/screens/auth/otp/otp_model.dart';
import 'package:animalswale_app/presentation/screens/general/dashboard/dashboard_model.dart';
import 'package:animalswale_app/presentation/screens/general/dashboard/widgets/widgets_imports.dart';
import 'package:animalswale_app/utils/utils.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

part 'dashboard.dart';
part 'dashboard_view_model.dart';

