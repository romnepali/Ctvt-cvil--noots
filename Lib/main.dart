import 'package:flutter/material.dart';

void main() => runApp(CtvtCivilNotesApp());

class CtvtCivilNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTEVT Civil Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final semesters = [
    'First Semester',
    'Second Semester',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CTEVT Civil Notes')),
      body: ListView.builder(
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          final s = semesters[index];
          return ListTile(
            title: Text(s),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              if (s == 'First Semester') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SemesterScreen(
                      semesterTitle: s,
                      subjects: [
                        'Engineering Mathematics',
                        'Engineering Physics',
                        'Engineering Chemistry',
                        'Engineering Drawing',
                        'Computer Application',
                        'Communication English',
                      ],
                    ),
                  ),
                );
              } else {
                // Placeholder for second semester
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SemesterScreen(
                      semesterTitle: s,
                      subjects: [
                        'Subject A',
                        'Subject B',
                        'Subject C',
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class SemesterScreen extends StatelessWidget {
  final String semesterTitle;
  final List<String> subjects;

  SemesterScreen({required this.semesterTitle, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(semesterTitle)),
      body: ListView.separated(
        itemCount: subjects.length,
        separatorBuilder: (_, __) => Divider(height: 1),
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return ListTile(
            title: Text(subject),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SubjectScreen(subjectTitle: subject),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final String subjectTitle;

  SubjectScreen({required this.subjectTitle});

  final chapters = ['Chapter 1', 'Chapter 2', 'Important Questions'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subjectTitle)),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return ListTile(
            title: Text(chapter),
            leading: Icon(Icons.book),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterScreen(
                    subjectTitle: subjectTitle,
                    chapterTitle: chapter,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChapterScreen extends StatelessWidget {
  final String subjectTitle;
  final String chapterTitle;

  ChapterScreen({required this.subjectTitle, required this.chapterTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapterTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subjectTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text(
              'This is a placeholder page for $chapterTitle. Replace this with actual notes content, PDFs, or links.',
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // placeholder action: show a dialog
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Notes'),
                    content: Text('No content yet. Add notes or links here.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      )
                    ],
                  ),
                );
              },
              icon: Icon(Icons.upload_file),
              label: Text('Add / View Content'),
            )
          ],
        ),
      ),
    );
  }
}
