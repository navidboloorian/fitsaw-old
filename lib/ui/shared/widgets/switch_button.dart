import 'package:fitsaw/ui/shared/providers/switch_button_provider.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/custom_container.dart';

class SwitchButton extends ConsumerWidget {
  // left = false, right = true
  final String left;
  final String right;
  final dynamic provider;

  const SwitchButton({
    Key? key,
    required this.left,
    required this.right,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read state
    final bool switchButtonState = ref.watch(provider);

    // alter state
    final SwitchButtonNotifier switchButtonProvider =
        ref.watch(provider.notifier);

    return CustomContainer(
      padding: 0,
      Row(
        children: [
          GestureDetector(
            onTap: () => switchButtonProvider.set(false),
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                color: switchButtonState
                    ? Colors.transparent
                    : CustomColors.fitsawGreen,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.45 - 1,
              child: Center(
                child: Text(
                  left,
                  style: TextStyle(
                    color: switchButtonState
                        ? CustomColors.dmPrimaryText
                        : CustomColors.dmScreenBackground,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => switchButtonProvider.set(true),
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                color: switchButtonState
                    ? CustomColors.fitsawGreen
                    : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.45 - 1,
              child: Center(
                child: Text(
                  right,
                  style: TextStyle(
                    color: switchButtonState
                        ? CustomColors.dmScreenBackground
                        : CustomColors.dmPrimaryText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
