// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class ErrorMessage {

  int code;
  String error_code;
  String msg;

  ErrorMessage({
    required this.code,
    required this.error_code,
    required this.msg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'error_code': error_code,
      'msg': msg,
    };
  }

  factory ErrorMessage.fromMap(Map<String, dynamic> map) {
    return ErrorMessage(
      code: map['code'] as int,
      error_code: map['error_code'] as String,
      msg: map['msg'] as String,
    );
  }

}
