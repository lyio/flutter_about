/*
 * Copyright (C) 2019, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Flow;

import 'markdown.dart';
import 'scaffold_builder.dart';

/// A [ListTile] that displays the provided markdown template in a new page.
class MarkdownPageListTile extends StatelessWidget {
  /// Creates a list tile for showing a markdown page.
  ///
  /// The title and filename of the markdown template are required.
  const MarkdownPageListTile({
    Key key,
    this.icon,
    @required this.title,
    this.scaffoldBuilder,
    this.applicationName,
    this.applicationIcon,
    this.useMustache,
    @required this.filename,
    this.mustacheValues,
    this.tapHandler,
  })  : assert(title != null),
        super(key: key);

  /// The icon to show for this drawer item.
  ///
  /// By default no icon is shown.
  ///
  /// This is not necessarily the same as the image shown in the dialog box
  /// itself; which is controlled by the [applicationIcon] property.
  final Widget icon;

  /// The label to show on this drawer item.
  ///
  /// Defaults to a text widget that says "About Foo" where "Foo" is the
  /// application name specified by [applicationName].
  final Widget title;

  /// The builder for the Scaffold around the content.
  ///
  /// Defaults to [defaultScaffoldBuilder] if not set.
  final ScaffoldBuilder scaffoldBuilder;

  /// The name of the application.
  ///
  /// This string is used in the default label for this drawer item (see
  /// [title]) and as the caption of the [AboutContent] that is shown.
  ///
  /// Defaults to the value of [Title.title], if a [Title] widget can be found.
  /// Otherwise, defaults to [Platform.resolvedExecutable].
  final String applicationName;

  /// The markdown asset file to load
  final String filename;

  /// Whether to replace {{ }} strings with [mustacheValues]
  final bool useMustache;

  /// Values to replace in the texts
  final Map<String, String> mustacheValues;

  /// Icon of the application
  final Widget applicationIcon;

  /// The handler that handles taps on links in the template.
  /// Defaults to [UrlMarkdownTapHandler].
  final MarkdownTapHandler tapHandler;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    return ListTile(
      leading: icon,
      title: title,
      onTap: () {
        showMarkdownPage(
          applicationIcon: applicationIcon,
          context: context,
          applicationName: applicationName,
          filename: filename,
          title: title,
          scaffoldBuilder: scaffoldBuilder,
          useMustache: useMustache,
          mustacheValues: mustacheValues,
          tapHandler: tapHandler,
        );
      },
    );
  }
}
