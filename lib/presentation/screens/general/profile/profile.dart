part of 'profile_imports.dart';



@RoutePage()
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: "Welcome To Profile".text.xl3.makeCentered(),
    );
  }
}
