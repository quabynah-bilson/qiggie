import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/piggies/presentation/manager/bank_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/customer/customer_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/protos/bank.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final _bankBloc = context.read<BankBloc>(), _customerBloc = context.read<CustomerBloc>();

  @override
  void initState() {
    super.initState();
    doAfterDelay(() {
      _bankBloc.add(GetQiggiesBankEvent());
      // TODO -> only show for unauthenticated users
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiOverlay = context.theme.brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Scaffold(
      extendBody: true,
      body: AnimationLimiter(
        child: CustomScrollView(
          slivers: [
            /// action section
            SliverAppBar(
              pinned: true,
              floating: false,
              centerTitle: false,
              systemOverlayStyle: uiOverlay,
              backgroundColor: context.colorScheme.background,
              title: GestureDetector(
                onTap: context.showDashboardMenu,
                child: const AnimatedRow(
                  animateType: AnimateType.slideRight,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  duration: 850,
                  children: [
                    Icon(TablerIcons.menu),
                    Text(kAppName),
                  ],
                ),
              ),
              actions: AnimationConfiguration.toStaggeredList(
                childAnimationBuilder: (child) => SlideAnimation(
                  horizontalOffset: -50,
                  child: FadeInAnimation(child: child),
                ),
                children: [
                  _buildFilterButton,
                  _buildNotificationButton,
                ],
              ),
            ),

            /// promo card
            SliverToBoxAdapter(
              child: Container(
                height: context.height * 0.28,
                width: context.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    /// image background
                    Positioned.fill(
                      right: -context.width * 0.45,
                      top: -8,
                      bottom: 48,
                      // child: Assets.imgUserWallet.asAssetImage(),
                      child: Lottie.asset(Assets.animSaveMoney),
                    ),

                    Positioned.fill(
                      child: Container(
                        color: context.colorScheme.onSurface
                            .withOpacity(kEmphasisHigh),
                      ),
                    ),

                    /// foreground
                    Positioned.fill(
                      top: 20,
                      bottom: 20,
                      left: 24,
                      right: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Your $kAppName Bucket'.subtitle1(context,
                              emphasis: kEmphasisMedium,
                              color: context.colorScheme.surface),
                          Expanded(
                            child:
                                'View your total balance & savings plans here when you sign in'
                                    .h6(context,
                                        color: context.colorScheme.surface)
                                    .top(8),
                          ),
                          AppRoundedButton(
                                  text: 'Join now',
                                  backgroundColor: context.colorScheme.surface,
                                  textColor: context.colorScheme.onSurface,
                                  onTap: context.showLoginSheet)
                              // .align(Alignment.centerRight)
                              .top(40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// savings
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  'My Savings'.h6(context),
                  TextButton(
                    onPressed: () =>
                        context.navigator.pushNamed(AppRouter.savingsRoute),
                    child: 'View all'
                        .button(context, color: context.colorScheme.primary),
                  ),
                ],
              ).horizontal(24),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder(
                bloc: _bankBloc,
                builder: (context, state) {
                  if (state is ErrorState<String>) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EmptyContentPlaceholder(
                            icon: TablerIcons.pig_money,
                            title: 'Let\'s set your up',
                            subtitle: state.failure),
                        AppRoundedButton(
                                text: 'Add a new plan',
                                onTap: context.showAddNewQiggySheet)
                            .top(40)
                      ],
                    ).top(24);
                  }

                  if (state is SuccessState<Stream<List<QiggyBank>>>) {
                    return StreamBuilder<List<QiggyBank>>(
                      stream: state.data,
                      initialData: const [],
                      // todo: render piggies
                      builder: (context, snapshot) => snapshot.hasData &&
                              snapshot.data != null &&
                              snapshot.data!.isNotEmpty
                          ? ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                  left: 24, top: 16, right: 24),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var qiggy = snapshot.data![index];
                                return ListTile(
                                  onTap: () => context.navigator.pushNamed(AppRouter.savingsDetailsRoute),
                                  title: qiggy.description
                                      .capitalize()
                                      .subtitle1(context),
                                  subtitle:
                                      '${((qiggy.currentAmount / qiggy.goalAmount) * 100).toStringAsFixed(2)}% done'
                                          .subtitle2(context,
                                              emphasis: kEmphasisMedium),
                                );
                              },
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12),
                              itemCount: snapshot.data!.length,
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const EmptyContentPlaceholder(
                                    icon: TablerIcons.pig_money,
                                    title: 'Let\'s set your up',
                                    subtitle:
                                        'Add a new Qiggy bank to get started'),
                                AppRoundedButton(
                                        text: 'Add a new plan',
                                        onTap: context.showAddNewQiggySheet)
                                    .top(40)
                              ],
                            ).top(24),
                    );
                  }

                  return const LoadingIndicatorItem(
                      loadingAnimationUrl: kQiggieLoadingAnimUrl,
                      message: 'getting your piggies');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _buildNotificationButton => GestureDetector(
        onTap: () => context.navigator.pushNamed(AppRouter.notificationsRoute),
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color:
                context.colorScheme.onBackground.withOpacity(kEmphasisLowest),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child:
              Icon(TablerIcons.bell, color: context.colorScheme.onBackground),
        ),
      );

  /// filter results by day / week / month
  Widget get _buildFilterButton => Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: context.colorScheme.onBackground.withOpacity(kEmphasisLowest),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: GestureDetector(
          onTap: context.showFilterPiggiesMenu,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TODO: use the appropriate filter
              'This week'.bodyText2(context,
                  weight: FontWeight.w600,
                  color: context.colorScheme.onBackground),
              Icon(Icons.arrow_drop_down_circle_outlined,
                      color: context.colorScheme.onBackground)
                  .left(8)
            ],
          ),
        ),
      );
}
