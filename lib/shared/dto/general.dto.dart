
class GeneralDtoResponse<T> {

  final bool status;
  final String message;
  final T? data;

  const GeneralDtoResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GeneralDtoResponse.fromJson( Map<String, dynamic> json ) => GeneralDtoResponse(
    data    : json["data"],
    status  : json["status"],
    message : json["message"],
  );

}
