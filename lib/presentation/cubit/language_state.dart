
part of 'language_cubit.dart';

/// Holds information about the statistics of games played.
class LanguageState extends Equatable {
  /// Constructor
  const LanguageState({
    this.languages = const []
  });

  final List<String> languages;

  @override
  List<Object> get props => [
    languages,
  ];

  /// Provides a copied instance.
  LanguageState copyWith({
    List<String>? languages,
  }) =>
      LanguageState(
        languages: languages ?? this.languages,
      );
}
