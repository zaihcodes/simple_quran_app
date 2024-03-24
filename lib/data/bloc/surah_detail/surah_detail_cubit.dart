import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/data/bloc/surah_detail/surah_detail_state.dart';
import 'package:quran_app/models/surah_detail_model.dart';

class SurahDetailCubit extends Cubit<SurahDetailState> {
  SurahDetailCubit() : super(SurahDetailInitial());

  Future<void> fetchSurahsDetails({required int surahNumber}) async {
    emit(SurahDetailLoading());

    try {
      final response = await http
          .get(Uri.parse('https://api.alquran.cloud/v1/surah/$surahNumber'));
      print('Fetch Surah Status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dynamic data = jsonData['data'];

        SurahDetailModel surah = SurahDetailModel.fromJson(data);

        emit(SurahDetailLoaded(surah));
      } else {
        emit(SurahDetailError('Failed to load surah. Please try again later.'));
      }
    } catch (e) {
      emit(SurahDetailError('An error occurred: $e'));
    }
  }
}
