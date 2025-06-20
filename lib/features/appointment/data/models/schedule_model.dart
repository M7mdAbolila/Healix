import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/schedule_entity.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel extends ScheduleEntity {
  @override
  @JsonKey(name: 'doctorId')
  final String? doctorId;

  @override
  @JsonKey(name: 'satFrom')
  final String? satFrom;

  @override
  @JsonKey(name: 'satTo')
  final String? satTo;

  @override
  @JsonKey(name: 'sunFrom')
  final String? sunFrom;

  @override
  @JsonKey(name: 'sunTo')
  final String? sunTo;

  @override
  @JsonKey(name: 'monFrom')
  final String? monFrom;

  @override
  @JsonKey(name: 'monTo')
  final String? monTo;

  @override
  @JsonKey(name: 'tueFrom')
  final String? tueFrom;

  @override
  @JsonKey(name: 'tueTo')
  final String? tueTo;

  @override
  @JsonKey(name: 'wedFrom')
  final String? wedFrom;

  @override
  @JsonKey(name: 'wedTo')
  final String? wedTo;

  @override
  @JsonKey(name: 'thuFrom')
  final String? thuFrom;

  @override
  @JsonKey(name: 'thuTo')
  final String? thuTo;

  @override
  @JsonKey(name: 'friFrom')
  final String? friFrom;

  @override
  @JsonKey(name: 'friTo')
  final String? friTo;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const ScheduleModel({
    this.doctorId,
    this.satFrom,
    this.satTo,
    this.sunFrom,
    this.sunTo,
    this.monFrom,
    this.monTo,
    this.tueFrom,
    this.tueTo,
    this.wedFrom,
    this.wedTo,
    this.thuFrom,
    this.thuTo,
    this.friFrom,
    this.friTo,
    this.id,
    this.createdAt,
    this.isDeleted,
  }) : super(
          doctorId: doctorId,
          satFrom: satFrom,
          satTo: satTo,
          sunFrom: sunFrom,
          sunTo: sunTo,
          monFrom: monFrom,
          monTo: monTo,
          tueFrom: tueFrom,
          tueTo: tueTo,
          wedFrom: wedFrom,
          wedTo: wedTo,
          thuFrom: thuFrom,
          thuTo: thuTo,
          friFrom: friFrom,
          friTo: friTo,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}
