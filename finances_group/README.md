# finances_group

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

ThemeData(
        textTheme: TextTheme(
          headline4: CustomAppTextTheme.caption,
          headline3: CustomAppTextTheme.headline3,
          headline6: CustomAppTextTheme.headline6,
          button: CustomAppTextTheme.label,
        ),
        //primarySwatch: Colors.lightGreen,
        //primaryColor: AppCustomColors.primary,
        useMaterial3: true,
        colorSchemeSeed: AppCustomColors.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
