import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class AdvertisementCards extends StatelessWidget {
  AdvertisementCards({super.key});

  final List<String> imagePaths = [
    'assets/images/advertisement/image1.png',
    'assets/images/advertisement/image2.png',
    'assets/images/advertisement/image3.png',
    'assets/images/advertisement/image4.png',
    'assets/images/advertisement/image5.png',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
          activeColor: colors.primary,
          color: colors.secondary,
        )),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return _Slide(object: imagePaths[index]);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String object;
  const _Slide({required this.object});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              object,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
