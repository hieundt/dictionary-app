import 'package:flutter/cupertino.dart';
import '../../../data/services/user_service.dart';
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
  late IconData marker;

  @override
  void initState() {
    super.initState();
    marker = CupertinoIcons.bookmark;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserFavoriteCollectionService().isFavoriteVocabulary(
        userId: UserService.currentUserId!,
        vocabularyId: widget.vocabularyId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var checker = snapshot.data!;
          return GestureDetector(
            onTap: () async {
              print('tapped');
              print(checker);
              if (checker == false) {
                setState(() {
                  marker = CupertinoIcons.bookmark_fill;
                });
                await UserFavoriteCollectionService().markFavoriteVocabulary(
                  userId: UserService.currentUserId!,
                  vocabularyId: widget.vocabularyId,
                );
              } else {
                setState(() {
                  marker = CupertinoIcons.bookmark;
                });
                await UserFavoriteCollectionService().removeFavoriteVocabulary(
                  userId: UserService.currentUserId!,
                  vocabularyId: widget.vocabularyId,
                );
              }
              print(checker);
            },
            child: Icon(
              marker,
              size: 50,
              color: AppColors.darkBrown,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
