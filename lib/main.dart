import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants/style/custom_theme_data.dart';
import 'package:quran_app/data/bloc/surah/surah_cubit.dart';
import 'package:quran_app/data/bloc/surah_detail/surah_detail_cubit.dart';
import 'package:quran_app/screens/surah_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SurahCubit()),
          BlocProvider(create: (context) => SurahDetailCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomThemeData.lightTheme,
          home: const SurahListScreen(),
        ));
  }
}
