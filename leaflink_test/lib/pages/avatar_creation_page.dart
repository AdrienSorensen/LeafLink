import 'package:flutter/material.dart';

class AvatarCreationPage extends StatefulWidget {
  @override
  _AvatarCreationPageState createState() => _AvatarCreationPageState();
}

class _AvatarCreationPageState extends State<AvatarCreationPage> {
  // Selected options
  String selectedHair = 'short';
  String selectedOutfit = 'green_shirt';
  String selectedAccessory = 'none';

  // Image paths
  final String baseAvatar = 'assets/avatars/base.png';

  final Map<String, String> hairOptions = {
    'short': 'assets/avatars/hair/short.png',
    'long': 'assets/avatars/hair/long.png',
  };

  final Map<String, String> outfitOptions = {
    'green_shirt': 'assets/avatars/outfits/green_shirt.png',
    'eco_suit': 'assets/avatars/outfits/eco_suit.png',
  };

  final Map<String, String> accessoryOptions = {
    'none': '',
    'glasses': 'assets/avatars/accessories/glasses.png',
    'hat': 'assets/avatars/accessories/hat.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Your Avatar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar Preview
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(baseAvatar, width: 200),
                    if (hairOptions[selectedHair]!.isNotEmpty)
                      Image.asset(hairOptions[selectedHair]!, width: 200),
                    if (outfitOptions[selectedOutfit]!.isNotEmpty)
                      Image.asset(outfitOptions[selectedOutfit]!, width: 200),
                    if (accessoryOptions[selectedAccessory]!.isNotEmpty)
                      Image.asset(accessoryOptions[selectedAccessory]!, width: 200),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Customization Controls
            _buildDropdown('Hair Style', selectedHair, hairOptions.keys.toList(),
                (value) => setState(() => selectedHair = value)),
            _buildDropdown('Outfit', selectedOutfit, outfitOptions.keys.toList(),
                (value) => setState(() => selectedOutfit = value)),
            _buildDropdown('Accessory', selectedAccessory, accessoryOptions.keys.toList(),
                (value) => setState(() => selectedAccessory = value)),

            SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // TODO: Save preferences to state/database
                Navigator.pop(context);
              },
              child: Text('Save Avatar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String selected, List<String> options, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: selected,
            isExpanded: true,
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option.replaceAll('_', ' ').toUpperCase()),
              );
            }).toList(),
            onChanged: (value) => onChanged(value!),
          ),
        ],
      ),
    );
  }
}
