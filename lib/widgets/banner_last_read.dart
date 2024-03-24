import 'package:flutter/material.dart';
import 'package:quran_app/constants/style/colors.dart';
import 'package:quran_app/constants/style/text_styles.dart';

class BannerLastReadWidget extends StatelessWidget {
  const BannerLastReadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(22.0),
          height: size.height * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kLinear1,
                kLinear2,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/icon_readme.png',
                    width: 20,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    'Read To Rise Up',
                    style: kHeading6.copyWith(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 22.0),
              // Text('Last read',
              //     style: kHeading6.copyWith(
              //       color: Colors.white,
              //       fontSize: 18.0,
              //       fontWeight: FontWeight.w600,
              //     )),
              // const SizedBox(height: 2.0),
              // Row(
              //   children: [
              //     Text(
              //       'revelation',
              //       style: kHeading6.copyWith(
              //         color: Colors.white.withOpacity(0.8),
              //         fontSize: 13,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //     const SizedBox(width: 4.0),
              //     Icon(
              //       Icons.circle,
              //       color: Colors.white.withOpacity(0.8),
              //       size: 4,
              //     ),
              //     const SizedBox(width: 4.0),
              //     Text(
              //       'Ayat',
              //       style: kHeading6.copyWith(
              //         color: Colors.white.withOpacity(0.8),
              //         fontSize: 13,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        Positioned(
          bottom: -30.0,
          right: -36.0,
          child: Image.network(
            'https://raw.githubusercontent.com/radensaleh/Quran-App/master/assets/quran.png',
            width: 220,
          ),
        ),
      ],
    );
  }
}
