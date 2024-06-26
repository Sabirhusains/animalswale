part of 'update_post_imports.dart';

class UpdatePostViewModel {
  final Repository repository;

  UpdatePostViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController currentMilkController = TextEditingController();
  final TextEditingController highestMilkController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController currentLocationController =
      TextEditingController();

  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final VelocityBloc<bool> isLoadingButtonBloc = VelocityBloc<bool>(false);

  //Current Position GET METHOD
  Future<void> getCurrentPosition(context) async {
    isLoadingBloc.onUpdateData(true);
    try {
      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          VxToast.show(context, msg: 'Location permissions are denied');
          return;
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address = "${placemark.locality}, ${placemark.country}";

        // Update the text field controller
        currentLocationController.text = address;
      }
    } catch (e) {
      VxToast.show(context, msg: 'Failed to get location: $e');
    } finally {
      isLoadingBloc.onUpdateData(false);
    }
  }

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
  }

  updatePost(String postId, String animalTypeId, String gender, context) async {
    isLoadingButtonBloc.onUpdateData(true);
    final updatePostData = await repository.postRepo.updatePostApi(
        postId,
        animalTypeId,
        gender,
        titleController.text,
        descriptionController.text,
        currentMilkController.text,
        highestMilkController.text,
        priceController.text,
        ageController.text,
        currentLocationController.text,
        selectedImageBloc.state.data,
        context);
    if (updatePostData.success != 'false') {
      // await DashboardViewModel(repository: repository).fetchAllDashboardData(context);
      AutoRouter.of(context).pop(true);
    } else {
      VxToast.show(context, msg: updatePostData.message.toString());
    }
    isLoadingButtonBloc.onUpdateData(false);
  }
}
