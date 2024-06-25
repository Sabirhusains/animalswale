part of 'add_post_imports.dart';


class AddPostViewModel{

  final Repository repository;

  AddPostViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController currentMilkController = TextEditingController();
  final TextEditingController highestMilkController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController currentLocationController = TextEditingController();


  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
  }




}