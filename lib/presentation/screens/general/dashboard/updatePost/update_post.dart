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
            VxTextField(
              fillColor: Colors.transparent,
              borderRadius: 10,
              hint: "Enter Title here..",
              hintStyle: const TextStyle(color: Colors.grey),
              borderType: VxTextFieldBorderType.roundLine,
              controller: updatePostViewModel.titleController,
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
              controller: updatePostViewModel.descriptionController,
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
                    controller: updatePostViewModel.currentMilkController,
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
                    controller: updatePostViewModel.highestMilkController,
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
                    controller: updatePostViewModel.priceController,
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
                    controller: updatePostViewModel.ageController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    borderColor: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            15.h.heightBox,
            GestureDetector(
              onTap: () => updatePostViewModel.getCurrentPosition(context),
              child: AbsorbPointer(
                child: VxTextField(
                  fillColor: Colors.white,
                  borderRadius: 10,
                  hint: "Current Location",
                  hintStyle: const TextStyle(color: Colors.black),
                  borderType: VxTextFieldBorderType.roundLine,
                  controller: updatePostViewModel.currentLocationController,
                  readOnly: true,
                  borderColor: MyColors.white,
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
                            : Image.network(
                                "https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png?ssl=1",
                                height: 200,
                                width: 1.sw,
                                fit: BoxFit.cover,
                              ).cornerRadius(20).centered(),
                    CircleAvatar(
                      radius: 23,
                      child: IconButton(
                          onPressed: () {
                            imagePath = null;
                            updatePostViewModel.pickImage(context);
                          },
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
