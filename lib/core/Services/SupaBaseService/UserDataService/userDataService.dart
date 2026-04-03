import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/core/Constants/AppString.dart';

class UserDataService {
  final SupabaseClient client;
  UserDataService(this.client);

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  Future<void> updateWishlist(String userId, List<String> wishlist) async {
    try {
      await client
          .from(_capitalize(AppString.user))
          .update({'wish_list': wishlist})
          .eq('userId', userId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateCartList(String userId, List<String> cartList) async {
    try {
      await client
          .from(_capitalize(AppString.user))
          .update({'cart': cartList})
          .eq('userId', userId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateEnrollList(String userId, List<String> enrollList) async {
    try {
      await client
          .from(_capitalize(AppString.user))
          .update({'cart': enrollList})
          .eq('userId', userId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No image selected.')));
        }
        return;
      }

      final Uint8List imageData = await pickedFile.readAsBytes();
      const String folder = 'profile_pic';
      final String filename = pickedFile.name;
      final String path = '$folder/$filename';
      await client.storage.from('courses').uploadBinary(path, imageData);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
