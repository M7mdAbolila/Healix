import 'package:flutter/material.dart';

String formatFileName(String fileName) {
  final lastDotIndex = fileName.lastIndexOf('.');
  if (lastDotIndex == -1) {
    return fileName.length > 8 ? '${fileName.substring(0, 5)}...' : fileName;
  }

  final nameWithoutExtension = fileName.substring(0, lastDotIndex);
  final extension = fileName.substring(lastDotIndex);

  if (nameWithoutExtension.length <= 5) {
    return fileName;
  }

  return '${nameWithoutExtension.substring(0, 5)}...$extension';
}

String getFileExtension(String fileName) {
  final lastDotIndex = fileName.lastIndexOf('.');
  if (lastDotIndex != -1 && lastDotIndex < fileName.length - 1) {
    return fileName.substring(lastDotIndex + 1).toLowerCase();
  }
  return '';
}

String formatFileSize(int bytes) {
  if (bytes < 1024) {
    return '${bytes}B';
  } else if (bytes < 1024 * 1024) {
    return '${(bytes / 1024).toStringAsFixed(1)}KB';
  } else if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
  } else {
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)}GB';
  }
}

IconData getFileTypeIcon(String extension) {
  switch (extension) {
    case 'pdf':
      return Icons.picture_as_pdf;
    case 'doc':
    case 'docx':
      return Icons.description;
    case 'xls':
    case 'xlsx':
      return Icons.table_chart;
    case 'ppt':
    case 'pptx':
      return Icons.slideshow;
    case 'jpg':
    case 'jpeg':
    case 'png':
    case 'gif':
      return Icons.image;
    case 'mp4':
    case 'avi':
    case 'mov':
      return Icons.video_file;
    case 'mp3':
    case 'wav':
      return Icons.audio_file;
    default:
      return Icons.attach_file;
  }
}
