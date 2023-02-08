import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../bloc/response/user_response_bloc.dart';
import '../presentation/widget/omni_search_question_widget/domain/omni_search_model.dart';

class PpiDefaultAnswer {
  static int getIndex(BuildContext context, String questionId) {
    var data = context
        .read<UserResponseBloc>()
        .state
        .userResponse
        ?.firstWhereOrNull((element) => element.left == questionId);

    return data == null ? -1 : int.parse(data.right);
  }

  static String getString(BuildContext context, String questionId) {
    var data = context
        .read<UserResponseBloc>()
        .state
        .userResponse
        ?.firstWhereOrNull((element) => element.left == questionId);

    return data == null ? '' : data.right;
  }

  static OmniSearchModel getOmniSearch(BuildContext context, String questionId) {
    var data = context
        .read<UserResponseBloc>()
        .state
        .userResponse
        ?.firstWhereOrNull((element) => element.left == questionId);

    return data == null
        ? OmniSearchModel()
        : OmniSearchModel.fromJson(jsonDecode(data.right));
  }
}
