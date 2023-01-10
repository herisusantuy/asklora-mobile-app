import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../feature/payment/deposits/repository/file_picker_repository.dart';
import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import 'custom_text_new.dart';
import 'dotted_border/dotted_border.dart';

class CustomImagePicker extends StatelessWidget {
  final bool disabled;
  final String title;
  final Color titleColor;
  final String hintText;
  final List<PlatformFile> initialValue;
  final String? additionalText;
  final Function(List<PlatformFile>)? onImagePicked;
  final Function(PlatformFile)? onImageDeleted;
  final FilePickerRepository filePickerRepository = FilePickerRepository();

  CustomImagePicker(
      {required this.title,
      this.hintText = '',
      this.initialValue = const [],
      this.titleColor = AskLoraColors.charcoal,
      this.additionalText,
      this.onImagePicked,
      this.onImageDeleted,
      this.disabled = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew(
          title,
          style: AskLoraTextStyles.body2.copyWith(color: titleColor),
        ),
        const SizedBox(
          height: 6,
        ),
        initialValue.isEmpty ? _emptyImage() : _haveImages(context),
        if (additionalText != null)
          Padding(
            padding: const EdgeInsets.only(top: 13),
            child: CustomTextNew(
              additionalText!,
              style: AskLoraTextStyles.body3
                  .copyWith(color: AskLoraColors.charcoal),
            ),
          )
      ],
    );
  }

  Widget _haveImages(BuildContext context) {
    double spacing = 12;
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth / 2 - spacing / 2;
        return Align(
          alignment: disabled ? Alignment.centerLeft : Alignment.center,
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: [
              ...initialValue
                  .map((e) => Container(
                        padding: const EdgeInsets.all(6),
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffc2d1d9),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(e.path ?? '/')))),
                        child: disabled
                            ? const SizedBox.shrink()
                            : Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    if (onImageDeleted != null && !disabled) {
                                      onImageDeleted!(e);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                )),
                      ))
                  .toList(),
              if (!disabled) _emptyImage(width: size, height: size)
            ],
          ),
        );
      },
    );
  }

  Widget _emptyImage({double width = double.infinity, double? height}) =>
      DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(5),
          color: Colors.grey,
          dashPattern: const [4, 4],
          child: Container(
            width: width - 4,
            height: height != null ? height - 4 : null,
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (onImagePicked != null && !disabled) {
                      onImagePicked!(await filePickerRepository.pickFiles(
                          fileType: FileType.image));
                    }
                  },
                  child: const Icon(
                    Icons.add_circle_outline,
                    size: 56,
                    color: Colors.grey,
                  ),
                ),
                if (hintText.isNotEmpty && initialValue.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomTextNew(
                      hintText,
                      style: AskLoraTextStyles.body1
                          .copyWith(color: AskLoraColors.gray),
                    ),
                  ),
              ],
            ),
          ));
}
