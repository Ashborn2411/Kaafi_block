import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:equatable/equatable.dart';

// --- Video State ---
abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object?> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final double aspectRatio;
  final bool isPlaying;
  final bool isMuted;
  final Duration currentPosition;
  final Duration totalDuration;
  final double playbackSpeed;

  const VideoLoaded({
    required this.aspectRatio,
    required this.isPlaying,
    required this.isMuted,
    required this.currentPosition,
    required this.totalDuration,
    required this.playbackSpeed,
  });

  @override
  List<Object?> get props => [
        aspectRatio,
        isPlaying,
        isMuted,
        currentPosition,
        totalDuration,
        playbackSpeed,
      ];

  VideoLoaded copyWith({
    double? aspectRatio,
    bool? isPlaying,
    bool? isMuted,
    Duration? currentPosition,
    Duration? totalDuration,
    double? playbackSpeed,
  }) {
    return VideoLoaded(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      isPlaying: isPlaying ?? this.isPlaying,
      isMuted: isMuted ?? this.isMuted,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
    );
  }
}

class VideoError extends VideoState {
  final String message;
  const VideoError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Video Cubit ---
class VideoCubit extends Cubit<VideoState> {
  late VideoPlayerController videoPlayerController;
  final String url;

  VideoCubit({required this.url}) : super(VideoInitial()) {
    _initialize();
  }

  Future<void> _initialize() async {
    emit(VideoLoading());
    try {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
      await videoPlayerController.initialize();
      
      videoPlayerController.addListener(_onVideoUpdate);
      
      emit(VideoLoaded(
        aspectRatio: videoPlayerController.value.aspectRatio,
        isPlaying: videoPlayerController.value.isPlaying,
        isMuted: videoPlayerController.value.volume == 0.0,
        currentPosition: videoPlayerController.value.position,
        totalDuration: videoPlayerController.value.duration,
        playbackSpeed: videoPlayerController.value.playbackSpeed,
      ));
    } catch (e) {
      emit(VideoError(e.toString()));
    }
  }

  void _onVideoUpdate() {
    if (state is VideoLoaded) {
      final currentState = state as VideoLoaded;
      emit(currentState.copyWith(
        isPlaying: videoPlayerController.value.isPlaying,
        currentPosition: videoPlayerController.value.position,
        totalDuration: videoPlayerController.value.duration,
      ));
    }
  }

  void playPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
  }

  void seekTo(Duration position) {
    videoPlayerController.seekTo(position);
  }

  void toggleMute() {
    final isMuted = videoPlayerController.value.volume == 0.0;
    videoPlayerController.setVolume(isMuted ? 1.0 : 0.0);
    if (state is VideoLoaded) {
      emit((state as VideoLoaded).copyWith(isMuted: !isMuted));
    }
  }

  void setSpeed(double speed) {
    videoPlayerController.setPlaybackSpeed(speed);
    if (state is VideoLoaded) {
      emit((state as VideoLoaded).copyWith(playbackSpeed: speed));
    }
  }

  @override
  Future<void> close() {
    videoPlayerController.removeListener(_onVideoUpdate);
    videoPlayerController.dispose();
    return super.close();
  }
}