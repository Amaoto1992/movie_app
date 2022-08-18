import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, i) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
              placeholder:  AssetImage('images/2.jpg'),
              image: AssetImage('images/2.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
