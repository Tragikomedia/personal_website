import 'package:web_test/models/pageModel.dart';
import 'package:web_test/pages/landing_page/d_landing_page.dart';
import 'package:web_test/pages/landing_page/m_landing_page.dart';
import 'package:web_test/pages/landing_page/t_landing_page.dart';
import 'package:web_test/utilities/enums.dart';

Map<CurrentPage, PageModel> pages = {CurrentPage.landing : PageModel(pageId: CurrentPage.landing, desktopVersion: DesktopLandingPage(), tabletVersion: TabletLandingPage(), mobileVersion: MobileLandingPage())};
