///
//  Generated code. Do not modify.
//  source: proto/zsh_demo.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const NIMAutoLoginData$json = const {
  '1': 'NIMAutoLoginData',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'forcedMode', '3': 3, '4': 1, '5': 8, '10': 'forcedMode'},
    const {'1': 'step', '3': 4, '4': 1, '5': 11, '6': '.NIMLoginStep', '10': 'step'},
  ],
};

const NIMLoginStep$json = const {
  '1': 'NIMLoginStep',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.NIMLoginStep.State', '10': 'state'},
  ],
  '4': const [NIMLoginStep_State$json],
};

const NIMLoginStep_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'UN_KNOW', '2': 0},
    const {'1': 'UN_LOGIN', '2': 1},
    const {'1': 'FORBIDDEN', '2': 2},
    const {'1': 'VER_ERROR', '2': 3},
  ],
};

