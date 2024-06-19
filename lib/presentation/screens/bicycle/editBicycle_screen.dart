import 'dart:io';

import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/presentation/providers/bicycle/bicycle_form_provider.dart';
import 'package:bykefastgo/presentation/providers/bicycle/bicycle_provider.dart';
import 'package:bykefastgo/shared/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../shared/shared.dart';
import '../../providers/providers.dart';

class EditBicycleScreen extends ConsumerWidget {
  final int bicycleId;

  const EditBicycleScreen({super.key, required this.bicycleId});

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bicycleState = ref.watch(bicycleProvider(bicycleId));
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar bicicleta'),
          leading: IconButton(
            onPressed: () async {
              context.pop(context);
            },
            icon: const Icon(LineAwesomeIcons.angle_left_solid),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final photoPath =
                      await CameraGalleryServiceImpl().selectPhoto();
                  if (photoPath == null) return;
                  ref
                      .read(bicycleFormProvider(bicycleState.bicycle!).notifier)
                      .onImageChanged(photoPath);
                  photoPath;
                },
                icon: const Icon(Icons.photo_library_outlined)),
            IconButton(
              onPressed: () async {
                final photoPath = await CameraGalleryServiceImpl().takePhoto();
                if (photoPath == null) return;
                ref
                    .read(bicycleFormProvider(bicycleState.bicycle!).notifier)
                    .onImageChanged(photoPath);
                photoPath;
              },
              icon: const Icon(Icons.camera_alt_outlined),
            ),
          ],
        ),
        body: bicycleState.isLoading
            ? const LoadingScreen()
            : _ProductView(bicycle: bicycleState.bicycle!),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();
            if (bicycleState.bicycle == null) return;
            await ref
                .read(
                  bicycleFormProvider(bicycleState.bicycle!).notifier,
                )
                .onFormSubmit()
                .then((value) {
              if (!value) {
                showSnackBar(context, 'Bicicleta actualizada');
              } else {
                showSnackBar(context, 'Error al actualizar bicicleta');
              }
            });

            await ref.read(userProvider.notifier).getUserById();
          },
          child: const Icon(Icons.save_as_outlined),
        ),
      ),
    );
  }
}

class _ProductView extends ConsumerWidget {
  final BicycleDto bicycle;
  const _ProductView({required this.bicycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bicycleForm = ref.watch(bicycleFormProvider(bicycle));
    final textStyles = Theme.of(context).textTheme;

    late ImageProvider imageProvider;
    
    if (bicycleForm.imageData.startsWith('http')) {
      imageProvider = NetworkImage(bicycleForm.imageData);
    } else if (bicycleForm.imageData.isNotEmpty){
      imageProvider = FileImage(File(bicycleForm.imageData));
    } else {
      imageProvider = const AssetImage('assets/images/no-image.jpg');
    }
    return ListView(
      children: [
        SizedBox(
            height: 250,
            width: 600,
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),  
          ),
        const SizedBox(height: 10),
        Center(
            child: Text(bicycleForm.title.value, style: textStyles.titleSmall)),
        const SizedBox(height: 10),
        _ProductInformation(bicycle: bicycle),
      ],
    );
  }
}

class _ProductInformation extends ConsumerWidget {
  final BicycleDto bicycle;
  const _ProductInformation({required this.bicycle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bicycleForm = ref.watch(bicycleFormProvider(bicycle));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          CustomBicycleField(
            isTopField: true,
            label: 'Nombre',
            initialValue: bicycleForm.title.value,
            onChanged:
                ref.read(bicycleFormProvider(bicycle).notifier).onTitleChanged,
            errorMessage: bicycleForm.title.errorMessage,
          ),
          CustomBicycleField(
            isTopField: false,
            maxLines: 1,
            label: 'Descripción',
            initialValue: bicycleForm.description,
            onChanged: (value) => ref
                .read(bicycleFormProvider(bicycle).notifier)
                .onDescriptionChanged(value),
            errorMessage: bicycleForm.title.errorMessage,
          ),
          CustomBicycleField(
            isTopField: false,
            label: 'Modelo',
            initialValue: bicycleForm.model.value,
            onChanged: (value) => ref
                .read(bicycleFormProvider(bicycle).notifier)
                .onModelChanged(value),
            errorMessage: bicycleForm.model.errorMessage,
          ),
          CustomBicycleField(
            isBottomField: false,
            label: 'Precio - Soles',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: bicycleForm.price.value.toString(),
            onChanged: (value) => ref
                .read(bicycleFormProvider(bicycle).notifier)
                .onPriceChanged(double.tryParse(value) ?? -1),
            errorMessage: bicycleForm.price.errorMessage,
          ),
          CustomBicycleField(
            isBottomField: true,
            label: 'Tamaño - Metros',
            initialValue: bicycleForm.size,
            onChanged: (value) => ref
                .read(bicycleFormProvider(bicycle).notifier)
                .onSizeChanged(value),
            errorMessage: bicycleForm.title.errorMessage,
          ),
        ],
      ),
    );
  }
}
