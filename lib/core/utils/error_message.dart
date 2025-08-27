// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class ErrorMessage {

  String error_code;
  String msg;

  ErrorMessage({
    required this.error_code,
    required this.msg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error_code': error_code,
      'msg': msg,
    };
  }

  factory ErrorMessage.fromMap(Map<String, dynamic> map) {
    return ErrorMessage(
      error_code: map['error_code'],
      msg       : map['msg'],
    );
  }

}
