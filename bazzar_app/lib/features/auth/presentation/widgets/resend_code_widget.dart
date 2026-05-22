import 'dart:async';

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({
    super.key,
    this.durationSeconds = 60,
    this.promptText = "Didn't receive the code? ",
    required this.onResend,
  });

  final int durationSeconds;
  final String promptText;
  final VoidCallback onResend;

  @override
  State<ResendCodeWidget> createState() => ResendCodeWidgetState();
}

class ResendCodeWidgetState extends State<ResendCodeWidget> {
  Timer? _timer;
  late int _secondsLeft;

  void restartTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = widget.durationSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.durationSeconds;
    restartTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.promptText,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey400),
        ),
        if (_secondsLeft > 0)
          Text(
            'Resend in ${_secondsLeft}s',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey500),
          )
        else
          CustomTextButton(text: 'Resend', onPressed: widget.onResend),
      ],
    );
  }
}
