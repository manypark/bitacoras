import 'user_dto.dart';
import 'package:bitacoras/shared/dto/dtos.dart';

class LogInDto extends GeneralDtoResponse<UserDto> {

    LogInDto({
        required super.status, 
        required super.message, 
        required super.data,
    });

  factory LogInDto.fromMap( Map<String, dynamic> map ) {
    return LogInDto(
      status  : map['status'], 
      message : map['message'], 
      data    : map['data'] != null ? UserDto.fromJson(map['data']) : null,
    );
  }

}
