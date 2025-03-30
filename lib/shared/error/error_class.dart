import 'package:equatable/equatable.dart';

class ErrorClass extends Equatable {
  
  final bool hasError;
  final bool isLoading;
  final String messageError;

  const ErrorClass({
    this.hasError     = false,
    this.isLoading    = false,
    this.messageError = '',
  });

  @override
  List<Object> get props => [hasError, messageError, isLoading];
}
