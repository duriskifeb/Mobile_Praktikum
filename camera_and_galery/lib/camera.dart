import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? _file;
  bool _isVideo = false;

  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoController;

  // ================================
  // PICK IMAGE FROM CAMERA
  // ================================
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      _disposeVideo();
      setState(() {
        _file = File(pickedFile.path);
        _isVideo = false;
      });
    }
  }

  // ================================
  // PICK IMAGE FROM GALLERY
  // ================================
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      _disposeVideo();
      setState(() {
        _file = File(pickedFile.path);
        _isVideo = false;
      });
    }
  }

  // ================================
  // PICK VIDEO FROM CAMERA
  // ================================
  Future<void> _pickVideoFromCamera() async {
    final XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      _initializeVideo(File(pickedFile.path));
    }
  }

  // ================================
  // PICK VIDEO FROM GALLERY
  // ================================
  Future<void> _pickVideoFromGallery() async {
    final XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      _initializeVideo(File(pickedFile.path));
    }
  }

  // ================================
  // INITIALIZE VIDEO PREVIEW
  // ================================
  void _initializeVideo(File file) {
    _disposeVideo(); // hapus controller lama jika ada

    _videoController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        setState(() {
          _file = file;
          _isVideo = true;
        });
        _videoController!.play(); // auto play
      });
  }

  // ================================
  // DISPOSE VIDEO CONTROLLER
  // ================================
  void _disposeVideo() {
    if (_videoController != null) {
      _videoController!.pause();
      _videoController!.dispose();
      _videoController = null;
    }
  }

  // ================================
  // FILE PREVIEW (IMAGE / VIDEO)
  // ================================
  Widget _buildFilePreview() {
    if (_file == null) {
      return const Text("Belum ada file dipilih");
    }

    if (_isVideo) {
      if (_videoController == null || !_videoController!.value.isInitialized) {
        return const CircularProgressIndicator();
      }

      return AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: VideoPlayer(_videoController!),
      );
    }

    return Image.file(
      _file!,
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }

  @override
  void dispose() {
    _disposeVideo(); // pastikan video ditutup
    super.dispose();
  }

  // ================================
  // UI
  // ================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera and Gallery')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                alignment: Alignment.center,
                child: _buildFilePreview(),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _pickImageFromCamera,
                child: const Text('Take Image from Camera'),
              ),
              ElevatedButton(
                onPressed: _pickImageFromGallery,
                child: const Text('Pick Image from Gallery'),
              ),
              ElevatedButton(
                onPressed: _pickVideoFromCamera,
                child: const Text('Record Video from Camera'),
              ),
              ElevatedButton(
                onPressed: _pickVideoFromGallery,
                child: const Text('Pick Video from Gallery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
