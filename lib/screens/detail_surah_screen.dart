import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants/style/colors.dart';
import 'package:quran_app/constants/style/text_styles.dart';
import 'package:quran_app/data/bloc/surah_detail/surah_detail_cubit.dart';
import 'package:quran_app/data/bloc/surah_detail/surah_detail_state.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/widgets/banner_verse_widget.dart';
import 'package:quran_app/widgets/verses_widget.dart';

class DetailSurahScreen extends StatefulWidget {
  final SurahModel surah;

  const DetailSurahScreen({super.key, required this.surah});

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<SurahDetailCubit>()
        .fetchSurahsDetails(surahNumber: widget.surah.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24.0,
                      color: kGrey,
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Text(
                    widget.surah.name,
                    style: kHeading6.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: BannerVersesWidget(
                surah: widget.surah,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 24.0),
                child: BlocBuilder<SurahDetailCubit, SurahDetailState>(
                  builder: (context, state) {
                    if (state is SurahDetailLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SurahDetailError) {
                      return Center(child: Text(state.message));
                    } else if (state is SurahDetailLoaded) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.surah.ayahs.length,
                            itemBuilder: (context, index) {
                              final ayah = state.surah.ayahs[index];
                              return VersesWidget(
                                  ayahs: ayah,
                                  surah: state.surah.number.toString());
                            },
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: Text('Error BLoC'));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
