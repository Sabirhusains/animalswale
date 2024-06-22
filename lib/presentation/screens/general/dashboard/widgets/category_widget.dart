part of 'widgets_imports.dart';

class CategoryWidget extends StatelessWidget {
  List<Category> categories;

  CategoryWidget({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: context.bodyLarge,
              ),
            ],
          ),
        ),
        //List Category
        SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              separatorBuilder: (context,index) => 5.w.widthBox,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var categoryData = categories[index];
                  return Card(
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
                  );
                },
                itemCount: categories.length),
          ),
        ),
      ],
    );
  }
}
