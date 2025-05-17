// ignore_for_file: non_constant_identifier_names

enum Environment { local, localIP, development, production, lounging }

class Endpoints {
  static Environment currentEnvironment = Environment.local;

  static String get baseUrl {
    switch (currentEnvironment) {
      case Environment.local:
        return 'http://localhost:3000';
      case Environment.localIP:
        return "http://192.168.100.114:3000";
      case Environment.development:
        return 'https://qroundtable.theqlu.com';
      case Environment.production:
        return 'https://q-roundtable-server-production-7wzmpo3asa-uc.a.run.app';
      case Environment.lounging:
        return 'https://q-roundtable-server-development-620091903831.us-central1.run.app';
    }
  }

  static String get socketUrl {
    switch (currentEnvironment) {
      case Environment.local:
        return 'http://localhost:3000';
      case Environment.localIP:
        return 'ws://192.168.100.114:3000';
      case Environment.development:
        return 'wss://qroundtable.theqlu.com';
      case Environment.production:
        return 'wss://q-roundtable-server-production-7wzmpo3asa-uc.a.run.app';
      case Environment.lounging:
        return 'wss://q-roundtable-server-development-620091903831.us-central1.run.app';
    }
  }

  static String BASE_URL = baseUrl;
  static String BASE_SOCKET_URL = socketUrl;
  static String QLU_SOCIAL = 'https://qlu.social/link/demo';
  static String YORI_BACKEND_API_KEY = '9aed3916-af53-40a2-9532-73d69f49153a';
  static String YORI_BACKEND = 'https://yori.theqlu.com';
  static String INTRO_VERIFICATION_SERVICE_URL =
      'https://ai-qapp-620091903831.us-central1.run.app';
  static String Q_APP_SHARE = 'https://qlu-roundtable.app.link';
  static String Q_APP_SHARE_RT = 'https://invite.qlu.ai';

  static const liveKitSfuUrl = 'http://34.131.231.97:7880';
  static String Q_APP_PRIVACY_POLICY = "https://roundtable.qlu.ai/?index=0";
  static String Q_APP_COMMUNITY_GUIDELINE =
      "https://roundtable.qlu.ai/?index=1";
}
