import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iyltdsu_voice/speech_service.dart';

part 'language_state.dart';

/// Holds logic for fetching and displaying game stats.
class LanguageCubit extends Cubit<LanguageState> {
  /// Constructor
  LanguageCubit(this._speechService) : super(const LanguageState());

  final SpeechService _speechService;

  Future<void> fetchLanguages() async {
    final languages = await _speechService.getLanguages();

    emit(state.copyWith(languages: languages));
  }
  /// Interacts with storage for updating game stats.

  // /// Fetches the current stats of the game.
  // Future<void> fetchStats() async {
  //   final stats = await _statsRepository.fetchStats();
    
  //   emit(state.copyWith(stats: stats));
  // }

  // /// Resets the stats stored
  // Future<void> resetStats() async {
  //   await _statsRepository.resetStats();

  //   await fetchStats();
  // }
}
