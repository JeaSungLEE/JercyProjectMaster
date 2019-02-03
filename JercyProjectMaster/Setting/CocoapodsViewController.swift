//
//  CocoapodsViewController.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Cocoa

class CocoapodsViewController: NSViewController {
    @IBOutlet weak var podfileTextField: NSTextFieldCell!
    var isFirstOpen: Bool = true
    var projectPath: String?
    
    @IBAction func updateXcodeprojAction(_ sender: Any) {
        let resultString = Process.launchWithPassword(command: "/usr/bin/gem update xcodeproj")
        NSAlert.dialogCancel(text: resultString)
    }
    @IBAction func updateCocoapodsAction(_ sender: Any) {
        let resultString = Process.launchWithPassword(command: "/usr/bin/gem update cocoapods")
        NSAlert.dialogCancel(text: resultString)
    }
    @IBAction func installCocoapodsAction(_ sender: Any) {
        let resultString = Process.launchWithPassword(command: "/usr/bin/gem install cocoapods")
        NSAlert.dialogCancel(text: resultString)
    }
    @IBAction func podrepoUpdateAction(_ sender: Any) {
        guard let path = projectPath, let podPath = findPodPath() else { return }
        let resultString = Process.launch(path: path, command: "\(podPath) repo update")
        NSAlert.dialogCancel(text: resultString)
    }
    @IBAction func podupdateAction(_ sender: Any) {
        guard let path = projectPath, let podPath = findPodPath() else { return }
        savePodfileString()
        let resultString = Process.launch(path: path, command: "\(podPath) update")
        NSAlert.dialogCancel(text: resultString)
    }
    @IBAction func podinstallAction(_ sender: Any) {
        guard let path = projectPath, let podPath = findPodPath() else { return }
        savePodfileString()
        let resultString = Process.launch(path: path, command: "\(podPath) install")
        NSAlert.dialogCancel(text: resultString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        if isFirstOpen {
            isFirstOpen.toggle()
            setPodfileString()
        }
    }
}

extension CocoapodsViewController {
    private func savePodfileString() {
        guard let path = projectPath else { return }
        try? podfileTextField.title.write(toFile: "\(path)/Podfile", atomically: true, encoding: String.Encoding.utf8)
    }
    
    private func setPodfileString() {
        if let podFileString = checkPodFile() {
            podfileTextField.title = podFileString
        } else {
            let answer = NSAlert.dialogOKCancel(question: "Podfile not found.", text: "Podfile not found. Do you want to pod init?")
            if answer {
                podInit()
                setPodfileString()
            }
        }
    }
    
    private func installCocoaPods() {
        let resultString = Process.launchWithPassword(command: "/usr/bin/gem install cocoapods")
        NSAlert.dialogCancel(text: resultString)
    }
    
    private func podInit() {
        guard let path = projectPath else { return }
        guard let podPath = findPodPath() else {
            let answer = NSAlert.dialogOKCancel(question: "CocoaPods not found.", text: "CocoaPods not found. Do you want to install CocoaPods using gem?")
            if answer {
                installCocoaPods()
                podInit()
            }
            return
        }

        let resultString =  Process.launch(path: path, command: "\(podPath) init")
        NSAlert.dialogCancel(text: resultString)
    }
 
    private func findPodPath() -> String? {
        guard Process.launch(command: "ls /usr/local/bin/pod") != nil else {
            return nil
        }
        return "/usr/local/bin/pod"
    }
    
    private func checkPodFile() -> String? {
        guard let projectPath = projectPath,
            let podfilePath = FileManager.findFile(path: projectPath, fileName: "Podfile"),
            let fileContent = FileManager.getContent(path: podfilePath) else { return nil }
        return fileContent
    }
}
