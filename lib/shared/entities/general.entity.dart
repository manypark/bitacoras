
class GeneralEntity<T> {

  final bool status;
  final String message;
  final T? data;

  const GeneralEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GeneralEntity.fromJson( Map<String, dynamic> json ) => GeneralEntity(
    data    : json["data"],
    status  : json["status"],
    message : json["message"],
  );

}
