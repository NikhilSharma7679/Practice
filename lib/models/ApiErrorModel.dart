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

  /// ✅ Helper function: get the first error message cleanly
  String get firstError {
    if (errors != null && errors!.isNotEmpty) {
      final firstKey = errors!.keys.first;
      final firstList = errors![firstKey];
      if (firstList != null && firstList.isNotEmpty) {
        return firstList.first; // e.g. "The mobile has already been taken."
      }
    }
    return message ?? "Something went wrong!";
  }
}
