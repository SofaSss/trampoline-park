part of 'client_home_part.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoPath,
    this.isVerticalVideo = false,
  });
  final String videoPath;
  final bool isVerticalVideo;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  VideoPlayerController? _videoController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _initVideo(widget.videoPath);
  }

  Future<void> _initVideo(String path) async {
    _videoController?.dispose();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(path));
    _initializeVideoPlayerFuture = _videoController!.initialize().then((_) {
      setState(() {});
    });
    _videoController!.setLooping(true);
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoPath != oldWidget.videoPath) {
      _initVideo(widget.videoPath);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            _videoController != null &&
            _videoController!.value.isInitialized) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: VideoPlayer(_videoController!),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _videoController!.value.isPlaying
                            ? _videoController!.pause()
                            : _videoController!.play();
                      });
                    },
                    child:
                        _videoController!.value.isPlaying
                            ? null
                            : Container(
                              decoration: const BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: BaseAnimatedBuilder(
                height:
                    widget.isVerticalVideo
                        ? AppConstants.verticalVideoHeight
                        : AppConstants.videoHeight,
                width:
                    widget.isVerticalVideo
                        ? AppConstants.verticalVideoWidth
                        : AppConstants.videoWidth,
              ),
            ),
          );
        }
      },
    );
  }
}
