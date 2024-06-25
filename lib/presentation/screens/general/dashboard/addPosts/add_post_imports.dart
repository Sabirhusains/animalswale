import 'dart:io';

import 'package:animalswale_app/core/constants/my_colors.dart';
import 'package:animalswale_app/data/repository/repository.dart';
import 'package:animalswale_app/presentation/common_widgets/common_widget_imports.dart';
import 'package:animalswale_app/presentation/screens/general/dashboard/dashboard_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

part 'add_post.dart';
part 'add_post_view_model.dart';