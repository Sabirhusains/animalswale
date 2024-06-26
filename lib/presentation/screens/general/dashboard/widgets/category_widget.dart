part of 'widgets_imports.dart';

class CategoryWidget extends StatefulWidget {
  final Function(int) onCategorySelected;
  List<Category> categories;

  CategoryWidget({Key? key, required this.onCategorySelected,required this.categories})
      : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late DashboardViewModel dashboardViewModel;
  List<Post> updatedPosts = [];

  @override
  void initState() {
    dashboardViewModel =
        DashboardViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: context.bodyLarge,
              ),
              InkWell(
                  onTap: () => AutoRouter.of(context)
                      .push(CategoryListRoute(categories: widget.categories)),
                  child: "See All >".text.bodyLarge(context).blue700.make()),
            ],
          ),
        ),
        15.h.heightBox,
        //List Category
        SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => 5.w.widthBox,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var categoryData = widget.categories[index];
                  return InkWell(
                    onTap: () async {
                      widget.onCategorySelected(categoryData.id);
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              opacity: 2.5,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  '${ApiConstants.categoryImageUrl}${categoryData.image}'),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                height: 25,
                                alignment: Alignment.center,
                                child: Text(categoryData.name,
                                    textAlign: TextAlign.center,
                                    style: context.titleSmall)),
                          )),
                    ),
                  );
                },
                itemCount: widget.categories.length),
          ),
        ),
      ],
    );
  }
}
