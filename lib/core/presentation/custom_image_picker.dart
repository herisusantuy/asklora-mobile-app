import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../feature/payment/deposits/repository/file_picker_repository.dart';
import 'custom_text.dart';

class CustomImagePicker extends StatelessWidget {
  final bool disabled;
  final String title;
  final EdgeInsets padding;
  final List<PlatformFile> initialValue;
  final String? additionalText;
  final Function(List<PlatformFile>)? onImagePicked;
  final Function(PlatformFile)? onImageDeleted;
  final FilePickerRepository filePickerRepository = FilePickerRepository();

  CustomImagePicker(
      {required this.title,
      this.initialValue = const [],
      this.padding = EdgeInsets.zero,
      this.additionalText,
      this.onImagePicked,
      this.onImageDeleted,
      this.disabled = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            type: FontType.note,
            padding: const EdgeInsets.only(bottom: 6),
          ),
          initialValue.isEmpty
              ? _emptyImage(withHintText: true)
              : _haveImages(context),
          if (additionalText != null)
            CustomText(
              additionalText!,
              type: FontType.note,
              padding: const EdgeInsets.only(top: 20),
            )
        ],
      ),
    );
  }

  Widget _haveImages(BuildContext context) {
    double spacing = 12;
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth / 2 - spacing / 2;
        return Center(
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
                            color: const Color(0xffc2d1d9),
                            image: DecorationImage(
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
              if(!disabled)_emptyImage(withHintText: false, width: size, height: size)
            ],
          ),
        );
      },
    );
  }

  Widget _emptyImage(
          {bool withHintText = true,
          double width = double.infinity,
          double? height}) =>
      DottedBorder(
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
                if (withHintText)
                  CustomText(
                    title,
                    color: Colors.grey,
                    padding: const EdgeInsets.only(top: 20),
                  ),
              ],
            ),
          ));
}
