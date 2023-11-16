import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../stores/processing_image_store.dart';

class ProcessingImage extends StatefulWidget {
  final String label;
  final String? id;
  final String? image;
  final Future<String> Function(String, String) callback;

  const ProcessingImage({
    super.key,
    required this.label,
    required this.id,
    required this.image,
    required this.callback,
  });

  @override
  State<ProcessingImage> createState() => _ProcessingImageState();
}

class _ProcessingImageState extends State<ProcessingImage> {
  late final ProcessingImageStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<ProcessingImageStore>();
    store.processImage(id: widget.id, image: widget.image, f: widget.callback);
  }

  @override
  void dispose() {
    Modular.dispose<ProcessingImageStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ScopedBuilder<ProcessingImageStore, String>(
            store: store,
            onLoading: (context) {
              return const Center(child: CircularProgressIndicator());
            },
            onError: (context, error) {
              store.processImage(id: widget.id, image: widget.image, f: widget.callback);
              return const Center(child: CircularProgressIndicator());
            },
            onState: (context, state) {
              if (state.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return Image.memory(
                base64Decode(state),
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(175),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(18)),
              ),
              child: Text(
                widget.label,
                style: TextStyle(
                  color: const Color(AppColors.black).withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
