import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/widgets/asset_image/asset_image_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/analytics/analytics_manager.dart';
import '../../../../core/analytics/route_aware_analytics.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/text_styles.dart';

late List<CameraDescription> cameras;

class ScanQRView extends StatefulWidget {
  const ScanQRView({super.key});

  @override
  State<ScanQRView> createState() => _ScanQRViewState();
}

class _ScanQRViewState extends State<ScanQRView> {
  DateTime? detectedTime;
  CameraController? _controller;
  String? _parentFacilityId;
  final bool _showCountdownText = false;
  Timer? _timer;
  int _start = 5;
  final bool _isDetecting = true;

  @override
  void initState() {
    super.initState();
    _loadTfModel();
  }

  _loadTfModel() async {
    // Tflite.close();
    // await Tflite.loadModel(
    //   model: "models/mobilenet_v1_1.0_224.tflite",
    //   labels: "models/mobilenet_v1_1.0_224.txt",
    // );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          _takePicture();
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  _takePicture() async {
    final image = await _controller?.takePicture();
    if (image != null) {
      final cropedImage = await _cropImage(image.path);
      if (cropedImage != null) {
        // context.router
        //     .replace(MeterTakeapicConfirmationRoute(picture: cropedImage));
      }
    }
  }

  Future<File?> _cropImage(String filePath) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);

    final width = properties.width!;
    var offset = (properties.height! - properties.width!) / 2;

    final croppedFile = await FlutterNativeImage.cropImage(
        filePath, 0, offset.round(), width, width);

    return croppedFile;
  }

  initCamera(String parentFacilityId) {
    final camera = cameras.isNotEmpty ? cameras.last : null;
    if (camera != null) {
      _controller = CameraController(camera, ResolutionPreset.medium);
      _controller!.initialize().then((_) async {
        if (!mounted) {
          return;
        }
        setState(() {
          _parentFacilityId = parentFacilityId;
        });
        await Future.delayed(const Duration(seconds: 5));
        _controller?.setFlashMode(FlashMode.off);
        _controller?.startImageStream((image) {
          if (!_isDetecting) return;
          // Tflite.runModelOnFrame(
          //   bytesList: image.planes.map((plane) => plane.bytes).toList(),
          //   imageHeight: image.height,
          //   imageWidth: image.width,
          //   numResults: 1,
          // ).then(
          //   (recognitions) {
          //     if (recognitions != null && recognitions.isNotEmpty) {
          //       final listRecognitions = recognitions;
          //       log(listRecognitions.toString());
          //       final catalogClock =
          //           listRecognitions.firstWhereOrNull((element) {
          //         log(element.toString());
          //         final detectedClass = element['label'] as String?;
          //         final confidenceInClass = element["confidence"] as double?;
          //         if (detectedClass == null || confidenceInClass == null)
          //           return false;
          //         log('detectedClass: ${detectedClass}, confidenceInClass: ${confidenceInClass}');
          //         return (detectedClass == 'analog clock' ||
          //                 (detectedClass).contains('meter')) &&
          //             confidenceInClass * 100 >= 60;
          //       });
          //       if (catalogClock != null) {
          //         Tflite.close();
          //         _isDetecting = false;
          //         startTimer();
          //         setState(() {
          //           _showCountdownText = true;
          //         });
          //       }
          //     }
          //   },
          // );
        });
      }).catchError((Object e) {
        log(e.toString());
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel;
    //Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(162, 169, 169, 169),
      appBar: AppBar(
          actions: const [
            SizedBox(
              width: 50,
            )
          ],
          backgroundColor: const Color.fromARGB(255, 148, 0, 0),
          leading: Center(
              child: InkWell(
            onTap: () {
              context.router.pop();
            },
            child: SvgPicture.asset(
              "assets/images/back_arrow.svg",
            ),
          )),
          title: const Center(
            child: Text('Quét mã QR'),
          )),
      body: _buildPage(context),
    );
  }

  _buildQRCodeScanner() {
    return MobileScanner(
      allowDuplicates: true,
      onDetect: (barcode, args) async {
        log(barcode.rawValue ?? '');
        // debounce
        if (detectedTime != null &&
            DateTime.now().difference(detectedTime!).inSeconds <= 1) {
          return;
        }
        detectedTime = DateTime.now();
        final url = barcode.rawValue;
        if (url != null) {
          final indParent = url.indexOf('/facility/detail/');
          if (indParent >= 0) {
            final parentFacilityId =
                url.substring(indParent + '/facility/detail/'.length);
            initCamera(parentFacilityId);
          } else {
            final indChild = url.indexOf('/facility/');
            if (indChild >= 0) {
              final ids =
                  url.substring(indChild + '/facility/'.length).split('/');
              // ids[0] == parentFacilityId, ids[1] == childFacilityId
              if (ids.length == 2) {
                initCamera(int.parse(ids[1]).toString());
              }
            }
          }
        }
      },
    );
  }

  _buildCamera() {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipRect(
          child: Transform.scale(
            scale: _controller!.value.aspectRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1 / _controller!.value.aspectRatio,
                child: CameraPreview(_controller!),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppColors.cF5AF14_warning,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(width - 45 * 2),
                ),
              ),
            ),
            if (_showCountdownText)
              Center(
                child: Text(
                  _start.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 200,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  _buildPage(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _parentFacilityId != null
              ? _buildCamera()
              : _buildQRCodeScanner(),
        ),
        const OverlayShape(),
        Positioned(
            top: MediaQuery.of(context).size.height - 290, child: _content()),
      ],
    );
  }

  Widget _content() {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 13.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Text(
        'Quét mã QR của gia phả \nbạn muốn tham gia ',
        textAlign: TextAlign.center,
        style: TextStyles.medium14_lineHeight21_sur
            .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}

class OverlayShape extends StatelessWidget {
  const OverlayShape({Key? key}) : super(key: key);

  //final OverlayModel model;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var size = media.size;
    double width = media.orientation == Orientation.portrait
        ? size.shortestSide * .9
        : size.longestSide * .5;
    double padding = (size.width - width) / 2;

    double ratio = 9;
    double height = width;
    double radius = 9;
    if (media.orientation == Orientation.portrait) {}
    return Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(200, 217, 217, 217), BlendMode.srcOut),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 128,
                  right: padding,
                  left: padding,
                  child: Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(radius)),
                    child: const Center(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 128,
            left: padding,
            child: Container(
              width: width,
              height: width,
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
}
