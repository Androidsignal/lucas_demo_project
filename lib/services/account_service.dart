import '../models/account_model.dart';

class AccountService {
  /// Simulate network delay and return dummy accounts
  Future<List<AccountModel>> fetchAccounts() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate API delay

    // Dummy JSON data as you’d get from backend
    final jsonData = [
      {
        "id": "acc_001",
        "createdAt": DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
        "balance": 10000.50,
        "equity": 9950.30,
        "accountName": "Evaluation 1",
        "currentPhase": 2,
        "numPhases": 2,
        "size": 10000,
        "active": true,
        "isProAccount": false,
        "onChallenge": true
      },
      {
        "id": "acc_002",
        "createdAt": DateTime.now().subtract(const Duration(days: 15)).toIso8601String(),
        "balance": 20000.00,
        "equity": 19800.00,
        "accountName": "Funded Account",
        "currentPhase": 2,
        "numPhases": 0,
        "size": 20000,
        "active": true,
        "isProAccount": true,
        "onChallenge": false
      },
      {
        "id": "acc_003",
        "createdAt": DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
        "balance": 5000.75,
        "equity": 4800.25,
        "accountName": "Evaluation 2",
        "currentPhase": 3,
        "numPhases": 2,
        "size": 5000,
        "active": false,
        "isProAccount": false,
        "onChallenge": false
      },
      {
        "id": "acc_004",
        "createdAt": DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
        "balance": 15000.00,
        "equity": 14920.40,
        "accountName": "Phase 1 Challenge",
        "currentPhase": 1,
        "numPhases": 3,
        "size": 15000,
        "active": true,
        "isProAccount": false,
        "onChallenge": true
      },
      {
        "id": "acc_005",
        "createdAt": DateTime.now().subtract(const Duration(days: 60)).toIso8601String(),
        "balance": 50000.00,
        "equity": 50120.50,
        "accountName": "Pro Account Large",
        "currentPhase": 0,
        "numPhases": 0,
        "size": 50000,
        "active": true,
        "isProAccount": true,
        "onChallenge": false
      },
      {
        "id": "acc_006",
        "createdAt": DateTime.now().subtract(const Duration(days: 10)).toIso8601String(),
        "balance": 7500.30,
        "equity": 7450.10,
        "accountName": "Evaluation 3",
        "currentPhase": 1,
        "numPhases": 2,
        "size": 7500,
        "active": true,
        "isProAccount": false,
        "onChallenge": true
      },
      {
        "id": "acc_007",
        "createdAt": DateTime.now().subtract(const Duration(days: 90)).toIso8601String(),
        "balance": 100000.00,
        "equity": 102500.00,
        "accountName": "Enterprise Fund",
        "currentPhase": 0,
        "numPhases": 1,
        "size": 100000,
        "active": true,
        "isProAccount": true,
        "onChallenge": false
      }
    ];


    return jsonData.map((e) => AccountModel.fromJson(e)).toList();
  }
}
