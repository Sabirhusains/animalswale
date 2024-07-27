part of 'update_post_imports.dart';

@RoutePage()
class UpdatePost extends StatefulWidget {
  Post postData;
  List<Category> categoryList;

  UpdatePost({Key? key, required this.postData, required this.categoryList})
      : super(key: key);

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  late UpdatePostViewModel updatePostViewModel;
  String? _selectedGender = "male";
  int? selectedAnimalId;
  String? imagePath;

  // Category? selectedCategory;

  @override
  void initState() {
    updatePostViewModel =
        UpdatePostViewModel(repository: context.read<Repository>());
    editData();
    super.initState();
  }

  editData() {
    print("POST DATA-=--=--=-->${widget.postData.location}");
    _selectedGender = widget.postData.gender;
    selectedAnimalId = widget.postData.animalTypeId;
    updatePostViewModel.titleController.text = widget.postData.title;
    updatePostViewModel.descriptionController.text =
        widget.postData.description;
    updatePostViewModel.currentMilkController.text =
        widget.postData.currentMilk.toString();
    updatePostViewModel.highestMilkController.text =
        widget.postData.highestMilk.toString();
    updatePostViewModel.priceController.text = widget.postData.price.toString();
    updatePostViewModel.ageController.text = widget.postData.age.toString();
    updatePostViewModel.currentLocationController.text =
        widget.postData.location.toString();
    imagePath = widget.postData.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Update Post".text.make(),
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  // Initial Value
                  value: selectedAnimalId,
                  hint: const Text('Select Animal Type'),
                  isExpanded: true,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: widget.categoryList.map((item) {
                    return DropdownMenuItem(
                      value: item.id,
                      child: Text(item.name.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
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
                    value: "male",
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
                    value: "female",
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
              controller: updatePostViewModel.titleController,
              textInputAction: TextInputAction.next,
            ),
            15.h.heightBox,
            CommonTextfield(
              hint: "Enter Description here..",
              maxLine: 3,
              controller: updatePostViewModel.descriptionController,
              textInputAction: TextInputAction.next,
            ),
            15.h.heightBox,
            Row(
              children: [
                Expanded(
                  child: CommonTextfield(
                    hint: "Current Milk ltr..",
                    controller: updatePostViewModel.currentMilkController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: CommonTextfield(
                    hint: "Highest Milk ltr..",
                    controller: updatePostViewModel.highestMilkController,
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
                    controller: updatePostViewModel.priceController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                5.w.widthBox,
                Expanded(
                  child: CommonTextfield(
                    hint: "Enter Animal Age..",
                    controller: updatePostViewModel.ageController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            GestureDetector(
              onTap: () => updatePostViewModel.getCurrentPosition(context),
              child: AbsorbPointer(
                child: CommonTextfield(
                  hint: "Current Location",
                  controller: updatePostViewModel.currentLocationController,
                  readOnly: true,
                  prefixIcon:
                      BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                    bloc: updatePostViewModel.isLoadingBloc,
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
              bloc: updatePostViewModel.selectedImageBloc,
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    imagePath != null
                        ? Image.network(
                            "${ApiConstants.postImageUrl}${imagePath.toString()}",
                            height: 200,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ).cornerRadius(20).centered()
                        : state.data != null
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
                          onPressed: () {
                            imagePath = null;
                            updatePostViewModel.pickImage(context);
                          },
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
              bloc: updatePostViewModel.isLoadingButtonBloc,
              builder: (context, state) {
                return PrimaryButton(
                  title: "Update Post",
                  isLoading: state.data,
                  onPressed: () => updatePostViewModel.updatePost(
                      widget.postData.id.toString(),
                      selectedAnimalId.toString(),
                      _selectedGender.toString(),
                      context),
                );
              },
            ),
            40.h.heightBox,
          ],
        ),
      ),
    );
  }
}
