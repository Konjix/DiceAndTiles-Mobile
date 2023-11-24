import 'package:dice_and_tiles/dependecies.dart';

Widget listPage() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        //dividerMedium('1 z 20'),
        dividerMediumWithIcons('1 z 20'),
        Expanded(
          child: ListView(
            children: <Widget>[
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 1',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 2',
                  icon: iconFaceSad),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 3',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 4',
                  icon: iconFaceNeutral),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 5',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 6',
                  icon: iconFaceHappy),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 7',
                  icon: iconFaceSad),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 8',
                  icon: iconFaceSad),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 9',
                  icon: iconFaceNeutral),
              cardOpinion(
                  photo: photoFlutter,
                  title: 'Gra planszowa 10',
                  icon: iconFaceHappy),
            ],
          ),
        ),
      ],
    ),
  );
}
