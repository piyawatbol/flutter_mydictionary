class ResponseModel {
  final bool isSucces;
  final String? message;
  final dynamic data;
  ResponseModel({required this.isSucces, required this.data, this.message});
}
