import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/text_fields/style/text_field_style.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../bloc/lora_gpt_bloc.dart';
import '../domain/conversation.dart';
import '../repository/lora_gpt_repository.dart';
import 'widget/in_chat_bubble_widget.dart';
import 'widget/out_chat_bubble_widget.dart';

class LoraGptScreen extends StatefulWidget {
  const LoraGptScreen({super.key});

  @override
  State<LoraGptScreen> createState() => _LoraGptScreenState();
}

class _LoraGptScreenState extends State<LoraGptScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: BlocProvider(
        create: (_) => LoraGptBloc(loraGptRepository: LoraGptRepository()),
        child: Column(
          children: [
            CustomHeader(
              isShowBottomBorder: true,
              title: '',
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AskLoraColors.primaryGreen),
                  ),
                  const SizedBox(width: 10),
                  CustomTextNew(
                    'LORAGPT',
                    style: AskLoraTextStyles.h5Italic,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: _chatList()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: _bottomContent(),
            )
          ],
        ),
      ),
    );
  }

  Widget _chatList() {
    return BlocBuilder<LoraGptBloc, LoraGptState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return ListView.separated(
            reverse: true,
            itemCount: state.conversations.length,
            itemBuilder: (context, index) {
              final message =
                  state.conversations[(state.conversations.length - 1) - index];
              if (message is Lora) {
                return OutChatBubbleWidget((message).response);
              } else if (message is Me) {
                return InChatBubbleWidget((message).query);
              } else {
                return const OutChatBubbleWidget('Loading...');
              }
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 17,
            ),
          );
        });
  }

  Widget _bottomContent() {
    return BlocBuilder<LoraGptBloc, LoraGptState>(
      buildWhen: (previous, current) => previous.query != current.query,
      builder: (context, state) {
        if (state.query.isEmpty) {
          controller.clear();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                  onFieldSubmitted: (str) =>
                      context.read<LoraGptBloc>().add(OnEditQuery(str)),
                  controller: controller,
                  onChanged: (str) =>
                      context.read<LoraGptBloc>().add(OnEditQuery(str)),
                  maxLines: 5,
                  minLines: 1,
                  style: TextFieldStyle.valueTextStyle,
                  decoration: TextFieldStyle.inputDecoration
                      .copyWith(hintText: 'Ask Lora something...')),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (state.query.isNotEmpty) {
                    context.read<LoraGptBloc>().add(const OnSearchQuery());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: state.query.isEmpty
                      ? AskLoraColors.lightGray50Alpha
                      : AskLoraColors.primaryGreen,
                  shape: const CircleBorder(),
                  fixedSize: const Size(55, 55),
                ),
                child: getSvgIcon('icon_sent_text',
                    color: state.query.isEmpty
                        ? AskLoraColors.darkGray
                        : AskLoraColors.charcoal))
          ],
        );
      },
    );
  }
}
