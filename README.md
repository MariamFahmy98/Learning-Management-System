Windows 

System requirements
To install and run Flutter, your development environment must meet these minimum requirements:

Operating Systems: Windows 7 SP1 or later (64-bit), x86-64 based
Disk Space: 1.32 GB (does not include disk space for IDE/tools).
Tools: Flutter depends on these tools being available in your environment.
Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)
Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.

If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

Get the Flutter SDK
Download the following installation bundle to get the latest stable release of the Flutter SDK:


For other release channels, and older builds, see the SDK releases page.

Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK (for example, C:\src\flutter).

 Warning: Do not install Flutter in a directory like C:\Program Files\ that requires elevated privileges.

If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the Flutter repo on GitHub, and change branches or tags as needed. For example:

content_copy
C:\src>git clone https://github.com/flutter/flutter.git -b stable
You are now ready to run Flutter commands in the Flutter Console.

Update your path
If you wish to run Flutter commands in the regular Windows console, take these steps to add Flutter to the PATH environment variable:

From the Start search bar, enter ‘env’ and select Edit environment variables for your account.
Under User variables check if there is an entry called Path:
If the entry exists, append the full path to flutter\bin using ; as a separator from existing values.
If the entry doesn’t exist, create a new user variable named Path with the full path to flutter\bin as its value.
You have to close and reopen any existing console windows for these changes to take effect.

 Note: As of Flutter’s 1.19.0 dev release, the Flutter SDK contains the dart command alongside the flutter command so that you can more easily run Dart command-line programs. Downloading the Flutter SDK also downloads the compatible version of Dart, but if you’ve downloaded the Dart SDK separately, make sure that the Flutter version of dart is first in your path, as the two versions might not be compatible. The following command (on macOS, linux, and chrome OS), tells you whether the flutter and dart commands originate from the same bin directory and are therefore compatible. (Some versions of Windows support a similar where command.)

content_copy
 which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /usr/local/bin/dart
As shown above, the two commands don’t come from the same bin directory. Update your path to use commands from /path-to-flutter-sdk/bin before commands from /usr/local/bin (in this case). After updating your shell for the change to take effect, running the which or where command again should show that the flutter and dart commands now come from the same directory.

content_copy
 which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /path-to-flutter-sdk/bin/dart
To learn more about the dart command, run dart -h from the command line, or see the dart tool page.

Run flutter doctor
From a console window that has the Flutter directory in the path (see above), run the following command to see if there are any platform dependencies you need to complete the setup:

content_copy
C:\src\flutter>flutter doctor
This command checks your environment and displays a report of the status of your Flutter installation. Check the output carefully for other software you might need to install or further tasks to perform (shown in bold text).

For example:

content_copy
[-] Android toolchain - develop for Android devices
    • Android SDK at D:\Android\sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK,
      visit https://flutter.dev/setup/#android-setup for detailed instructions.
The following sections describe how to perform these tasks and finish the setup process. Once you have installed any missing dependencies, you can run the flutter doctor command again to verify that you’ve set everything up correctly.

 Note: If flutter doctor returns that either the Flutter plugin or Dart plugin of Android Studio are not installed, move on to Set up an editor to resolve this issue.

 Warning: The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time.

Flutter tool analytics are not sent on the very first run. To disable reporting, type flutter config --no-analytics. To display the current setting, type flutter config. If you opt out of analytics, an opt-out event is sent, and then no further information is sent by the Flutter tool.

By downloading the Flutter SDK, you agree to the Google Terms of Service. Note: The Google Privacy Policy describes how data is handled in this service.

Moreover, Flutter includes the Dart SDK, which may send usage metrics and crash reports to Google.

Android setup
 Note: Flutter relies on a full installation of Android Studio to supply its Android platform dependencies. However, you can write your Flutter apps in a number of editors; a later step discusses that.

Install Android Studio
Download and install Android Studio.
Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
Set up your Android device
To prepare to run and test your Flutter app on an Android device, you need an Android device running Android 4.1 (API level 16) or higher.

Enable Developer options and USB debugging on your device. Detailed instructions are available in the Android documentation.
Windows-only: Install the Google USB Driver.
Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.
In the terminal, run the flutter devices command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your adb tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the ANDROID_SDK_ROOT environment variable to that installation directory.
Set up the Android emulator
To prepare to run and test your Flutter app on the Android emulator, follow these steps:

Enable VM acceleration on your machine.
Launch Android Studio, click the AVD Manager icon, and select Create Virtual Device…
In older versions of Android Studio, you should instead launch Android Studio > Tools > Android > AVD Manager and select Create Virtual Device…. (The Android submenu is only present when inside an Android project.)
If you do not have a project open, you can choose Configure > AVD Manager and select Create Virtual Device…
Choose a device definition and select Next.
Select one or more system images for the Android versions you want to emulate, and select Next. An x86 or x86_64 image is recommended.
Under Emulated Performance, select Hardware - GLES 2.0 to enable hardware acceleration.
Verify the AVD configuration is correct, and select Finish.

For details on the above steps, see Managing AVDs.

In Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.

================================================================================================================================================================================================================

macOS 

System requirements
To install and run Flutter, your development environment must meet these minimum requirements:

Operating Systems: macOS (64-bit)
Disk Space: 2.8 GB (does not include disk space for IDE/tools).
Tools: Flutter uses git for installation and upgrade. We recommend installing Xcode, which includes git, but you can also install git separately.
 Important: If you’re installing on a Mac with the latest Apple M1 processor, you may find these supplementary notes useful reading as we complete support for the new Apple Silicon architecture.

Get the Flutter SDK
Download the following installation bundle to get the latest stable release of the Flutter SDK:


For other release channels, and older builds, see the SDK releases page.

Extract the file in the desired location, for example:

content_copy
 cd ~/development
 unzip ~/Downloads/flutter_macos_1.22.5-stable.zip
Add the flutter tool to your path:

content_copy
 export PATH="$PATH:`pwd`/flutter/bin"
This command sets your PATH variable for the current terminal window only. To permanently add Flutter to your path, see Update your path.

You are now ready to run Flutter commands!

 Note: To update an existing version of Flutter, see Upgrading Flutter.

Run flutter doctor
Run the following command to see if there are any dependencies you need to install to complete the setup (for verbose output, add the -v flag):

content_copy
 flutter doctor
This command checks your environment and displays a report to the terminal window. The Dart SDK is bundled with Flutter; it is not necessary to install Dart separately. Check the output carefully for other software you might need to install or further tasks to perform (shown in bold text).

For example:

content_copy
[-] Android toolchain - develop for Android devices
    • Android SDK at /Users/obiwan/Library/Android/sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK,
      visit https://flutter.dev/setup/#android-setup for detailed instructions.
The following sections describe how to perform these tasks and finish the setup process.

Once you have installed any missing dependencies, run the flutter doctor command again to verify that you’ve set everything up correctly.

Downloading straight from GitHub instead of using an archive
This is only suggested for advanced use cases.

You can also use git directly instead of downloading the prepared archive. For example, to download the stable branch:

content_copy
 git clone https://github.com/flutter/flutter.git -b stable
Update your path, and run flutter doctor. That will let you know if there are other dependencies you need to install to use Flutter (e.g. the Android SDK).

If you did not use the archive, Flutter will download necessary development binaries as they are needed (if you used the archive, they are included in the download). You may wish to pre-download these development binaries (for example, you may wish to do this when setting up hermetic build environments, or if you only have intermittent network availability). To do so, run the following command:

content_copy
 flutter precache
For additional download options, see flutter help precache.

 Warning: The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time.

Flutter tool analytics are not sent on the very first run. To disable reporting, type flutter config --no-analytics. To display the current setting, type flutter config. If you opt out of analytics, an opt-out event is sent, and then no further information is sent by the Flutter tool.

By downloading the Flutter SDK, you agree to the Google Terms of Service. Note: The Google Privacy Policy describes how data is handled in this service.

Moreover, Flutter includes the Dart SDK, which may send usage metrics and crash reports to Google.

Update your path
You can update your PATH variable for the current session at the command line, as shown in Get the Flutter SDK. You’ll probably want to update this variable permanently, so you can run flutter commands in any terminal session.

The steps for modifying this variable permanently for all terminal sessions are machine-specific. Typically you add a line to a file that is executed whenever you open a new window. For example:

Determine the directory where you placed the Flutter SDK. You need this in Step 3.
Open (or create) the rc file for your shell. Typing echo $SHELL in your Terminal tells you which shell you’re using. If you’re using Bash, edit $HOME/.bash_profile or $HOME/.bashrc. If you’re using Z shell, edit $HOME/.zshrc. If you’re using a different shell, the file path and filename will be different on your machine.
Add the following line and change [PATH_TO_FLUTTER_GIT_DIRECTORY] to be the path where you cloned Flutter’s git repo:

content_copy
 export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"
Run source $HOME/.<rc file> to refresh the current window, or open a new terminal window to automatically source the file.
Verify that the flutter/bin directory is now in your PATH by running:

content_copy
 echo $PATH
Verify that the flutter command is available by running:

content_copy
 which flutter
 Note: As of Flutter’s 1.19.0 dev release, the Flutter SDK contains the dart command alongside the flutter command so that you can more easily run Dart command-line programs. Downloading the Flutter SDK also downloads the compatible version of Dart, but if you’ve downloaded the Dart SDK separately, make sure that the Flutter version of dart is first in your path, as the two versions might not be compatible. The following command (on macOS, linux, and chrome OS), tells you whether the flutter and dart commands originate from the same bin directory and are therefore compatible. (Some versions of Windows support a similar where command.)

content_copy
 which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /usr/local/bin/dart
As shown above, the two commands don’t come from the same bin directory. Update your path to use commands from /path-to-flutter-sdk/bin before commands from /usr/local/bin (in this case). After updating your shell for the change to take effect, running the which or where command again should show that the flutter and dart commands now come from the same directory.

content_copy
 which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /path-to-flutter-sdk/bin/dart
To learn more about the dart command, run dart -h from the command line, or see the dart tool page.

Platform setup
macOS supports developing Flutter apps in iOS, Android, and the web (technical preview release). Complete at least one of the platform setup steps now, to be able to build and run your first Flutter app.

iOS setup
Install Xcode
To develop Flutter apps for iOS, you need a Mac with Xcode installed.

Install the latest stable version of Xcode (using web download or the Mac App Store).
Configure the Xcode command-line tools to use the newly-installed version of Xcode by running the following from the command line:

content_copy
 sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
 sudo xcodebuild -runFirstLaunch
This is the correct path for most cases, when you want to use the latest version of Xcode. If you need to use a different version, specify that path instead.

Make sure the Xcode license agreement is signed by either opening Xcode once and confirming or running sudo xcodebuild -license from the command line.
Versions older than the latest stable version may still work, but are not recommended for Flutter development. Using old versions of Xcode to target bitcode is not supported, and is likely not to work.

With Xcode, you’ll be able to run Flutter apps on an iOS device or on the simulator.

==============================================================================================================================================================================================================

Linux

System requirements
To install and run Flutter, your development environment must meet these minimum requirements:

Operating Systems: Linux (64-bit)
Disk Space: 600 MB (does not include disk space for IDE/tools).
Tools: Flutter depends on these command-line tools being available in your environment.
bash
curl
file
git 2.x
mkdir
rm
unzip
which
xz-utils
zip
Shared libraries: Flutter test command depends on this library being available in your environment.
libGLU.so.1 - provided by mesa packages such as libglu1-mesa on Ubuntu/Debian and mesa-libGLU on Fedora.
Get the Flutter SDK
On Linux, you have two ways you can install Flutter.

Install Flutter using snapd
The easiest way to install Flutter on Linux is by using snapd. For more information, see Installing snapd.

Once you have snapd, you can install Flutter using the Snap Store, or at the command line:

content_copy
$ sudo snap install flutter --classic
 Note: Once the snap is installed, you can use the following command to display your Flutter SDK path:

content_copy
  $ flutter sdk-path
Install Flutter manually
If you don’t have snapd, or can’t use it, you can install Flutter using the following steps.

Download the following installation bundle to get the latest stable release of the Flutter SDK:


For other release channels, and older builds, see the SDK releases page.

Extract the file in the desired location, for example:

content_copy
 cd ~/development
 tar xf ~/Downloads/flutter_linux_1.22.5-stable.tar.xz
If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the Flutter repo on GitHub with the following command:

content_copy
 git clone https://github.com/flutter/flutter.git
You can also change branches or tags as needed. For example, to get just the stable version:

content_copy
 git clone https://github.com/flutter/flutter.git -b stable --depth 1
Add the flutter tool to your path:

content_copy
 export PATH="$PATH:`pwd`/flutter/bin"
This command sets your PATH variable for the current terminal window only. To permanently add Flutter to your path, see Update your path.

Optionally, pre-download development binaries:

The flutter tool downloads platform-specific development binaries as needed. For scenarios where pre-downloading these artifacts is preferable (for example, in hermetic build environments, or with intermittent network availability), iOS and Android binaries can be downloaded ahead of time by running:

content_copy
 flutter precache
For additional download options, see flutter help precache.

You are now ready to run Flutter commands!

 Note: To update an existing version of Flutter, see Upgrading Flutter.

Run flutter doctor
Run the following command to see if there are any dependencies you need to install to complete the setup (for verbose output, add the -v flag):

content_copy
 flutter doctor
This command checks your environment and displays a report to the terminal window. The Dart SDK is bundled with Flutter; it is not necessary to install Dart separately. Check the output carefully for other software you might need to install or further tasks to perform (shown in bold text).

For example:

content_copy
[-] Android toolchain - develop for Android devices
    • Android SDK at /Users/obiwan/Library/Android/sdk
    ✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ
    • Try re-installing or updating your Android SDK,
      visit https://flutter.dev/setup/#android-setup for detailed instructions.
The following sections describe how to perform these tasks and finish the setup process.

Once you have installed any missing dependencies, run the flutter doctor command again to verify that you’ve set everything up correctly.

 Warning: The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time.

Flutter tool analytics are not sent on the very first run. To disable reporting, type flutter config --no-analytics. To display the current setting, type flutter config. If you opt out of analytics, an opt-out event is sent, and then no further information is sent by the Flutter tool.

By downloading the Flutter SDK, you agree to the Google Terms of Service. Note: The Google Privacy Policy describes how data is handled in this service.

Moreover, Flutter includes the Dart SDK, which may send usage metrics and crash reports to Google.

Update your path
You can update your PATH variable for the current session at the command line, as shown in Get the Flutter SDK. You’ll probably want to update this variable permanently, so you can run flutter commands in any terminal session.

The steps for modifying this variable permanently for all terminal sessions are machine-specific. Typically you add a line to a file that is executed whenever you open a new window. For example:

Determine the directory where you placed the Flutter SDK. You need this in Step 3.
Open (or create) the rc file for your shell. For example, Linux uses the Bash shell by default, so edit $HOME/.bashrc. If you are using a different shell, the file path and filename will be different on your machine.
Add the following line and change [PATH_TO_FLUTTER_GIT_DIRECTORY] to be the path where you cloned Flutter’s git repo:

content_copy
 export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"
Run source $HOME/.<rc file> to refresh the current window, or open a new terminal window to automatically source the file.
Verify that the flutter/bin directory is now in your PATH by running:

content_copy
 echo $PATH
Verify that the flutter command is available by running:

content_copy
 which flutter
 Note: As of Flutter’s 1.19.0 dev release, the Flutter SDK contains the dart command alongside the flutter command so that you can more easily run Dart command-line programs. Downloading the Flutter SDK also downloads the compatible version of Dart, but if you’ve downloaded the Dart SDK separately, make sure that the Flutter version of dart is first in your path, as the two versions might not be compatible. The following command (on macOS, linux, and chrome OS), tells you whether the flutter and dart commands originate from the same bin directory and are therefore compatible. (Some versions of Windows support a similar where command.)

content_copy
 which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /usr/local/bin/dart
As shown above, the two commands don’t come from the same bin directory. Update your path to use commands from /path-to-flutter-sdk/bin before commands from /usr/local/bin (in this case). After updating your shell for the change to take effect, running the which or where command again should show that the flutter and dart commands now come from the same directory.

content_copy
 which flutter dart
  /path-to-flutter-sdk/bin/flutter
  /path-to-flutter-sdk/bin/dart
To learn more about the dart command, run dart -h from the command line, or see the dart tool page.

Update path directly
In some cases, your distribution may not permanently acquire the path when using the above directions. When this occurs, you can change the environment variables file directly. These instructions require administrator privileges:

Determine the directory where you placed the Flutter SDK.

Locate the etc directory at the root of the system, and open the profile file with root privileges.

content_copy
 sudo nano /etc/profile
Update the PATH string with the location of your Flutter SDK directory.

content_copy
if [ "`id -u`" -eq 0 ]; then
   PATH="..."
else
   PATH="/usr/local/bin:...:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"
fi
export PATH
End the current session or reboot your system.
Once you start a new session, verify that the flutter command is available by running:

content_copy
 which flutter
For more details on setting the path in Bash, see this StackExchange question. For information on setting the path in Z shell, see this StackOverflow question.

Android setup
 Note: Flutter relies on a full installation of Android Studio to supply its Android platform dependencies. However, you can write your Flutter apps in a number of editors; a later step discusses that.

Install Android Studio
Download and install Android Studio.
Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
Set up your Android device
To prepare to run and test your Flutter app on an Android device, you need an Android device running Android 4.1 (API level 16) or higher.

Enable Developer options and USB debugging on your device. Detailed instructions are available in the Android documentation.
Windows-only: Install the Google USB Driver.
Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.
In the terminal, run the flutter devices command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your adb tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the ANDROID_SDK_ROOT environment variable to that installation directory.
Set up the Android emulator
To prepare to run and test your Flutter app on the Android emulator, follow these steps:

Enable VM acceleration on your machine.
Launch Android Studio, click the AVD Manager icon, and select Create Virtual Device…
In older versions of Android Studio, you should instead launch Android Studio > Tools > Android > AVD Manager and select Create Virtual Device…. (The Android submenu is only present when inside an Android project.)
If you do not have a project open, you can choose Configure > AVD Manager and select Create Virtual Device…
Choose a device definition and select Next.
Select one or more system images for the Android versions you want to emulate, and select Next. An x86 or x86_64 image is recommended.
Under Emulated Performance, select Hardware - GLES 2.0 to enable hardware acceleration.
Verify the AVD configuration is correct, and select Finish.

For details on the above steps, see Managing AVDs.

In Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.

=================================================================================================================================================================================================================


After that go to the root of your app (the same directory that contains the pubspec. yaml file for your project) and open the terminal and type 'flutter run' the application should run.
