class ProfileState {
  final bool isMaleSelected;
  final bool isFemaleSelected;
  final String? dateOfBirth;

  ProfileState({
    this.isMaleSelected = false,
    this.isFemaleSelected = false,
    this.dateOfBirth,
  });

  ProfileState copyWith({
    bool? isMaleSelected,
    bool? isFemaleSelected,
    String? dateOfBirth,
  }) {
    return ProfileState(
      isMaleSelected: isMaleSelected ?? this.isMaleSelected,
      isFemaleSelected: isFemaleSelected ?? this.isFemaleSelected,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
