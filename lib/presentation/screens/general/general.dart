part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int visit = 0;

  List<TabItem> items = [
    const TabItem(
      icon: FeatherIcons.home,
      // title: 'Home',
    ),
    const TabItem(
      icon: FeatherIcons.filter,
      // title: 'Shop',
    ),
    const TabItem(
      icon: FeatherIcons.user,
      // title: 'Wishlist',
    ),
  ];

  List<Widget> pages = [
    const Dashboard(),
    const FilterPost(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title:const Image(
            image: AssetImage(MyAssets.appLogo),
          width: 200,
        ),
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: visit,
        children: pages,
      ),
      // pages.elementAt(visit),
      bottomNavigationBar: BottomBarInspiredInside(
        items: items,
        backgroundColor: MyColors.white,
        color: MyColors.primaryColor.withOpacity(0.3),
        colorSelected: Colors.white,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        animated: true,
        chipStyle: const ChipStyle(
          background: MyColors.primaryColor,
          isHexagon: false,
          convexBridge: true,
        ),
        itemStyle: ItemStyle.circle,
      ),

    );
  }
}
