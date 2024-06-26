part of 'widgets_imports.dart';

class PostWidget extends StatelessWidget {
  List<Post> posts;
  int userId;

  PostWidget({Key? key, required this.posts, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //List Posts
        Column(
          children: posts
              .map((post) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userId == post.userId
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: MyColors.primaryColor
                                                .withOpacity(0.6),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(20),
                                            )),
                                        child: InkWell(
                                            onTap: () {
                                              // Get.toNamed(RouteName.postCreateForm,
                                              //     arguments: post);
                                            },
                                            child: const Icon(Icons.edit))),
                                  ],
                                )
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          //Title & description time
                          Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 15,
                                top: 10,
                              ),
                              child:
                                  "${post.title.toUpperCase()},${post.animalType}, ₹${post.price}"
                                      .text
                                      .capitalize
                                      .bold
                                      .make()),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.access_time,
                                    size: 16,
                                    color: Theme.of(context).hintColor),
                                const SizedBox(
                                  width: 2,
                                ),
                                post.publishedOn.toString().text.make(),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 200,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${ApiConstants.postImageUrl}${post.image.toString()}'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: post.description
                                .toString()
                                .text
                                .bodyLarge(context)
                                .make(),
                          ),
                          ListTile(
                            tileColor: Theme.of(context).hoverColor,
                            leading: CircleAvatar(
                              backgroundColor: MyColors.primaryColor.withOpacity(0.6),
                              child: const Icon(Icons.person),
                            ),
                            title: post.seller.text.make(),
                            trailing: SizedBox(
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  userId == post.userId
                                      ? CircleAvatar(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FeatherIcons.trash,
                                              color: Colors.red,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                          width: 0,
                                        ),
                                  CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        launchUrlString("tel://${post.phone}");
                                      },
                                      icon: const Icon(
                                        FeatherIcons.phone,
                                        color: MyColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
