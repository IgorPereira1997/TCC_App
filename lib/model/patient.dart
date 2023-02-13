class PatientDetails {
  final String name;
  final String email;

  const PatientDetails({required this.name, required this.email});

  factory PatientDetails.fromMap(Map<String, dynamic> data) {
    return PatientDetails(name: data["name"], email: data["email"]);
  }
}
