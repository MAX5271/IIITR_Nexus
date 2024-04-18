import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiitrnexus1/core/utils.dart';
import 'package:iiitrnexus1/features/common/error.dart';
import 'package:iiitrnexus1/features/common/loader.dart';
import 'package:iiitrnexus1/features/community/controller/community_controller.dart';
import 'package:iiitrnexus1/features/home/drawers/community_list_drawer.dart';
import 'package:iiitrnexus1/models/community_modle.dart';

class EditCommunityScreen extends ConsumerStatefulWidget {
  final String name;
  const EditCommunityScreen({required this.name, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCommunityScreenState();
}

class _EditCommunityScreenState extends ConsumerState<EditCommunityScreen> {
  File? bannerFile;
  File? profileFile;
  Uint8List? bannerWebFile;
  Uint8List? profileWebFile;

  void selectBannerImage() async {
    final res = await pickImage();

    if (res != null) {
      if (kIsWeb) {
        setState(() {
          bannerWebFile = res.files.first.bytes;
        });
      } else {
        setState(() {
          bannerFile = File(res.files.first.path!);
        });
      }
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();

    if (res != null) {
      if (kIsWeb) {
        setState(() {
          profileWebFile = res.files.first.bytes;
        });
      } else {
        setState(() {
          profileFile = File(res.files.first.path!);
        });
      }
    }
  }

  void save(Community community) {
    ref.read(communityControllerProvider.notifier).editCommunity(
          profileFile: profileFile,
          bannerFile: bannerFile,
          context: context,
          community: community,
          profileWebFile: profileWebFile,
          bannerWebFile: bannerWebFile,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);

    return ref.watch(getCommunityByNameProvider(widget.name)).when(
        data: (community) => Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                actions: [
                  TextButton(
                    onPressed: () {
                      save(community);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                title: const Text(
                  "Edit Community",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: isLoading
                  ? const Loader()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectBannerImage();
                                  },
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    strokeWidth: 2,
                                    radius: const Radius.circular(20),
                                    strokeCap: StrokeCap.round,
                                    dashPattern: [10, 4],
                                    color: Colors.white,
                                    child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: bannerFile != null
                                          ? Image.file(bannerFile!)
                                          : (community.banner.isEmpty ||
                                                  community.banner ==
                                                      'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg')
                                              ? const Icon(
                                                  Icons.camera_alt_outlined,
                                                  color: Colors.white,
                                                  size: 50,
                                                )
                                              : Image.network(community.banner),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 15,
                                  child: GestureDetector(
                                    onTap: () {
                                      selectProfileImage();
                                    },
                                    child: profileFile != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: CircleAvatar(
                                              radius: 32,
                                              backgroundImage:
                                                  FileImage(profileFile!),
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: CircleAvatar(
                                              radius: 32,
                                              backgroundImage: NetworkImage(
                                                  community.avatar),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
        error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
        loading: () => const Loader());
  }
}
