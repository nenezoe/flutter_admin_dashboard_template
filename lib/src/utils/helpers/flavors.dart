import '../../models/superbase_setup_model.dart';

enum Flavors {
  development,

  staging,

  production,
}

class F {
  static Flavors? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavors.development:
        return 'Lekota Client - Dev';

      case Flavors.staging:
        return 'Lekota Client - Staging';

      case Flavors.production:
        return 'Lekota Client';

      default:
        return 'title';
    }
  }

  static SupabaseSetUpModel? get getSupabaseSetUpKeys {
    switch (appFlavor) {
      case Flavors.development:
        return SupabaseSetUpModel(
          supabaseAnonKey:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhhem9ocWpsZnlmdGF4bXJ1dnNhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI5NDEyMDksImV4cCI6MTk5ODUxNzIwOX0.AFyf1CwHOPNgiSxG58phsU3369msCSPgyGs0R-zscQo",
          supabaseUrl: "https://hazohqjlfyftaxmruvsa.supabase.co",
        );

      case Flavors.staging:
        return SupabaseSetUpModel(supabaseAnonKey: "", supabaseUrl: "");

      case Flavors.production:
        return SupabaseSetUpModel(supabaseAnonKey: "", supabaseUrl: "");

      default:
        return null;
    }
  }
}
