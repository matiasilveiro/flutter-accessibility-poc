# Accessibility PoC

Flutter PoC to showcase all accessibility options

## Getting Started

Building accessible apps should be one your main goals. App accessibility is about building products that are accessible
to everyone, no matter their abilities. Making your app accessible may also help to broaden your user base, as allowing
more people to engage with your application increases your DAU count.

![](https://assets.website-files.com/6143afec68f555387049efb3/6425dabc49f020abc816200a_62fbc4cb2c32732a027bfe04_1_tchgEbp8Wjbgr8EEtj2MzA.png)

In this sample project, you’ll learn how to add basic accessibility elements to your Flutter app, in order to:

- Help users with dyslexia.
- Consider people with color blindness.
- Enhance screen readers to assist people with visual disabilities.
- Increase readability by choosing eligible fonts, colors, and contrast.
- Inspect your app using Flutter’s integrated Semantics Debugger.
- Ensure tappable areas follow the recommended accessibility guidelines.

*Disclaimer:* Most of the text in this README is extracted
from [here](https://code.pieces.app/blog/flutter-app-accessibility).

### Built-in Flutter accessibility

Flutter has great built-in accessibility support. By making an app with Flutter, you get:

- Compatibility with large fonts.
- Response to scale factor changes.
- Support for screen readers, with some default semantics in built-in widgets.
- Great color contrast defaults: Both material and cupertino have widgets with colors that have enough contrast when
  rendered.

In addition, the Flutter Team compiled
an [accessibility release checklist](https://docs.flutter.dev/development/accessibility-and-localization/accessibility#accessibility-release-checklist)
for you to consider as you prepare your release.

However, there are always some improvements to do by code, specially with semantics. So this repo will try to fill that
gap.

### Useful links

- [Official docs](https://docs.flutter.dev/accessibility-and-localization/accessibility)
- [Official best practices article](https://medium.com/flutter-community/creating-inclusive-apps-with-flutter-best-practices-for-accessibility-c7cebe0beb4d)
- [Kodeco - Flutter Accessibility tutorial](https://www.kodeco.com/35275067-flutter-accessibility-getting-started) (recommended)
- [Increase your product quality through accessibility](https://victoriagonda.com/talks/a11y-for-product.html)
- [Flutter Accessibility tutorial article](https://medium.com/@enzoftware/flutter-accessibility-getting-started-52286746314e) (recommended)
- [Improve app accessibility in Flutter](https://code.pieces.app/blog/flutter-app-accessibility)
- [Flutter Semantics in-depth](https://www.didierboelens.com/blog/en/semantics)
- [Accessibility Best Practices in Flutter](https://blog.gskinner.com/archives/2022/09/flutter-crafting-a-great-experience-for-screen-readers.html) (recommended)
- [Trigger Semantic actions in UI widget tests](https://abhaysood.medium.com/trigger-semantic-actions-in-widget-tests-b3b0316f1d9c)
- [Yet another interesting example](https://tonyowen.medium.com/accessibility-in-flutter-592f2e760149)
- [Widget Testing Part I](https://medium.com/flutter-community/a-deep-dive-into-widget-testing-in-flutter-part-i-e1bb07c73e10)
- [Widget Testing Part II](https://medium.com/flutter-community/a-deep-dive-into-widget-testing-in-flutter-part-ii-finder-and-widgettester-f76f98b87a90)

---

## Common accessibility topics

### Text Scaling

<p align="center">
  <img src="https://assets.website-files.com/6143afec68f555387049efb3/6425db18dfbbd667d8bdfd0a_Text_Scaling.gif" height="200" alt="Text scaling">
</p>

People who have vision problems may find it difficult to read text in your app when it's the default size. Be aware of
this text scale factor to make sure that the text within your app scales properly based on accessibility settings.

The built-in `Text` widget automatically handles the changing text size calculations based on the device's text scale
factor.

Flutter has a textScaleFactor property which is multiplied by the set/default font size to calculate the text's new
font size. That property is obtained from the `MediaQuery.of(context).textScaleFactor`.

Note that if you’re using a `RichText` Flutter widget, it won't support automatic text scaling. You’ll need to
explicitly
pass the `textScaleFactor` from the `MediaQuery` to the `RichText` widget’s `textScaleFactor` parameter.

### Contrast

<p align="center">
  <img src="https://assets.website-files.com/6143afec68f555387049efb3/6425db3f20915c144f646ff9_Contrast_Text.gif" height="200" alt="Contrast">
</p>

People with vision impairments may also face issues using your app if there’s not enough contrast between different
parts of your app.

The W3C recommends the following contrast ratios (CR) depending on the situation:

- 4.5:1 — If text is less than 18 points (24px) if not bold, and less than 14 pt (18px) if bold.
- 3:1 — If text is at least 18 pt if not bold and at least 14 pt if bold.

<p align="center">
  <img src="https://assets.website-files.com/6143afec68f555387049efb3/6425db6a49f020a6c4162c30_Contrast_rectangles.png" alt="Contrast examples">
</p>

You can use online tools like [contrast-checker](https://webaim.org/resources/contrastchecker/)
and [contrast-ratio](https://contrast-ratio.com/) to see if the CR of your colors meets app accessibility standards.

Both Android and iOS have accessibility settings to increase contrast. Flutter can read its state
using `MediaQuery.of(context).highContrast` boolean.

### Tap Targets

<p align="center">
  <img src="https://assets.website-files.com/6143afec68f555387049efb3/6425dbedd484c85fa6ef4d1d_Tap_Targets.gif" height="200" alt="Tap targets">
</p>

When you’re developing for mobile or any touch screen interfaces, you need to make sure that the tappable area for a
button or any action is large enough that it can be tapped properly.

People with motor impairments may find it difficult to focus or concentrate their muscles on small areas and may find it
challenging to tap the button if the tap target is too small. Even people with larger than average fingers may be
frustrated by mis-tapping a small tap target.

The Android Material Design guidelines for touch targets recommend a minimum of 48x48 density-independent pixels (dp)
for buttons, and Apple recommends at least 44x44 dp. They also recommend adding spaces of at least 8 dp between
interactive components to make them distinguishable from the surrounding components; also, make sure to avoid
overlapping tap targets.

In Flutter UI, the minimum tap target size is set to 48 dp, in line with the Material Design guidelines. The same size
is also used for iOS and all the other platforms that Flutter supports.

### Semantics

<p align="center">
  <img src="https://assets.website-files.com/6143afec68f555387049efb3/6425dc4620915c81c4647f27_Semantics_Accessibility.gif" height="200" alt="Semantics">
</p>

People with some forms of vision impairments may access your app with screen readers. Screen readers provide spoken
feedback so that people can use their devices without looking at their screens.

Based on a user's gestures or through external controllers like a keyboard, screen readers narrate the semantics of the
components, say whether something is tappable or not, and then dictate the results of those actions and other
information that may help the user navigate through your app.

By default, most Flutter widgets have some semantics. Flutter is smart enough to update those default semantics based on
the data you pass to the required parameters of those widgets. Also, there exist Flutter widgets to provide semantics to
custom widgets:

- [`Semantics`](https://api.flutter.dev/flutter/widgets/Semantics-class.html): annotates the widget tree with a
  description of the meaning of the widgets.
- [`MergeSemantics`](https://api.flutter.dev/flutter/widgets/MergeSemantics-class.html): merges the semantics of its
  descendants into a single one, useful to describe a group of widgets as a whole.
- [`ExcludeSemantics`](https://api.flutter.dev/flutter/widgets/ExcludeSemantics-class.html): drops all the semantics of
  its descendants, useful to reduce clutter and remove elements with no semantic values (background images or repeated
  content).

You can combine `ExcludeSemantics` and `Semantics` to provide a custom semantic to a group of widgets, for example.

`Semantics` have a lot of properties to fully customize the screen reader experience, such as:

- *decreasedValue*: the value that will result from performing a decrease action (e.g. a Slider)
- *increasedValue*: the value that will result from performing an increase action (e.g. a Slider)
- *isButton*: is the node a button or not
- *isChecked*: is the node a kind of checkbox, is it checked or not
- *isEnabled*: is the node enabled or not
- *isHeader*: is the node a header
- *hint*: brief description of the result of performing an action on this node
- *label*: description of the node
- *value*: textual description of the value
- *liveRegion*: to have content read automatically to the user as the result of some action

Also, to test the semantics, `MaterialApp` class has a `showSemanticsDebugger` property to replace all the widgets with
its semantic values.

<p align="center">
  <img src="https://kalabro.tech/static/e4273e125d93bf4a11322c04d6b72a74/46d1d/accessibility.png" height="400" alt="Semantics debugger">
</p>

Finally, Flutter has a `SemanticsService` to trigger some automatic TalkBack message, useful for example after a
purchase or to inform some result to the end user.

### Dyslexia

Since there are no specific tools to address this topic, it is encouraged to choose accessible fonts for users with
dyslexia.

Dyslexia accessibility studies aren’t sure if the most popular font for Dyslexia, OpenDyslexic, actually helps people
read faster. Most people prefer Verdana, Helvetica, or any Sans font. To select such a font family, you can use the
Google fonts package or import manually your own fonts.

For example, in Flutter you can run `flutter pub add google_fonts` from terminal to add the Google Fonts package into
your app, and change the default font to a more suitable one. See this example, on the left, you see the standard font
for iOS, on the right OpenSans:

<p align="center">
  <img src="https://miro.medium.com/v2/resize:fit:1400/format:webp/0*NA_gw1gLBmrStXzk.png" width="500" alt="Semantics debugger">
</p>

---

## Accessibility Tools

This is a Flutter package that adds checkers and tools to ensure your app is accessible to all. The tools only run in
debug mode, and are compiled out of release builds.

<p align="center">
  <img src="https://user-images.githubusercontent.com/756862/208949704-1b1f9211-2ae4-428d-a410-b58f03115b6a.png" height="200" alt="Accessibility tools package example">
</p>

[Official package URL](https://pub.dev/packages/accessibility_tools)

### Current accessibility checkers

#### Semantic label checker

Ensures buttons (and other tappable widgets) have an associated semantic label.

For example, this icon button is missing a label:

``` dart
IconButton(
  onPressed: () => login(),
  icon: Icon(Icons.person),
)
```

Adding a semantic label would fix this:

``` dart
IconButton(
  onPressed: () => login(),
  icon: Icon(Icons.person, semanticLabel: 'Login'),
)
```

#### Tap area checker

Makes sure all tappable widgets are large enough to easily tap. Defaults to the Material Design minimum of 48x48 on
mobile devices, and 44x44 on desktop devices.

#### Large font overflow checker

Experimental: ensures that no flex widgets, such as Column and Row, overflow when a user is using larger font sizes.
This checker is experimental, and disabled by default, and can be enabled via AccessibilityTools(checkFontOverflows:
true).

#### Input label checker

Makes sure text fields (TextField, TextFormField, Autocomplete, etc) and inputs (Checkbox, Radio, Switch, etc) have
semantic labels.

--- 

## Testing accessibility in Flutter

Flutter comes with
an [`Accessibility Guideline API`](https://api.flutter.dev/flutter/flutter_test/AccessibilityGuideline-class.html) to
check if your app's UI meets Flutter's accessibility recommendations, covering text contrast, target size and target
labels. The following example shows how to use the Guideline API to test accessibility in a demo widget:

``` dart
testWidgets('Accessibility guidelines test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.pumpWidget(MyWidget());
  
  // Checks that tappable nodes have a minimum size of 48 by 48 pixels
  // for Android.
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
  
  // Checks that tappable nodes have a minimum size of 44 by 44 pixels
  // for iOS.
  await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
  
  // Checks that touch targets with a tap or long press action are labeled.
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  
  // Checks whether semantic nodes meet the minimum text contrast levels.
  // The recommended text contrast is 3:1 for larger text
  // (18 point and above regular).
  await expectLater(tester, meetsGuideline(textContrastGuideline));
  handle.dispose();
});
```

To test semantics, you can either just test if your widgets have the expected semantics, or you can go further and also
test triggering the actions with semantic actions.

``` dart
testWidgets('Semantics test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.pumpWidget(testWidget);
  await tester.pumpAndSettle();
  
  // Checks whether semantic nodes matches a regular expression.
  // It can be used with a string, matching by string equality.
  expect(find.bySemanticsLabel(RegExp('Enter a search term')), findsOneWidget);
  
  handle.dispose();
});

testWidgets('Semantics tap action test', (WidgetTester tester) async {
  await tester.pumpWidget(testWidget);
  final helloWorldTextFinder = find.text("Hello World!");
  final semantics = tester.getSemantics(helloWorldTextFinder);
  
  // Triggers the tap action associated with the semantics id and checks if the Snackbar appears
  tester.binding.pipelineOwner.semanticsOwner!
          .performAction(semantics.id, SemanticsAction.tap);
  await tester.pump(const Duration(seconds: 1));
  expect(find.byType(SnackBar), findsOneWidget);
});
```

After these instrumentation tests, it's recommended to test semantics in a real device
with [TalkBack](https://support.google.com/accessibility/android/answer/6283677?hl=en) (Android)
and [VoiceOver](https://www.apple.com/lae/accessibility/vision/) (iOS).

**Important:** Despite Google recommending Accessibility Scanner app to test accessibility, it's not currently working
in Flutter (May 2023). Please refer to [this Flutter repo issue](https://github.com/flutter/flutter/issues/39531) for
further
information.

---

## PoC Demo videos

Android sample:

https://github.disney.com/storage/user/51464/files/57f23073-7941-4d33-88ff-45d4e64341a7


iOS sample:

https://github.disney.com/storage/user/51464/files/c7696956-1e61-42e5-b64e-ff76c55c8484

