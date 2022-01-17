import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomTab = 0;

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBonnetLock = true;
  bool isTrunkLock = true;

  bool isCoolSelected = true;
  int tempCool = 23;
  int tempHeat = 26;

  bool isShowTyre = false;
  bool isShowTyreStatus = false;

  void onBottomNavigationTabChange(int index) {
    selectedBottomTab = index;
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateBonnetLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updateTrunkLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  void updateCoolSelectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  void incrementTemp() {
    isCoolSelected ? tempCool = tempCool + 1 : tempHeat = tempHeat + 1;
    notifyListeners();
  }

  void decrementTemp() {
    isCoolSelected ? tempCool = tempCool - 1 : tempHeat = tempHeat - 1;
    notifyListeners();
  }

  void showTyre(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      Future.delayed(const Duration(milliseconds: 400), () {
        isShowTyre = true;
        notifyListeners();
      });
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  void tyreStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 400), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
}
