part of 'add_post_imports.dart';

@RoutePage()
class AddPosts extends StatefulWidget {
  List<Category>? categoryList;
  AddPosts({Key? key,required this.categoryList}) : super(key: key);

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostViewModel addPostViewModel;
  String? _selectedGender = "Male";

  @override
  void initState() {
    addPostViewModel = AddPostViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Add Post".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            15.h.heightBox,
            Container(
              height: 60,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Categories".text.make(),
                  const Icon(FeatherIcons.chevronRight),
                ],
              ),
            ),
            15.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    tileColor: MyColors.primaryColor.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: "Male",
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    title: 'Male'.text.make(),
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: RadioListTile(
                    tileColor: MyColors.primaryColor.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: "Female",
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    title: 'Female'.text.make(),
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            VxTextField(
              fillColor: Colors.transparent,
              borderRadius: 10,
              hint: "Enter Title here..",
              hintStyle: const TextStyle(color: Colors.grey),
              borderType: VxTextFieldBorderType.roundLine,
              controller: addPostViewModel.titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              borderColor: MyColors.primaryColor,
            ),
            15.h.heightBox,
            VxTextField(
              fillColor: Colors.transparent,
              borderRadius: 10,
              hint: "Enter Description here..",
              maxLine: 3,
              hintStyle: const TextStyle(color: Colors.grey),
              borderType: VxTextFieldBorderType.roundLine,
              controller: addPostViewModel.descriptionController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              borderColor: MyColors.primaryColor,
            ),
            15.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: VxTextField(
                    fillColor: Colors.transparent,
                    borderRadius: 10,
                    hint: "Current Milk ltr..",
                    hintStyle: const TextStyle(color: Colors.grey),
                    borderType: VxTextFieldBorderType.roundLine,
                    controller: addPostViewModel.currentMilkController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    borderColor: MyColors.primaryColor,
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: VxTextField(
                    fillColor: Colors.transparent,
                    borderRadius: 10,
                    hint: "Highest Milk ltr..",
                    hintStyle: const TextStyle(color: Colors.grey),
                    borderType: VxTextFieldBorderType.roundLine,
                    controller: addPostViewModel.highestMilkController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    borderColor: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: VxTextField(
                    fillColor: Colors.transparent,
                    borderRadius: 10,
                    hint: "Enter Price..",
                    hintStyle: const TextStyle(color: Colors.grey),
                    borderType: VxTextFieldBorderType.roundLine,
                    controller: addPostViewModel.priceController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    borderColor: MyColors.primaryColor,
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: VxTextField(
                    fillColor: Colors.transparent,
                    borderRadius: 10,
                    hint: "Enter Animal Age..",
                    hintStyle: const TextStyle(color: Colors.grey),
                    borderType: VxTextFieldBorderType.roundLine,
                    controller: addPostViewModel.ageController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    borderColor: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            VxTextField(
              fillColor: Colors.white,
              borderRadius: 10,
              hint: "Current Location",
              hintStyle: const TextStyle(color: Colors.black),
              borderType: VxTextFieldBorderType.roundLine,
              controller: addPostViewModel.currentLocationController,
              readOnly: true,
              borderColor: MyColors.white,
              prefixIcon: const Icon(FeatherIcons.mapPin),
            ),
            15.h.heightBox,
            BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
              bloc: addPostViewModel.selectedImageBloc,
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    state.data != null
                        ? Image.file(
                            File(state.data!.path),
                            height: 200,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ).cornerRadius(20).centered()
                        : Image.network(
                            "https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png?ssl=1",
                            height: 200,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ).cornerRadius(20).centered(),
                    CircleAvatar(
                      radius: 23,
                      child: IconButton(
                          onPressed: () => addPostViewModel.pickImage(context),
                          icon: const Icon(
                            FeatherIcons.camera,
                            color: MyColors.primaryColor,
                          )),
                    ),
                  ],
                );
              },
            ),
            20.h.heightBox,
            PrimaryButton(title: "Create New Post", onPressed: () {}),
            40.h.heightBox,
          ],
        ),
      ),
    );
  }
}
