import 'package:fijob/commons/constants/asset/image_resource.dart';
import 'package:fijob/domain/enities/getting_started_entity.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class GettingStartedConstants {
  const GettingStartedConstants._();

  static List<GettingStartedEntity> get db => [
        const GettingStartedEntity(
            asset: ImageResource.imgGettingStarted1,
            title: ['The best app for', 'Find Your Dream Job'],
            content:
                'Are you looking for an exciting job opportunity to advance your career? Welcome to the top job search app, the bridge between talented candidates and reputable businesses!'),
             const GettingStartedEntity(
            asset: ImageResource.imgGettingStarted2,
            title: ['Better future is', 'starting from you'],
            content:
                'Do you want to explore the best job opportunities, personalized based on your skills and career goals? Experience our job search app.'),
        const GettingStartedEntity(
            asset: ImageResource.imgGettingStarted3,
            title: ['Application surely viewed by', 'each company'],
            content:
                "Whether you're unemployed, contemplating a job change, or aiming for career advancement, our job search app will help you achieve those goals efficiently."),

  ];

  static List<String> assets = [ImageResource.imgGettingStarted1, ImageResource.imgGettingStarted2, ImageResource.imgGettingStarted3];
  static const String btnNext = 'Next';
  static const String btnEnd = 'Get Started';
}
