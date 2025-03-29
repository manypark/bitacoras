import 'package:equatable/equatable.dart';

class ErrorClass extends Equatable {
  
  final bool hasError;
  final String messageError;

  const ErrorClass({
    this.hasError = false,
    this.messageError = '',
  });

  @override
  List<Object> get props => [hasError, messageError];
}
