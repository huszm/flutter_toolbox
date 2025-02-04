import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:flutter_toolbox/generated/l10n.dart' as toolbox;
import 'package:flutter_toolbox_example/auth_navigation.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';
import 'paginated_list_view_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return ToolboxApp(
            toolboxConfig: ToolboxConfig(
              useWeservResizer: true,
              noItemsFoundWidget: Icon(Icons.subject),
              unAuthenticatedPages: const [
                LoginPage,
                AuthNavHomePage,
                NoAuthPage,
                PaginatedListViewPage,
                PaginatedListViewExample,
                PaginatedListViewEmptyExample,
                PagewiseSliverListExample,
              ],
              isAuthenticated: () {
                final isLoggedIn = value.getUserCashed() != null;
                d("isLoggedIn = $isLoggedIn");

                return isLoggedIn;
              },
              onAuthorizedNavigation: (BuildContext context, Type pageType) {
                d("onAuthorizedNavigation#pageType = $pageType");
                return push(context, LoginPage());
              },
            ),
            child: MaterialApp(
              localizationsDelegates: const [
                toolbox.S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const <Locale>[
                Locale("en", ""),
                Locale("ar", ""),
              ],
              theme: ThemeData(
                tabBarTheme: TabBarTheme(
                  indicator: TabRoundedLineIndicator(
                    context,
                    indicatorSize: TabRoundedLineIndicatorSize.normal,
                    indicatorHeight: 3,
                  ),
                ),
              ),
              home: HomePage(),
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    ConnectionStatusBar.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Plugin example app',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.w700),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: themeData.primaryColor,
            unselectedLabelColor: Color(0xff5f6368),
            isScrollable: true,
            indicator: TabRoundedLineIndicator(
              context,
              indicatorSize: TabRoundedLineIndicatorSize.normal,
              indicatorHeight: 3,
              indicatorColor: Theme.of(context).primaryColor,
            ),
            tabs: <Widget>[
              Tab(text: "Home"),
              Tab(text: "Personal info"),
              Tab(text: "Data & personalization"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => push(context, PaginatedListViewPage()),
              child: Text('PaginatedList page'),
            )
          ],
        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Text(toolbox.S.of(context)?.please_check_your_connection ??
                  'Please check your connection'),
              NetImage(
                'https://via.placeholder.com/300',
                width: 300,
                fullScreen: true,
              ),
              NetImage(
                'https://via.placeholder.com/50',
                fullScreen: true,
                width: 50,
              ),
              NetImage(
                'https://via.placeholder.com/50',
                width: 50,
                borderRadius: BorderRadius.circular(8),
              ),
              NetImage(
                "",
                width: 50,
                borderRadius: BorderRadius.circular(8),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text('Error toast'),
                    onPressed: () => errorToast('Error'),
                  ),
                  MaterialButton(
                    child: Text('Success toast'),
                    onPressed: () => successToast('Success'),
                  ),
                  MaterialButton(
                    child: Text('toast'),
                    onPressed: () => toast('أهلا بكم'),
                  ),
                ],
              ),
              MaterialButton(
                child: Text('Auth navigation'),
                onPressed: () => push(context, AuthNavHomePage()),
              ),
            ],
          );
        }),
      ),
    );
  }
}
