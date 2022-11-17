import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_text.dart';
import 'bloc/localization_bloc.dart';

class LocalizationToggleButton extends StatelessWidget {
  const LocalizationToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocalizationBloc(),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xfff0faf9),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            border: Border.all(color: const Color(0xff7ecbdc))),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: LocalizationType.values
                .map((localizationType) =>
                    BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, state) {
                      bool active = state.localizationType == localizationType;
                      return GestureDetector(
                        onTap: () => context.read<LocalizationBloc>().add(
                            (LocalizationChanged(
                                localizationType: localizationType))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: active
                              ? const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)))
                              : null,
                          child: CustomText(
                            localizationType.name.toUpperCase(),
                            type: active?FontType.smallTextBold:FontType.smallText,
                            color: active ? Colors.white : Colors.grey,
                          ),
                        ),
                      );
                    }))
                .toList()),
      ),
    );
  }
}
