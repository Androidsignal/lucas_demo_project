import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lucas_demo_project/ui/archive_screen/widgets/step_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../constants/app_strings.dart';
import '../../../models/account_model.dart';
import '../../../themes/responsive_helper.dart';
import '../../../utils/helper.dart';
import 'status_chip.dart';

@immutable
class AccountMobileTile extends StatelessWidget {
  final AccountModel accountModel;

  const AccountMobileTile({
    super.key,
    required this.accountModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final labelStyle = TextStyle(
      color: colorScheme.onPrimary.withOpacity(0.7),
      fontSize: ResponsiveHelper.title(context),
      fontWeight: FontWeight.w100,
    );

    return ResponsiveScaledBox(
      width: ResponsiveValue<double>(
        context,
        defaultValue: 380,
        conditionalValues: [
          Condition.smallerThan(name: ResponsiveHelper.kTablet, value: 380),
          Condition.smallerThan(name: ResponsiveHelper.kMobile, value: 350),
        ],
      ).value,
      autoCalculateMediaQueryData: true,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A3B72),
                Color(0xFF0D1B3D),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(ResponsiveHelper.titleLarge(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  StatusChip(currentPhase: accountModel.currentPhase ?? 0),
                  const SizedBox(width: 12),
                  StepPill(
                    label: (accountModel.currentPhase == 0)
                        ? AppStrings.instance.funded
                        : (accountModel.currentPhase == 1)
                            ? AppStrings.instance.evaluation1
                            : (accountModel.currentPhase == 2)
                                ? AppStrings.instance.evaluation2
                                : AppStrings.instance.masterAccount,
                    icon: (accountModel.currentPhase == 0)
                        ? "assets/ic_bar_chart.svg"
                        : (accountModel.currentPhase == 1)
                            ? "assets/ic_bar_chart.svg"
                            : (accountModel.currentPhase == 2)
                                ? "assets/ic_bar_chart.svg"
                                : "assets/lock_open_rounded.svg",
                    isActive: true,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      accountModel.accountName ?? AppStrings.instance.notAvailable,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: ResponsiveHelper.titleLarge(context),
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A3B72),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Text(
                      AppStrings.instance.proLabel,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: const Color(0xFFCCDBFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                    ),
                  ),
                ],
              ),
              Text(
                Helper.usd(accountModel.equity ?? 0),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: ResponsiveHelper.amount(context),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
              ),
              Row(
                children: [
                  Text(
                    AppStrings.instance.balanceLabel,
                    style: labelStyle,
                  ),
                  Text(
                    Helper.usd(accountModel.balance ?? 0),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveHelper.title(context),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    AppStrings.instance.boughtLabel,
                    style: labelStyle,
                  ),
                  InkWell(
                    onTap: () {
                      // Handle click
                    },
                    child: (accountModel.createdAt != null)
                        ? Tooltip(
                            message: AppStrings.instance.purchaseInfoTooltip,
                            child: Text(
                              DateFormat('MMM d, yyyy').format(accountModel.createdAt!),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ResponsiveHelper.title(context),
                              ),
                            ),
                          )
                        : Text("N/A", style: labelStyle),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    "assets/info-circle.svg",
                    width: 14,
                    height: 14,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    AppStrings.instance.idLabel,
                    style: TextStyle(
                        color: Colors.white70, fontSize: ResponsiveHelper.title(context), fontWeight: FontWeight.w100),
                  ),
                  Text(
                    accountModel.id ?? AppStrings.instance.notAvailable,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveHelper.title(context),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    "assets/info-circle.svg",
                    width: 14,
                    height: 14,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: kMinInteractiveDimension,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  label: Text(AppStrings.instance.dashboard,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                  icon: SvgPicture.asset(
                    'assets/presentation.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
