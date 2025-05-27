import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

typedef OnImagesSelected = void Function(List<XFile> images);

class CustomImagePicker extends StatefulWidget {
  final OnImagesSelected onImagesSelected;
  final int maxImages;

  const CustomImagePicker({
    super.key,
    required this.onImagesSelected,
    this.maxImages = 1,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];

  Future<String> _saveFileToAppDir(XFile file) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${file.name}';
      final savedFile = await File(file.path).copy('${appDir.path}/$fileName');
      return savedFile.path;
    } catch (e) {
      debugPrint('Error saving file: $e');
      return file.path; // fallback to original if saving fails
    }
  }

  Future<void> _pickImages() async {
    try {
      List<XFile> pickedImages = [];

      if (widget.maxImages == 1) {
        final XFile? image = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 80,
        );
        if (image != null) {
          pickedImages = [image];
        }
      } else {
        pickedImages = await _picker.pickMultiImage(
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 80,
        );
      }

      if (pickedImages.isNotEmpty) {
        // Save each image to app directory and get new paths
        List<XFile> savedImages = [];
        for (var pickedImage in pickedImages) {
          final savedPath = await _saveFileToAppDir(pickedImage);
          savedImages.add(XFile(savedPath));
        }

        final totalImages = _selectedImages.length + savedImages.length;

        if (totalImages > widget.maxImages) {
          final availableSlots = widget.maxImages - _selectedImages.length;
          final imagesToAdd = savedImages.take(availableSlots).toList();

          setState(() {
            _selectedImages.addAll(imagesToAdd);
          });

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You can only select up to ${widget.maxImages} images.'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        } else {
          setState(() {
            _selectedImages.addAll(savedImages);
          });
        }

        widget.onImagesSelected(_selectedImages);
      }
    } catch (e) {
      debugPrint('Image picking error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: _selectedImages.length >= widget.maxImages ? null : _pickImages,
          icon: const Icon(Icons.photo_library),
          label: Text(
            _selectedImages.length >= widget.maxImages ? 'Image limit reached' : 'Select Images',
          ),
        ),
        const SizedBox(height: 12),
        if (_selectedImages.isNotEmpty) Image.file(File(_selectedImages.first.path))
        // SizedBox(
        //   height: 100,
        //   child: ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: _selectedImages.length,
        //     separatorBuilder: (_, __) => const SizedBox(width: 8),
        //     itemBuilder: (context, index) {
        //       final imageFile = File(_selectedImages[index].path);
        //       return Stack(
        //         children: [
        //           ClipRRect(
        //             borderRadius: BorderRadius.circular(8),
        //             child: Image.file(
        //               imageFile,
        //               width: 80,
        //               height: 80,
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //           Positioned(
        //             top: 2,
        //             right: 2,
        //             child: GestureDetector(
        //               onTap: () => _removeImage(index),
        //               child: Container(
        //                 padding: const EdgeInsets.all(2),
        //                 decoration: const BoxDecoration(
        //                   color: Colors.black54,
        //                   shape: BoxShape.circle,
        //                 ),
        //                 child: const Icon(
        //                   Icons.close,
        //                   size: 16,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
