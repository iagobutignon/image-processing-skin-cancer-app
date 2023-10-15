import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../states/edit_image_state.dart';
import '../../stores/edit_image_store.dart';

class EditImagePage extends StatefulWidget {
  final String title;
  final Uint8List picture;

  const EditImagePage({
    super.key,
    this.title = 'Editar Camera',
    required this.picture,
  });

  @override
  State<EditImagePage> createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  late final EditImageStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<EditImageStore>();
  }

  @override
  void dispose() {
    Modular.dispose<EditImageStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TripleBuilder<EditImageStore, EditImageState>(
                builder: (context, triple) {
                  if (triple.state.image == null) {
                    return const CircularProgressIndicator();
                  }
                  return ExtendedImage.memory(triple.state.image!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
