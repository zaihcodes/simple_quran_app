import 'package:quran_app/models/surah_detail_model.dart';

abstract class SurahDetailState {}

class SurahDetailInitial extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailLoaded extends SurahDetailState {
  final SurahDetailModel surah;

  SurahDetailLoaded(this.surah);
}

class SurahDetailError extends SurahDetailState {
  final String message;

  SurahDetailError(this.message);
}
