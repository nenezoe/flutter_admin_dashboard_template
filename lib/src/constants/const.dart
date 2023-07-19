import 'package:flutter/material.dart';

int routesLength = 0;
bool islg(context) =>
    MediaQuery.of(context).size.width >= 992 &&
    MediaQuery.of(context).size.width < 1300;

bool isxl(context) => MediaQuery.of(context).size.width >= 1300;
