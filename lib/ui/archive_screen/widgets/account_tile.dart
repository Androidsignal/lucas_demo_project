import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lucas_demo_project/ui/archive_screen/widgets/step_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../models/account_model.dart';
import '../../../constants/app_strings.dart';
import '../../../themes/app_theme.dart';
import '../../../themes/responsive_helper.dart';
import '../../../utils/helper.dart';
import 'status_chip.dart';

class AccountTile extends StatelessWidget {
  final AccountModel accountModel;

  const AccountTile({super.key, required this.accountModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPro = accountModel.isProAccount ?? false;
    final accountName = accountModel.accountName ?? "N/A";
    final equity = accountModel.equity ?? 0;
    final balance = accountModel.balance ?? 0;
    final createdAt = accountModel.createdAt;
    final accountId = accountModel.id ?? "N/A";
    final currentPhase = accountModel.currentPhase ?? 0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(
          context,
          defaultValue: 525,
          conditionalValues: const [
            Condition.smallerThan(name: DESKTOP, value: 525),
            Condition.smallerThan(name: MOBILE, value: 280),
          ],
        ).value,
        autoCalculateMediaQueryData: true,
        child: Card(
          elevation: 8,
          shadowColor: colorScheme.shadow.withOpacity(0.26),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary,
                  colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _HeaderRow(
                  accountName: accountName,
                  isPro: isPro,
                  currentPhase: currentPhase,
                  theme: theme,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Helper.usd(equity),
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: ResponsiveHelper.amount(context),
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                _InfoRow(
                  balance: balance,
                  createdAt: createdAt,
                  accountId: accountId,
                  context: context,
                ),
                StepperBar(
                  numPhases: accountModel.numPhases ?? 0,
                  currentPhase: accountModel.currentPhase ?? 0,
                ),
                Container(
                  width: double.infinity,
                  height: 42,
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveHelper.title(context),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement navigation to dashboard
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 2,
                    ),
                    label: Text(
                      AppStrings.instance.dashboard,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    icon: SvgPicture.asset(
                      'assets/presentation.svg',
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final String accountName;
  final bool isPro;
  final int currentPhase;
  final ThemeData theme;

  const _HeaderRow({
    required this.accountName,
    required this.isPro,
    required this.currentPhase,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    accountName,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: ResponsiveHelper.title(context),
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (isPro)
                  Tooltip(
                    message: AppStrings.instance.proAccountTooltip,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: colorScheme.onPrimary.withOpacity(0.2)),
                      ),
                      child: Text(
                        AppStrings.instance.proLabel,
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: proTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          StatusChip(currentPhase: currentPhase),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final num balance;
  final DateTime? createdAt;
  final String accountId;
  final BuildContext context;

  const _InfoRow({
    required this.balance,
    required this.createdAt,
    required this.accountId,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final labelStyle = TextStyle(
      color: colorScheme.onPrimary.withOpacity(0.7),
      fontSize: ResponsiveHelper.labelMedium(context),
      fontWeight: FontWeight.w100,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.instance.balanceLabel, style: labelStyle),
          Text(
            Helper.usd(balance),
            style: theme.textTheme.headlineMedium!.copyWith(
              fontSize: ResponsiveHelper.labelMedium(context),
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Helper.dotSeparator(context),
          Text(AppStrings.instance.boughtLabel, style: labelStyle),
          InkWell(
            onTap: () {
              // Handle click
            },
            borderRadius: BorderRadius.circular(4),
            child: (createdAt != null)
                ? Tooltip(
                    message: AppStrings.instance.purchaseInfoTooltip,
                    child: Text(
                      DateFormat('MMM d, yyyy').format(createdAt!),
                      style: labelStyle.copyWith(
                        color: colorScheme.onPrimary,
                        decoration: TextDecoration.underline,
                        decorationColor: colorScheme.onPrimary,
                      ),
                    ),
                  )
                : Text("N/A", style: labelStyle),
          ),
          const SizedBox(width: 4),
          Tooltip(
            message: AppStrings.instance.purchaseInfoTooltip,
            child: SvgPicture.asset(
              "assets/info-circle.svg",
              width: 14,
              height: 14,
              color: colorScheme.onPrimary.withOpacity(0.7),
            ),
          ),
          Helper.dotSeparator(context),
          Tooltip(
            message: AppStrings.instance.accountIdTooltip,
            child: Text(
              accountId,
              style: labelStyle,
            ),
          ),
          const SizedBox(width: 4),
          Tooltip(
            message: AppStrings.instance.accountInfoTooltip,
            child: SvgPicture.asset(
              "assets/info-circle.svg",
              width: 14,
              height: 14,
              color: colorScheme.onPrimary.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
