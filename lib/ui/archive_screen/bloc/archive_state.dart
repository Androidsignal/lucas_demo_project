import 'package:equatable/equatable.dart';
import 'package:lucas_demo_project/models/account_model.dart';

class ArchiveState extends Equatable {
  final List<AccountModel> accountList;
  final bool isLoading;

  const ArchiveState({this.isLoading = true, this.accountList = const []});

  ArchiveState copyWith({
    List<AccountModel>? accountList,
    bool? isLoading,
  }) {
    return ArchiveState(
      accountList: accountList ?? this.accountList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [accountList, isLoading];
}
