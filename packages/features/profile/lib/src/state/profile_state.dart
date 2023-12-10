class ProfileState {
  final String userId;
  final String userName;
  final String country;
  final String email;

  ProfileState({
    required this.userId,
    required this.userName,
    required this.country,
    required this.email,
  });

  static ProfileState get initialState => ProfileState(
        userId: '',
        userName: '',
        country: '',
        email: '',
      );
}
