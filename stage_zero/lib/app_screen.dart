import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'HNG Stage Zero',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _LinkButton(
                icon: Icons.code,
                label: 'Github Respository',
                onPressed: () => _launchURL(
                    Uri.parse('https://github.com/dotunv/hng12-projects')),
              ),
              _LinkButton(
                icon: Icons.work,
                label: 'HNG Flutter Developers',
                onPressed: () => _launchURL(
                    Uri.parse('https://hng.tech/hire/flutter-developers')),
              ),
              _LinkButton(
                icon: Icons.link,
                label: 'Telex',
                onPressed: () => _launchURL(Uri.parse('https://telex.im')),
              ),
              _LinkButton(
                icon: Icons.link,
                label: 'Delve',
                onPressed: () => _launchURL(Uri.parse('https://delve.fun')),
              ),
            ]
                .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8), child: e))
                .toList(),
          ),
        ));
  }
}

class _LinkButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _LinkButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          minimumSize: const Size(double.infinity, 0)),
    );
  }
}
