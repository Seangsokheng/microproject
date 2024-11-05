class Participant {
  final String _firstName;
  final String _lastName;

  Participant(this._firstName, this._lastName) {
    if (_firstName.isEmpty || _lastName.isEmpty) {
      throw ArgumentError('First name and last name cannot be empty');
    }
  }
  String get fullName => "$_firstName $_lastName";
}
