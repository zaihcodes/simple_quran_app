import 'package:flutter/material.dart';
import 'package:quran_app/constants/style/colors.dart';
import 'package:quran_app/constants/style/text_styles.dart';
import 'package:quran_app/models/surah_model.dart';

class BannerVersesWidget extends StatelessWidget {
  final SurahModel surah;
  final bool isDark = false;
  const BannerVersesWidget({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 64.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: const LinearGradient(
              colors: [
                kLinear1,
                kLinear2,
              ],
            ),
            boxShadow: [
              isDark
                  ? const BoxShadow()
                  : const BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 0.1,
                      offset: Offset(0, 10),
                      color: kLinear1,
                    ),
            ],
          ),
          child: Column(
            children: [
              Text(
                surah.name,
                style: kHeading6.copyWith(
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                surah.englishName,
                style: kHeading6.copyWith(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surah.revelationType,
                    style: kHeading6.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Icon(
                    Icons.circle,
                    color: Colors.white.withOpacity(0.5),
                    size: 5,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    '${surah.numberOfAyahs} Ayat',
                    style: kHeading6.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Image.asset(
                'assets/images/basmallah.png',
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            child: Image.asset(
              'assets/images/quran_opacity.png',
              width: 280,
              opacity: const AlwaysStoppedAnimation(0.3),
            ),
          ),
        ),
      ],
    );
  }
}
