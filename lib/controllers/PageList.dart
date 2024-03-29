import 'package:flutter/material.dart';
import 'package:hr/models/PageData.dart';
import 'package:flutter/widgets.dart';
import 'package:hr/views/SettingsView.dart';
import 'package:hr/views/Account/SignInView.dart';
import 'package:hr/views/Account/SignUpView.dart';
import 'package:hr/views/Account/ResetPasswordPage.dart';
import 'package:hr/views/HR/HomepageView.dart';
import 'package:hr/views/HR/DepartmentView.dart';
import 'package:hr/views/HR/NewEmployeeView.dart';
import 'package:hr/views/HR/SummaryView.dart';
import 'package:hr/views/User/ClockInView.dart';
import 'package:hr/views/User/HistoryView.dart';
import 'package:hr/views/User/UserHomeView.dart';





class PageList {
  List<PageData> pageList = [];

  PageList() {
    // Account
    pageList.add(PageData("SignIn", const SignIn()));
    pageList.add(PageData("SignUp", const SignUp()));
    pageList.add(PageData("ResetPassword", const ResetPassword()));

    //User And Hr   History
    pageList.add(PageData("Settings", const Settings()));
    pageList.add(PageData("ClockIn", const ClockIn()));


    //HR 
    pageList.add(PageData("HrHome", const HrHomepage()));
    pageList.add(PageData("NewEmployeeList", const NewEmployee()));
    pageList.add(PageData("Summary", const SummaryList()));
    pageList.add(PageData("DepartmentList", const DepartmentList()));
    
    //User
    pageList.add(PageData("UserHome", const UserHomePage()));
    pageList.add(PageData("History", const History()));    
  }

  PageData? findPage(String pageName) {
    for (PageData page in pageList) {
      if (page.pageName == pageName) {
        return page;
      }
    }
    return null;
  }

  void routeTo(context, String pageName) {
    var routePage = findPage(pageName);

    if (routePage != null) {
      Navigator.of(context).push(_createRoute(routePage));
    } else {
      print("Page Not Found Error 404!");
    }
  }

  Route _createRoute(PageData routePage) {
    var pageToGo = routePage.page;

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pageToGo,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}