import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucas_demo_project/models/account_model.dart';
import 'package:lucas_demo_project/ui/archive_screen/widgets/account_tile.dart';
import 'package:lucas_demo_project/ui/archive_screen/widgets/mobile_account_tile.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../constants/app_strings.dart';
import '../../themes/app_theme.dart';
import '../../themes/responsive_helper.dart';
import 'bloc/archive_bloc.dart';
import 'bloc/archive_state.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ArchiveBloc(),
      child: const ArchiveScreen(),
    );
  }
}

class ArchiveScreen extends StatefulWidget {
  static const routeName = '/archive';

  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  void initState() {
    context.read<ArchiveBloc>().fetchAccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      decoration: backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(AppStrings.instance.accountArchive,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: ResponsiveHelper.headline(context),
                  )),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          elevation: 0,
        ),
        body: Container(
          decoration: backgroundGradient,
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 20
                  : ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? 40
                      : 80,
              vertical: 10),
          child: BlocBuilder<ArchiveBloc, ArchiveState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading || previous.accountList != current.accountList,
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.accountList.isEmpty) {
                return Center(
                  child: Text(
                    AppStrings.instance.noAccountsFound,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: whiteColor,
                          fontSize: ResponsiveHelper.titleLarge(context),
                        ),
                  ),
                );
              }
              return LayoutBuilder(builder: (context, constraints) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                        ? 1.2
                        : ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? 1.9
                            : 2.0,
                  ),
                  itemCount: state.accountList.length,
                  itemBuilder: (context, index) {
                    final AccountModel accountModel = state.accountList[index];
                    return ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                        ? AccountMobileTile(
                            accountModel: accountModel,
                          )
                        : AccountTile(
                            accountModel: accountModel,
                          );
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
