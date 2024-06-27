part of 'filterPost_imports.dart';


@RoutePage()
class FilterPost extends StatefulWidget {
  const FilterPost({super.key});

  @override
  State<FilterPost> createState() => _FilterPostState();
}

class _FilterPostState extends State<FilterPost> {

  late FilterpostViewModel filterpostViewModel;
  UserData? userData;

  @override
  void initState() {
    getUserId();
    filterpostViewModel =
        FilterpostViewModel(repository: context.read<Repository>());
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              20.h.heightBox,
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: VxTextField(
                      fillColor: Colors.transparent,
                      borderRadius: 10,
                      hint: "Enter Your Max Price",
                      hintStyle: const TextStyle(color: Colors.grey),
                      borderType: VxTextFieldBorderType.roundLine,
                      controller: filterpostViewModel.rateController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      borderColor: MyColors.primaryColor,
                      prefixIcon: const Icon(Icons.money),
                    ),
                  ),
                  10.w.widthBox,
                  Expanded(child: Container(
                    color: MyColors.primaryColor,
                    height: 45.h,
                    width: 50.w,
                    child: IconButton(
                      onPressed: () {
                        if (filterpostViewModel.rateController.text
                            .isNotEmpty) {
                          filterpostViewModel.fetchAllFilterRateData(context);
                        } else {
                          VxToast.show(context, msg: "Please Insert Value");
                        }
                      },
                      icon: const Icon(FeatherIcons.search),
                    ),
                  ).cornerRadius(10)),
                ],
              ),
              40.h.heightBox,
              //Post Widget
              BlocBuilder<VelocityBloc<FilterPostModel>, VelocityState<FilterPostModel>>(
                bloc: filterpostViewModel.filterRatePostBloc,
                builder: (context, state) {
                  if (state is VelocityInitialState) {
                    return const SizedBox();
                  } else if(state is VelocityUpdateState) {
                    print("POST FILTER-=---=-->${state.data.data.toString()}");

                    return state.data.data != null ? PostWidget(
                      type: "Filter",
                      posts: state.data.data!,
                      categoryList: const [],
                      userId: userData!.id!,
                    ):Center(child: "No more Post Data".text.make(),);
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
