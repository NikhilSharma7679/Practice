class ApiErrorModel {
  final bool? status;
  final String? message;
  final Map<String, List<String>>? errors;

  ApiErrorModel({this.status, this.message, this.errors});

  // Factory method to parse JSON into the model
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      status: json['status'],
      message: json['message'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
    );
  }
}
