import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

enum TaskStatus { created, done, confirmed }

@freezed
class TaskDTO with _$TaskDTO {
  const factory TaskDTO({
    required String name,
    required String price,
    @Default(TaskStatus.created) TaskStatus status,
  }) = _TaskDTO;

  factory TaskDTO.fromJson(Object? json) =>
      _$TaskDTOFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();
}
