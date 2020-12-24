import 'package:equatable/equatable.dart';

class SampleModel {
  final String name;
  final String midleName;
  SampleModel({
    this.name,
    this.midleName,
  });

  SampleModel copyWith({
    String name,
    String midleName,
  }) {
    return SampleModel(
      name: name ?? this.name,
      midleName: midleName ?? this.midleName,
    );
  }
}
