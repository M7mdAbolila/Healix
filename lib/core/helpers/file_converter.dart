import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class FileConverter implements JsonConverter<File, String> {
  const FileConverter();

  @override
  File fromJson(String path) => File(path);

  @override
  String toJson(File file) => file.path;
}