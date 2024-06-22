
part of 'widgets_imports.dart';


class BannerWidget extends StatelessWidget {
  List<Banners> banners;
  BannerWidget({super.key,required this.banners});

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
        autoPlay: true,
        enlargeCenterPage: true,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          var bannerData = banners[index];
          return CachedNetworkImage(
            imageUrl: '${ApiConstants.bannerImageUrl}${bannerData
                .path.toString()}',
            fit: BoxFit.cover,)
              .cornerRadius(20).pSymmetric(h: 10);
        });
  }
}
