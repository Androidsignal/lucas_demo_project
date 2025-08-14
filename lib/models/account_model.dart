class AccountModel {
  final String? id;
  final DateTime? createdAt;
  final double? balance;
  final double? equity;
  final String? accountName;
  final int? currentPhase; // 0=funded, 1=evaluation1, 2=evaluation2...
  final int? numPhases;
  final double? size;
  final bool? active;
  final bool? isProAccount;
  final bool onChallenge; // true if evaluation stage

  AccountModel({
    this.id,
    this.createdAt,
    this.balance,
    this.equity,
    this.accountName,
    this.currentPhase,
    this.numPhases,
    this.size,
    this.active,
    this.isProAccount,
    this.onChallenge = false,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      balance: (json['balance'] as num?)?.toDouble(),
      equity: (json['equity'] as num?)?.toDouble(),
      accountName: json['accountName'],
      currentPhase: json['currentPhase'],
      numPhases: json['numPhases'],
      size: (json['size'] as num?)?.toDouble(),
      active: json['active'],
      isProAccount: json['isProAccount'],
      onChallenge: json['onChallenge'] ?? false,
    );
  }
}
