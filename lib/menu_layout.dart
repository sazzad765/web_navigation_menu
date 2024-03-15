import 'package:expandable_menu/custom_card.dart';
import 'package:expandable_menu/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuLayout extends StatefulWidget {
  const MenuLayout({super.key});

  @override
  State<MenuLayout> createState() => _MenuLayoutState();
}

class _MenuLayoutState extends State<MenuLayout> {
  bool isExpand = true;
  String? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      width: isExpand ? 250 : 90,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 500,
            ),
            width: isExpand ? 240 : 80,
            alignment: Alignment.topCenter,
            child: CustomCard(
              backgroundColor: CustomColors.menuBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                        padding: const EdgeInsets.all(10),
                        onTap: () {},
                        backgroundColor: CustomColors.menuSelected,
                        child: const Icon(
                          Icons.spa_outlined,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      if (isExpand)
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Hello',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  menuItem(
                    isExpand: isExpand,
                    isSelected: selectedMenu == 'File',
                    icon: Icons.file_present,
                    label: 'File',
                    onTap: (l) {
                      setState(() {
                        selectedMenu = l;
                      });
                    },
                  ),
                  menuItem(
                    isExpand: isExpand,
                    isSelected: selectedMenu == 'Product',
                    icon: Icons.production_quantity_limits,
                    label: 'Product',
                    onTap: (l) {
                      setState(() {
                        selectedMenu = l;
                      });
                    },
                  ),
                  menuItem(
                    isExpand: isExpand,
                    isSelected: selectedMenu == 'Profile',
                    icon: Icons.person,
                    label: 'Profile',
                    onTap: (l) {
                      setState(() {
                        selectedMenu = l;
                      });
                    },
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomCard(
                        borderRadius: 24,
                        padding: const EdgeInsets.all(8),
                        backgroundColor: CustomColors.menuSelected,
                        child: Icon(
                          Icons.person,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      if(isExpand)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mr. John',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'john@gmail.com',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 0,
            child: CustomCard(
              onTap: () => setState(() {
                isExpand = !isExpand;
              }),
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Icon(
                isExpand ? Icons.arrow_back_ios_new : Icons.arrow_forward_ios,
                size: 16,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuItem({
    required bool isExpand,
    required bool isSelected,
    required IconData icon,
    required String label,
    void Function(String l)? onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap?.call(label),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isExpand ? 8 : 4),
        child: isExpand
            ? Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color:
                        isSelected ? CustomColors.menuSelected : Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      label,
                      maxLines: 1,
                      style: TextStyle(
                        color: isSelected
                            ? CustomColors.menuSelected
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : CustomCard(
                padding: const EdgeInsets.all(8),
                backgroundColor: isSelected
                    ? CustomColors.menuSelected.withOpacity(.2)
                    : Colors.transparent,
                child: Icon(
                  icon,
                  size: 24,
                  color: isSelected ? CustomColors.menuSelected : Colors.white,
                ),
              ),
      ),
    );
  }
}
