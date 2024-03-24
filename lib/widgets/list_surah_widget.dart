import 'package:flutter/material.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/screens/detail_surah_screen.dart';

import '../constants/style/colors.dart';
import '../constants/style/text_styles.dart';

class ListSurahWidget extends StatelessWidget {
  final List<SurahModel> surahs;

  const ListSurahWidget({
    super.key,
    required this.surahs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surahs.length,
      // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            // context
            //     .read<SurahDetailCubit>()
            //     .fetchSurahsDetails(surahNumber: surahs[index].name);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailSurahScreen(surah: surahs[index])));
            // () => Navigator.pushNamed(context, NamedRoutes.detailScreen,
            //     arguments: surahs[index].number),
          },
          child: SurahWidget(
            surah: surahs[index],
          ),
        );
      },
    );
  }
}

class SurahWidget extends StatelessWidget {
  final SurahModel surah;

  const SurahWidget({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/icon_no.png', width: 42.0),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        surah.number.toString(),
                        style: kHeading6.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName,
                    style: kHeading6.copyWith(
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        surah.revelationType == 'Meccan' ? 'مكية' : 'مدنية',
                        style: kHeading6.copyWith(
                          color: kGrey.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Icon(
                        Icons.circle,
                        // color: kGrey.withOpacity(0.8),
                        size: 4,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '${surah.numberOfAyahs} آية',
                        style: kHeading6.copyWith(
                          color: kGrey.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                surah.name,
                style: kHeading6.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  // color: prefSetProvider.isDarkTheme
                  //     ? kPrimary
                  //     : kDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Divider(
              thickness: 1,
              color: kGrey.withOpacity(0.25),
            ),
          ),
        ],
      ),
    );
  }
}
