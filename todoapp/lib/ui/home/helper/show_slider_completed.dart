import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/date_time_controller.dart';
import 'package:todoapp/ui/utils/widgets/custom_text_widget.dart';

class ShowSliderCompleted extends ConsumerWidget {
  const ShowSliderCompleted({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCompletdStatus = ref.watch(totalMessageCount);
    print(getCompletdStatus);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${getCompletdStatus[0]} of ${getCompletdStatus[1]} Completed"),
        Row(
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth - 55,
              child: LinearProgressIndicator(
                value: (getCompletdStatus[1] == 0)
                    ? 0
                    : getCompletdStatus[0] / getCompletdStatus[1],
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                minHeight: 8,
              ),
            ),
            Spacer(),
            CustomTextWidget(
              title:
                  "${((getCompletdStatus[1] == 0) ? 0 : (getCompletdStatus[0] / getCompletdStatus[1]) * 100).toInt()}%",
            ),
          ],
        ),
      ],
    );
  }
}
