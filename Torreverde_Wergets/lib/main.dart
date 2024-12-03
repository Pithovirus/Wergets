import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Music Player',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  MusicPlayerScreenState createState() => MusicPlayerScreenState();
}

class MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  String? localFilePath; // Local file path for audio
  String albumCoverPath =
      'assets/album_cover.png'; // Album cover image path

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initialize the audio player
    _loadLocalFile();
  }

  // Load a local file
  Future<void> _loadLocalFile() async {
    try {
      // Reference the local file directly from the assets folder
      localFilePath = 'lib/assets/music.mp3'; // Local music path
    } catch (e) {
      debugPrint("Error loading local file: $e");
    }
  }

  Future<void> _playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      try {
        if (localFilePath != null) {
          await _audioPlayer.setFilePath(localFilePath!); // Use local file
          await _audioPlayer.play();
        } else {
          debugPrint("Error: Local file not found");
        }
      } catch (e) {
        debugPrint("Error: $e");
      }
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the audio player when the app closes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Music Player"),
        backgroundColor: Colors.green, //
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Now Playing",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              albumCoverPath, // Local album cover image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Icon(
              isPlaying ? Icons.music_note : Icons.music_off,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(isPlaying ? "Pause" : "Play"),
              onPressed: _playPause,
            ),
          ],
        ),
      ),
    );
  }
}
