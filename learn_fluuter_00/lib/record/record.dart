import 'package:flutter/material.dart';
import 'package:flutter_plugin_record/index.dart';
import 'package:flutter_sound/flutter_sound.dart';

final _exampleAudioFilePathMP3 = 'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
typedef Fn = void Function();

class RecordTest extends StatefulWidget {
  const RecordTest({Key? key}) : super(key: key);

  @override
  State<RecordTest> createState() => _RecordTestState();
}

class _RecordTestState extends State<RecordTest> {
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;

  @override
  void initState() {
    super.initState();

    _mPlayer!.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    // Be careful : you must `close` the audio session when you have finished with it.
    _mPlayer!.closeAudioSession();
    _mPlayer = null;
    super.dispose();
  }

  void play() async {
    await _mPlayer!.startPlayer(
        fromURI: _exampleAudioFilePathMP3,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {});
        });
    setState(() {});
  }

  Future<void> stopPlayer() async {
    if (_mPlayer != null) {
      await _mPlayer!.stopPlayer();
    }
  }

  Fn? getPlaybackFn() {
    if (!_mPlayerIsInited) {
      return null;
    }
    return _mPlayer!.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getPlaybackFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(_mPlayer!.isPlaying ? 'Playback in progress' : 'Player is stopped'),
            ]),
          ),
        ],
      ),
    );

    // Scaffold(
    //   body: Container(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           ElevatedButton(child: Text('初始化'), onPressed: () => recordPlugin.initRecordMp3()),
    //           ElevatedButton(child: Text('开始说话'), onPressed: () => recordPlugin.start()),
    //           ElevatedButton(child: Text('停止说话'), onPressed: () => recordPlugin.stop()),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
