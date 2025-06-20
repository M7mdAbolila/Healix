import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  final String? doctorId;
  final String? satFrom;
  final String? satTo;
  final String? sunFrom;
  final String? sunTo;
  final String? monFrom;
  final String? monTo;
  final String? tueFrom;
  final String? tueTo;
  final String? wedFrom;
  final String? wedTo;
  final String? thuFrom;
  final String? thuTo;
  final String? friFrom;
  final String? friTo;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const ScheduleEntity({
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
  });

  @override
  List<Object?> get props => [
        doctorId,
        satFrom,
        satTo,
        sunFrom,
        sunTo,
        monFrom,
        monTo,
        tueFrom,
        tueTo,
        wedFrom,
        wedTo,
        thuFrom,
        thuTo,
        friFrom,
        friTo,
        id,
        createdAt,
        isDeleted,
      ];
}
