import 'package:flutter/cupertino.dart';
import '../../../data/services/user_service.dart';
import '../../../main.dart';
import '../../../res/themes.dart';

class VocabularyFavoriteMarker extends StatefulWidget {
  final String userId;
  final String vocabularyId;
  const VocabularyFavoriteMarker({
    super.key,
    required this.userId,
    required this.vocabularyId,
  });

  @override
  State<VocabularyFavoriteMarker> createState() =>
      _VocabularyFavoriteMarkerState();
}

class _VocabularyFavoriteMarkerState extends State<VocabularyFavoriteMarker> {
  IconData? marker;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initMarker();
    });
  }

  Future<void> initMarker() async {
    bool checker = await UserFavoriteCollectionService().isFavoriteVocabulary(
      userId: prefs.getString('userId')!,
      vocabularyId: widget.vocabularyId,
    );
    marker = checker ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserFavoriteCollectionService().isFavoriteVocabulary(
        userId: prefs.getString('userId')!,
        vocabularyId: widget.vocabularyId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var checker = snapshot.data!;

          return GestureDetector(
            onTap: () async {
              if (checker == false) {
                setState(() {
                  marker = CupertinoIcons.bookmark_fill;
                });
                await UserFavoriteCollectionService().markFavoriteVocabulary(
                  userId: prefs.getString('userId')!,
                  vocabularyId: widget.vocabularyId,
                );
              } else {
                setState(() {
                  marker = CupertinoIcons.bookmark;
                });
                await UserFavoriteCollectionService().removeFavoriteVocabulary(
                  userId: prefs.getString('userId')!,
                  vocabularyId: widget.vocabularyId,
                );
              }
            },
            child: Icon(
              marker,
              size: 50,
              color: AppColors.red,
            ),
          );
        } else {
          return SizedBox.fromSize(
            size: const Size(50, 50),
          );
        }
      },
    );
  }
}
