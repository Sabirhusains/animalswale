
import 'dart:convert';

import 'package:animalswale_app/core/constants/my_colors.dart';
import 'package:animalswale_app/data/data_source/remote/api_constants.dart';
import 'package:animalswale_app/data/repository/repository.dart';
import 'package:animalswale_app/main.dart';
import 'package:animalswale_app/presentation/common_widgets/common_widget_imports.dart';
import 'package:animalswale_app/presentation/routers/routers_import.gr.dart';
import 'package:animalswale_app/presentation/screens/auth/otp/otp_model.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/constants/my_alert.dart';
import '../../../../utils/utils.dart';

part 'profile.dart';
part 'profile_view_model.dart';