part of 'category_imports.dart';

@RoutePage()
class CategoryList extends StatelessWidget {
  List<Category> categories;

  CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "All Category".text.make(),
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final categoryData = categories[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: ListTile(
                tileColor: MyColors.primaryColor.withOpacity(0.2),
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                leading: SizedBox(
                  height: 70.h,
                  width: 70.w,
                  child: Image.network(
                      "${ApiConstants.categoryImageUrl}${categoryData.image}",
                      fit: BoxFit.cover),
                ).cornerRadius(15),
                title: categoryData.name.text.xl3.make(),
              ),
            );
          }),
    );
  }
}
