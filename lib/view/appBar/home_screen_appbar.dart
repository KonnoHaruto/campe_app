import 'package:campe_app/controller/auth_controller/auth_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar homeScreenAppBar(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider.notifier);
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      title: const Text(
        'カンペ 一覧',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leadingWidth: 90,
      leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.signInAlt),
          onPressed: () {
            auth.signOut();
            Navigator.pop(context);
          }),
    );
  }
