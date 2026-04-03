import 'package:flutter_bloc/flutter_bloc.dart';
import 'video_module.dart';
import 'package:flutter/material.dart';

class VideoControls extends StatelessWidget {
  const VideoControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          final cubit = context.read<VideoCubit>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(state.isMuted ? Icons.volume_off : Icons.volume_up),
                onPressed: () => cubit.toggleMute(),
              ),
              IconButton(
                icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () => cubit.playPause(),
              ),
              Expanded(
                child: Slider(
                  value: state.currentPosition.inMilliseconds.toDouble(),
                  min: 0,
                  max: state.totalDuration.inMilliseconds.toDouble(),
                  onChanged: (value) {
                    cubit.seekTo(Duration(milliseconds: value.toInt()));
                  },
                ),
              ),
              Text(
                '${_formatDuration(state.currentPosition)} / '
                '${_formatDuration(state.totalDuration)}',
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }
}