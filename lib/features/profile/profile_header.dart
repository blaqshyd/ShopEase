// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:river_state/common/common.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizing.h24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '30\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const TextSpan(text: 'Posts')
                      ])),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '30\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const TextSpan(text: 'Following')
                      ])),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '30\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const TextSpan(text: 'Followers')
                      ])),
            ],
          ),
          AppSizing.h32,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: RichText(
                // textAlign: TextAlign.center,
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                  TextSpan(
                    text: 'Daniel A',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: ' @blaqshyd\n'),
                  const TextSpan(text: 'Dart makes my heart Flutter')
                ])),
          ),
          AppSizing.h32,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Text('Following'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Text('Message'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Text('Call'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: AppSizing.borderRadius * .6,
                  color: AppColor.black5,
                ),
                child: const Icon(
                  Icons.person_add_alt,
                  size: 22,
                ),
              ),
            ],
          ),
          AppSizing.h32,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                5,
                (index) => const CircleAvatar(radius: 32),
              )
            ],
          )
        ],
      ),
    );
  }
}
