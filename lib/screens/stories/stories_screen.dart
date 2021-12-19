import 'package:flutter/material.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/screens/stories/story_view.dart';
import 'package:kids_education/widgets/top_section_card.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopSectionCard(),
          Expanded(
              child: ListView(
            padding: Constants.defaultPadding,
            children: Constants.stories.map((e) {
              String? url = Constants.getYoutubeThumbnail(e.url);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StoryView(
                        story: e,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(e.title),
                      leading:
                          url == null ? const SizedBox() : Image.network(url),
                    ),
                  ),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}
