import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/services/training_service.dart';
import '../../data/services/user_service.dart';
import '../../main.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../home/widgets/app_bar_widget.dart';

class HistoryWidget extends StatelessWidget {
  final String? testId;
  final String? testDate;
  final int? totalPoint;
  const HistoryWidget({
    super.key,
    this.testId,
    this.testDate,
    this.totalPoint,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TestService().getTestById(testId!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var test = snapshot.data!;
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 135,
                decoration: AppContainerStyle.border.copyWith(
                  color: AppColors.darkBrown,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Test date: ${DateFormat("dd/MM/yyyy").format(
                    DateTime.parse(testDate!),
                  )}',
                  style: AppTextStyle.bold25.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 100,
                decoration: AppContainerStyle.border.copyWith(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.network(test.image!),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              test.name!,
                              style: AppTextStyle.medium20,
                            ),
                            Text(
                              'Total point: ${totalPoint!.toString()}',
                              style: AppTextStyle.medium20.copyWith(
                                color: totalPoint! > 1500
                                    ? AppColors.green
                                    : AppColors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class TestHistoryScreen extends StatelessWidget {
  const TestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        screenTitle: 'Test history',
        titleColor: AppColors.darkBrown,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: UserHistoryService().getTestHistoryOfUser(
          prefs.getString('userId')!,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var history = snapshot.data!;
            return history.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: history.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return HistoryWidget(
                        testDate: history[index].testDate,
                        totalPoint: history[index].totalPoint,
                        testId: history[index].testId,
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.hourglass,
                          color: AppColors.black,
                          size: 50,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Your test history is empty',
                          style: AppTextStyle.medium20,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Review the result and improve your point here',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.medium15.copyWith(
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
