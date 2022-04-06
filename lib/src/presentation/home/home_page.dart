import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:scale_flutter/src/presentation/vehicle/vehicle_page.dart';
import 'package:scale_flutter/src/presentation/whouse/whouse_page.dart';

import 'package:window_manager/window_manager.dart';

import '../common/widgets/window_buttons.dart';
import '../document/document_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  bool value = false;

  int index = 0;

  final viewKey = GlobalKey();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        title: const DragToMoveArea(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
          ),
        ),
        actions: DragToMoveArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Spacer(),
              WindowButtons(),
            ],
          ),
        ),
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        size: const NavigationPaneSize(
          openMinWidth: 250,
          openMaxWidth: 320,
        ),
        header: Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'ZENITH',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        displayMode: PaneDisplayMode.auto,
        indicator: const StickyNavigationIndicator(),
        items: [
          PaneItem(
            icon: Icon(
              Icons.receipt,
              color: Colors.blue,
            ),
            title: const Text(
              'Νέο παραστατικό',
            ),
          ),
          PaneItem(
            icon: Icon(
              Icons.scale,
              color: Colors.blue,
            ),
            title: const Text(
              'Ιστορικό Ζυγίσεων',
            ),
          ),
          PaneItem(
            icon: Icon(
              Icons.drive_eta_rounded,
              color: Colors.blue,
            ),
            title: const Text(
              'Οχήματα',
            ),
          ),
          PaneItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: const Text(
              'Οδηγοί',
            ),
          ),
          PaneItem(
            icon: Icon(
              Icons.hardware,
              color: Colors.blue,
            ),
            title: const Text(
              'Υλικά',
            ),
          ),
          PaneItem(
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.blue,
            ),
            title: const Text(
              'Οργανισμοί',
            ),
          ),
          PaneItemSeparator(),
        ],
        autoSuggestBox: AutoSuggestBox(
          controller: TextEditingController(),
          items: const [
            'Item 1',
            'Item 2',
            'Item 3',
            'Item 4',
          ],
        ),
        autoSuggestBoxReplacement: const Icon(FluentIcons.search),
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
      content: NavigationBody(
        index: index,
        children: const [
          DocumentPage(),
          WhousePage(),
          VehiclePage(),
        ],
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirm close'),
            content: const Text('Are you sure you want to close this window?'),
            actions: [
              FilledButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
