import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

List<MultipartFile> convertToMultipartFiles(List<PlatformFile> files) {
  return files.map((file) {
    final mimeType = _getMimeType(file.extension);
    print(
        'Debug: File ${file.name}, Extension: ${file.extension}, MIME Type: $mimeType');

    // Parse MIME type into DioMediaType
    final mediaType = DioMediaType.parse(mimeType);

    if (file.bytes != null) {
      return MultipartFile.fromBytes(
        file.bytes!,
        filename: file.name,
        contentType: mediaType,
      );
    } else if (file.path != null) {
      return MultipartFile.fromFileSync(
        file.path!,
        filename: file.name,
        contentType: mediaType,
      );
    } else {
      throw Exception('File has no bytes or path');
    }
  }).toList();
}

/// Get appropriate MIME type for file extension
String _getMimeType(String? extension) {
  if (extension == null) return 'application/octet-stream';

  // Get MIME type from file extension
  final mimeType = lookupMimeType('file.$extension');

  // If mime package doesn't recognize it, provide common fallbacks
  if (mimeType != null) {
    return mimeType;
  }

  // Fallback for common file types
  switch (extension.toLowerCase()) {
    case 'pdf':
      return 'application/pdf';
    case 'doc':
      return 'application/msword';
    case 'docx':
      return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    case 'xls':
      return 'application/vnd.ms-excel';
    case 'xlsx':
      return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    case 'ppt':
      return 'application/vnd.ms-powerpoint';
    case 'pptx':
      return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
    case 'txt':
      return 'text/plain';
    case 'rtf':
      return 'application/rtf';
    case 'csv':
      return 'text/csv';
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    case 'gif':
      return 'image/gif';
    case 'bmp':
      return 'image/bmp';
    case 'mp4':
      return 'video/mp4';
    case 'avi':
      return 'video/x-msvideo';
    case 'mov':
      return 'video/quicktime';
    case 'wmv':
      return 'video/x-ms-wmv';
    case 'mp3':
      return 'audio/mpeg';
    case 'wav':
      return 'audio/wav';
    case 'aac':
      return 'audio/aac';
    case 'zip':
      return 'application/zip';
    case 'rar':
      return 'application/vnd.rar';
    case '7z':
      return 'application/x-7z-compressed';
    default:
      return 'application/octet-stream';
  }
}
