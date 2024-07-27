part of 'add_post_imports.dart';

@RoutePage()
class AddPosts extends StatefulWidget {
  List<Category>? categoryList;

  AddPosts({Key? key, required this.categoryList}) : super(key: key);

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostViewModel addPostViewModel;
  String? _selectedGender = "Male";
  Category? selectedCategory;

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
              child: DropdownButton<Category>(
                value: selectedCategory,
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text('Select Category'),
                onChanged: (Category? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: widget.categoryList!
                    .map<DropdownMenuItem<Category>>((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
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
            CommonTextfield(
              hint: "Enter Title here..",
              controller: addPostViewModel.titleController,
              textInputAction: TextInputAction.next,
            ),
            15.h.heightBox,
            CommonTextfield(
              hint: "Enter Description here..",
              maxLine: 3,
              controller: addPostViewModel.descriptionController,
              textInputAction: TextInputAction.next,
            ),
            15.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: CommonTextfield(
                    hint: "Current Milk ltr..",
                    controller: addPostViewModel.currentMilkController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: CommonTextfield(
                    hint: "Highest Milk ltr..",
                    controller: addPostViewModel.highestMilkController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: CommonTextfield(
                    hint: "Enter Price..",
                    controller: addPostViewModel.priceController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: CommonTextfield(
                    hint: "Enter Animal Age..",
                    controller: addPostViewModel.ageController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            GestureDetector(
              onTap: () => addPostViewModel.getCurrentPosition(context),
              child: AbsorbPointer(
                child: CommonTextfield(
                  hint: "Current Location",
                  controller: addPostViewModel.currentLocationController,
                  readOnly: true,
                  prefixIcon:
                      BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: addPostViewModel.isLoadingBloc,
                    builder: (context, state) {
                      return state.data == true
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const Icon(FeatherIcons.mapPin);
                    },
                  ),
                ),
              ),
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
                        : Container(
                      height: 200,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                        ),
                        color:const Color(0xffe1e4d5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_upload_outlined,
                              size: 30,
                            ),
                            Text(
                              "Select Image",
                              style: context.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: MyColors.primaryColor,
                      radius: 23,
                      child: IconButton(
                          onPressed: () => addPostViewModel.pickImage(context),
                          icon: const Icon(
                            FeatherIcons.camera,
                            color: MyColors.white,
                          )),
                    ),
                  ],
                );
              },
            ),
            20.h.heightBox,
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: addPostViewModel.isLoadingButtonBloc,
              builder: (context, state) {
                return PrimaryButton(
                    title: "Create New Post",
                    isLoading: state.data,
                    onPressed: () => addPostViewModel.addPost(
                        selectedCategory!.id.toString(),
                        _selectedGender.toString(),
                        context));
              },
            ),
            40.h.heightBox,
          ],
        ),
      ),
    );
  }
}
