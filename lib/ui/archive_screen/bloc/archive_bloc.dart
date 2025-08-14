import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucas_demo_project/models/account_model.dart';
import '../../../services/account_service.dart';
import 'archive_state.dart';

class ArchiveBloc extends Cubit<ArchiveState> {
  ArchiveBloc() : super(ArchiveState());

  Future<void> fetchAccounts() async {
    final service = AccountService();
    List<AccountModel> accountList = await service.fetchAccounts();
    emit(state.copyWith(accountList: accountList, isLoading: false));
  }
}
