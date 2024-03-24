import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants/style/text_styles.dart';
import 'package:quran_app/widgets/banner_last_read.dart';
import 'package:quran_app/widgets/list_surah_widget.dart';

import '../data/bloc/surah/surah_cubit.dart';
import '../data/bloc/surah/surah_state.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SurahCubit>().fetchSurahs();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/icon_quran.png',
                    width: 28.0,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    'Quran',
                    style: kHeading6.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const BannerLastReadWidget(),
            ),
            Expanded(
              child: BlocBuilder<SurahCubit, SurahState>(
                builder: (context, state) {
                  if (state is SurahLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SurahLoaded) {
                    // Display your data
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListSurahWidget(surahs: state.surahs),
                    );
                  } else if (state is SurahError) {
                    return Text('Error: ${state.message}');
                  } else {
                    return const Text('Initial State');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
