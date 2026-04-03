import 'package:flutter_bloc/flutter_bloc.dart';
import 'video_module.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoModule extends StatelessWidget {
  const VideoModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoLoading) {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is VideoLoaded) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: state.aspectRatio,
                child: VideoPlayer(context.read<VideoCubit>().videoPlayerController),
              ),
              Center(
                child: IconButton(
                  onPressed: () => context.read<VideoCubit>().playPause(),
                  icon: Icon(
                    state.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
