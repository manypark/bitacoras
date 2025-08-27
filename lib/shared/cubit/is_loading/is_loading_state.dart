part of 'is_loading_cubit.dart';

class IsLoadingState extends Equatable {
  final bool isLoading;
  const IsLoadingState({ this.isLoading = false });
  @override
  List<Object> get props => [isLoading];
}