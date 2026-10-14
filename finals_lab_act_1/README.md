# Campus Explorer (ITP107 Finals Laboratory Activity 1)

Run:
    flutter create .        # generates android/ios/etc. folders (keeps lib/ and pubspec.yaml)
    flutter pub get
    flutter run

Structure:
    lib/main.dart                 App entry, theme + route registration
    lib/routes/app_routes.dart    All named routes (onGenerateRoute + fallback)
    lib/theme/app_theme.dart      Shared ThemeData
    lib/models/                   Facility, FacilityArguments, StudentService
    lib/data/campus_data.dart     Sample data (edit to match your school)
    lib/screens/                  Home, About, Facilities, Facility Details, Services, Contact, Unknown
    lib/widgets/                  AppDrawer, FacilityCard, ServiceCard (reusable)
    assets/images/                Placeholder images (replace with real photos, same filenames)
