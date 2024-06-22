import 'dart:convert';

import 'package:animalswale_app/data/repository/repository.dart';
import 'package:animalswale_app/main.dart';
import 'package:animalswale_app/presentation/screens/auth/otp/otp_model.dart';
import 'package:animalswale_app/presentation/screens/general/filter/filterPost_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../utils/utils.dart';
import '../dashboard/widgets/widgets_imports.dart';

part 'filterPost.dart';
part 'filterPost_view_model.dart';