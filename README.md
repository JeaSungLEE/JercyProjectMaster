# JercyProjectMaster
👩‍💻👨‍💻 Make your project settings even easier

When using swiftlint and cocoapods, beginners will have difficulty.
So I created the JercyProjectMaster, which is easier to use with the UI.

<img width="200" alt="image" src="https://github.com/JeaSungLEE/JercyProjectMaster/blob/master/JercyProjectMaster/Assets.xcassets/AppIcon.appiconset/icon-1.png">


## Use it
### [Download app](https://github.com/JeaSungLEE/JercyProjectMaster/releases/download/1.2/JercyProjectMaster.app.zip)

Unzip and launch the app.
When you run the app, you will see a screen where you can select a project location.
You must select the iOS project folder. (Make sure there is xcodeproj in that folder.)
<img width="592" alt="image" src="https://user-images.githubusercontent.com/13097922/52180597-acd73300-282b-11e9-870e-db8bb2d6c079.png">

JercyProjectMaster has two functions.
swiftlint, and cocoapods.

#### Swiftlint
<img width="800" alt="image" src="https://user-images.githubusercontent.com/13097922/52180603-c2e4f380-282b-11e9-8cdc-d7d4277e59b0.png">

Press the swiftlint button to see the above screen.
Check the name and description and check the lint you want to use.

The checks that are set by default refer to 
[swiftlint's Ruels.md](https://github.com/realm/SwiftLint/blob/master/Rules.md).

If you install swiftlint using homebrew instead of cocoapods,
You can use the bottom two buttons.

Press "update build phase" button to add swiftlint and swiftlint autocorrect to the build phase of the selected project.
so that you can check swiftlint on every build.

Press "install swiftlint" button to install swiftlint using brew. (If the homebrew is not installed, install the brew too.)

#### cocoapods
When you click the "cocoapods" button, the podfile is read from the selected project folder.
If the podfile is not in the project folder, an alert window will appear asking if you want to run pod init.

<img width="532" alt="image" src="https://user-images.githubusercontent.com/13097922/52180755-a2b63400-282d-11e9-85ad-bc69d9549c4b.png">

If you do not have cocoapods installed during pod init, use gem to install cocoadpos.
At this time, you need to enter the password because you will proceed with the sudo command.

<img width="602" alt="image" src="https://user-images.githubusercontent.com/13097922/52180904-fb3a0100-282e-11e9-842f-9fe208009e10.png">

More information about cocoapods can be found [here](https://cocoapods.org).


If you have any questions, please register as an issue.


## License
[MIT licensed](https://github.com/JeaSungLEE/JercyProjectMaster/blob/master/LICENSE).

## contribute
Everyone is welcome to contribute to JercyProjectMaster.
