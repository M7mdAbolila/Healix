import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/medicine_entity.dart';

part 'medicine_model.g.dart';

@JsonSerializable()
class MedicineModel extends MedicineEntity {
  const MedicineModel({
    super.medicineName,
    super.frequency,
    super.endDate,
    super.startDate,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineModelToJson(this);
}
