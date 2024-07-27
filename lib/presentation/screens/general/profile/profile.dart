part of 'profile_imports.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedScaleAnimation(
        child: RefreshIndicator(
          onRefresh: () => profileViewModel.getProfileData(context),
          child: ListView(
            children: [
              20.h.heightBox,
              ///Profile Info Code
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 15, bottom: 5),
                child: "Profile Info".text.bodyLarge(context).make(),
              ),
              BlocProvider(
                create: (context) => profileViewModel.userDataBloc,
                child: BlocBuilder<VelocityBloc<UserData>,
                    VelocityState<UserData>>(
                  bloc: profileViewModel.userDataBloc,
                  builder: (context, state) {
                    if (state is VelocityInitialState) {
                      return const SizedBox();
                    } else if (state is VelocityUpdateState) {
                      final userData = state.data;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          height: 95.h,
                          width: double.infinity,
                          color: MyColors.primaryColor,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              userData.profileImage != null &&
                                      userData.profileImage!.isNotEmpty
                                  ? VxCircle(
                                      radius: 110,
                                      backgroundImage: DecorationImage(
                                        image: NetworkImage(
                                            '${ApiConstants.profileImageUrl}${userData.profileImage}'),
                                      ),
                                    )
                                  : VxCircle(
                                      radius: 110,
                                      backgroundImage: const DecorationImage(
                                        image: NetworkImage(
                                            'https://img.freepik.com/free-photo/lion-wearing-glasses-studio_23-2150813334.jpg?t=st=1715767935~exp=1715771535~hmac=5400bb005cda001410d13b7db15b58b6b281f98a8532ae6edeecea6ee2aa017a&w=740'),
                                      ),
                                    ),
                              // 15.w.widthBox,
                              SizedBox(
                                width: 180.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    "${userData.name}".text.xl2.ellipsis.make(),
                                    "+ ${userData.phone}"
                                        .text
                                        .bodyLarge(context)
                                        .make(),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              VxCircle(
                                radius: 55,
                                child: IconButton(
                                  onPressed: () => AutoRouter.of(context)
                                      .push(const UpdateProfileRoute()),
                                  icon: const Icon(
                                    FeatherIcons.edit2,
                                    color: MyColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).cornerRadius(15),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              20.h.heightBox,
              //App Info
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 15, bottom: 5),
                child: "App Info".text.bodyLarge(context).make(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  elevation: 0.3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                              backgroundColor:
                                  MyColors.primaryColor.withOpacity(0.6),
                              child: const Icon(Icons.public_rounded)),
                          title: "Find Animals".text.make(),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          onTap: () => profileViewModel.launchUrl(
                              "https://www.animalswale.com/about-us/"),
                          leading: CircleAvatar(
                              backgroundColor:
                                  MyColors.primaryColor.withOpacity(0.6),
                              child: const Icon(Icons.info_outline)),
                          title: "About Us".text.make(),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          onTap: () => profileViewModel.launchUrl(
                              "https://www.animalswale.com/contact-us/"),
                          leading: CircleAvatar(
                              backgroundColor:
                                  MyColors.primaryColor.withOpacity(0.6),
                              child: const Icon(Icons.call_outlined)),
                          title: "Contact Us".text.make(),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          onTap: () => profileViewModel.launchUrl(
                              "https://www.animalswale.com/terms-condiotion/"),
                          leading: CircleAvatar(
                              backgroundColor:
                                  MyColors.primaryColor.withOpacity(0.6),
                              child: const Icon(Icons.gavel_outlined)),
                          title: "Terms & Condition".text.make(),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          onTap: () => profileViewModel.launchUrl(
                              "https://www.animalswale.com/privacy-policy/"),
                          leading: CircleAvatar(
                              backgroundColor:
                                  MyColors.primaryColor.withOpacity(0.6),
                              child: const Icon(Icons.privacy_tip_outlined)),
                          title: "Privacy Policy".text.make(),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.h.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PrimaryButton(
                    title: "Logout",
                    onPressed: () => logout(),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    // Show delete dialog
    bool confirmed = await showDeleteDialog(
        context, "Logout", "Are you Sure Want to Logout?", "Logout");

    if (confirmed) {
      await profileViewModel
          .logout(context); // Assuming deletePost method exists in ViewModel
    }
  }
}
