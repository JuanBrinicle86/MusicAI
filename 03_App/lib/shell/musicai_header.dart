import 'package:flutter/material.dart';

class MusicAiHeader extends StatelessWidget implements PreferredSizeWidget {
  const MusicAiHeader({super.key, this.onProfile, this.onNotifications});

  final VoidCallback? onProfile;
  final VoidCallback? onNotifications;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.music_note,
              size: 18,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 8),
          const Text('MusicAI'),
        ],
      ),
      leadingWidth: 116,
      leading: TextButton.icon(
        onPressed: onProfile,
        icon: const Icon(Icons.person_outline, size: 18),
        label: const Text('Perfil'),
        style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: onNotifications,
          icon: const Icon(Icons.notifications_none),
          label: const Text('Notificaciones'),
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.onSurface,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ],
    );
  }
}
