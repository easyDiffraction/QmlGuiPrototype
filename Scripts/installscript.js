
function Component()
{

//installer.executeDetached("set", "QWE2=qwe3");
    // default constructor
  //  installer.installationFinished.connect(this, Component.prototype.installationFinishedPageIsShown);





    //installer.setDefaultPageVisible(QInstaller.Introduction, false);
    //installer.setDefaultPageVisible(QInstaller.TargetDirectory, false);
    if (installer.isInstaller())
    {
        installer.setDefaultPageVisible(QInstaller.ComponentSelection, false); //******// works for Installer, but not for Updater !?
    }
    installer.setDefaultPageVisible(QInstaller.LicenseCheck, false);//******//
    //installer.setDefaultPageVisible(QInstaller.StartMenuSelection, false);
    //installer.setDefaultPageVisible(QInstaller.ReadyForInstallation, false);
    //installer.setDefaultPageVisible(QInstaller.PerformInstallation, false);
    //installer.setDefaultPageVisible(QInstaller.PerformInstallation, false);


}

// dont work
Component.prototype.installationFinishedPageIsShown = function()
{
    try {
        if (installer.isInstaller() && installer.status == QInstaller.Success) {
            //var args = ["PATH=%PATH;@TargetDir@"]
            //installer.executeDetached("set", args);
            ///installer.executeDetached("set", "QWE2=qwe2");
        }
    } catch(e) {
        console.log(e);
    }
}


// here we are creating the operation chain which will be processed at the real installation part later
Component.prototype.createOperations = function()
{

    // call default implementation to actually install the registeredfile
    component.createOperations();


//    var sep = ":";
//    if (installer.value("os") == "win") { sep = ";" }
//    var path = installer.environmentVariable("PATH") + sep + installer.value("TargetDir")
//    QMessageBox.warning("delete.question", "Installer", path, QMessageBox.Yes | QMessageBox.No);

    //component.addOperation("EnvironmentVariable", "FARSA_DIR", "@TargetDir@", true);


    // http://danlec.com/st4k#questions/43111510
    // https://bugreports.qt.io/browse/QTIFW-527
    // https://forum.qt.io/topic/30227/solved-qt-installer-framework-question-about-setting-enviroment-variables/2
    // https://stackoverflow.com/questions/43111510/qt-installer-framework-how-to-add-my-program-to-windows-system-variable-path
    // dont work

        // Add to system path
        //var sep = ":";
        //if (installer.value("os") == "win") { sep = ";" }
        //component.addOperation("EnvironmentVariable",
        //"PATH",
        //"DAVINCI_DIR",
        //installer.environmentVariable("PATH") + sep + "@TargetDir@",
        //"@TargetDir@",
        //true, // persistently
        //false // for all users
        //);



    if (systemInfo.productType === "windows")
    {
        // Add start menu shortcut for the app
        component.addOperation("CreateShortcut",
        "@TargetDir@/@ProductName@.exe",
        "@StartMenuDir@/@ProductName@.lnk",
        "workingDirectory=@TargetDir@",
        "iconPath=@TargetDir@/@ProductName@.exe", "iconId=0",
        "description=@ProductName@");
        // Add start menu shortcut for the app uninstaller
        component.addOperation("CreateShortcut",
        "@TargetDir@/@ProductName@Uninstaller.exe",
        "@StartMenuDir@/@ProductName@Uninstaller.lnk",
        "workingDirectory=@TargetDir@",
        "iconPath=@TargetDir@/@ProductName@Uninstaller.exe", "iconId=0",
        "description=@ProductName@Uninstaller");
        // Add desktop shortcut for the app
        component.addOperation("CreateShortcut",
        "@TargetDir@/@ProductName@.exe",
        "@DesktopDir@/@ProductName@.lnk",
        "workingDirectory=@TargetDir@",
        "iconPath=@TargetDir@/@ProductName@.exe", "iconId=0",
        "description=@ProductName@");
    }

    if (installer.value("os") == "x11")
    {
        component.addOperation( "CreateDesktopEntry",
                                "@TargetDir@/Davinci.desktop",
                                "Comment=A Scientific Software for the Visualization and Processing of Single-Crystal Diffraction Data Measured with a Point Detector.\nType=Application\nExec=@TargetDir@/@ProductName@\nPath=@TargetDir@\nName=Davinci\nGenericName=Davinci\nIcon=@TargetDir@/@ProductName@.png\nTerminal=false\nCategories=Science;Office;" );
        component.addOperation("Copy", "@TargetDir@/Davinci.desktop", "@HomeDir@/Desktop/Davinci.desktop");
    }







}
