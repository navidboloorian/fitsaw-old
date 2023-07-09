import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/custom_container.dart';

class SwitchButton extends ConsumerWidget {
  // false = left, true = right
  final String left;
  final String right;
  final dynamic provider;

  const SwitchButton({
    super.key,
    required this.left,
    required this.right,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swtichButtonProvider = ref.watch(provider.notifier);

    return CustomContainer(
      padding: 0,
      Row(
        children: [
          GestureDetector(
            onTap: () => swtichButtonProvider.set(false),
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                color: swtichButtonProvider.state
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
                    color: swtichButtonProvider.state
                        ? CustomColors.dmPrimaryText
                        : CustomColors.dmScreenBackground,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => swtichButtonProvider.set(true),
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                color: swtichButtonProvider.state
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
                    color: swtichButtonProvider.state
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
