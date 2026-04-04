import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Notice {
  final String title;
  final String description;

  Notice({required this.title, required this.description});
}

class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key, required this.notice});

  final Notice? notice;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            if (notice != null) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => NoticeView(notice: notice!)),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildTitle(), _buildDescription(context)],
          ).box.width(240).rounded.make().p(4),
        );
      },
    );
  }

  Widget _buildTitle() {
    return (notice?.title ?? "No notice").text.black.capitalize
        .size(20)
        .bold
        .make()
        .box
        .topRounded(value: 16)
        .width(double.infinity)
        .padding(const EdgeInsets.symmetric(horizontal: 10, vertical: 10))
        .gray300
        .make();
  }

  Widget _buildDescription(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notice != null) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => NoticeView(notice: notice!)),
          );
        }
      },
      child: (notice?.description ?? "").text.ellipsis.medium
          .maxLines(3)
          .make()
          .box
          .padding(const EdgeInsets.only(bottom: 10, left: 10, right: 10))
          .gray300
          .bottomRounded(value: 16)
          .height(60)
          .width(double.infinity)
          .make(),
    );
  }
}

class NoticeView extends StatelessWidget {
  final Notice notice;

  const NoticeView({super.key, required this.notice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notice Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notice.title.text.xl2.bold.make(),
            const SizedBox(height: 12),
            notice.description.text.make(),
          ],
        ),
      ),
    );
  }
}
