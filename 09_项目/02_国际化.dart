国际化
dependencies:
  flutter_localizations:
    sdk: flutter

// 国际化
MaterialApp
  supportedLocales: [Locale('zh'),Local('en')]  

localizationsDelegates: [
  GlobalMateria zations.delegate,
  globalCuperzations.delegate,
  GlobalWidgetsLocalizations.delegate,
]

ios 端修改  info.plist  右键新增 row Localizations item 0 Chinese