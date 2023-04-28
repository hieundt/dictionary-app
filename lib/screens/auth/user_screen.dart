import 'package:dictionary/screens/widgets/app_buttons.dart';
import 'package:dictionary/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  final Icon? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;

  const InformationWidget({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: leading,
      title: Text(
        title ?? '',
        style: AppTextStyle.regular15.copyWith(
          color: AppColors.darkGray,
        ),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: AppTextStyle.medium15,
      ),
      trailing: trailing,
      minLeadingWidth: 0,
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  final Icon? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  const FavoriteWidget({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.lightRed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        splashColor: AppColors.gray,
        child: ListTile(
          dense: true,
          leading: leading,
          title: Text(
            title ?? '',
            style: AppTextStyle.medium15,
          ),
          subtitle: Text(
            subtitle ?? '',
            style: AppTextStyle.regular15,
          ),
          trailing: trailing,
          minLeadingWidth: 0,
        ),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/12/56/00/1256000a71e6e0fbcd09c8505529889f.jpg'),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 10),
            Text(
              '@hippo',
              style: AppTextStyle.regular15.copyWith(
                color: AppColors.darkGray,
              ),
            ),
            Text(
              'Fred Phoenix',
              style: AppTextStyle.medium25,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: AppColors.black,
              thickness: 3,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Information',
                style: AppTextStyle.medium20,
              ),
              const InformationWidget(
                leading: Icon(CupertinoIcons.envelope_open),
                title: 'Email',
                subtitle: 'mocking@email.com',
              ),
              const InformationWidget(
                leading: Icon(CupertinoIcons.gift),
                title: 'Birthday',
                subtitle: '03/08/2001',
              ),
              const Divider(
                color: AppColors.gray,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              FavoriteWidget(
                leading: const Icon(
                  CupertinoIcons.bookmark,
                  color: AppColors.darkBrown,
                ),
                title: 'Favorite vocabularies',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              FavoriteWidget(
                leading: const Icon(
                  CupertinoIcons.square_favorites_alt,
                  color: AppColors.darkBrown,
                ),
                title: 'Favorite units',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              FavoriteWidget(
                leading: const Icon(
                  CupertinoIcons.hourglass,
                  color: AppColors.darkBrown,
                ),
                title: 'Test history',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              const Divider(
                color: AppColors.gray,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              AppButton(
                icon: const Icon(
                  CupertinoIcons.square_arrow_right,
                  color: AppColors.black,
                ),
                label: Text(
                  'Log out',
                  style: AppTextStyle.bold15,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}