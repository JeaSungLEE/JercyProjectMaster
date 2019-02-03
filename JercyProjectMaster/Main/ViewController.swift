//
//  ViewController.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var isFirstOpen: Bool = true
    @IBOutlet weak var pathLabel: NSTextFieldCell!
    @IBAction func DirectorySelectButtonAction(_ sender: NSButtonCell) {
        selectDirectory()
    }
    
    @IBAction func SettingCocoapodsAction(_ sender: NSButtonCell) {
        guard let cocoapodsViewController = storyboard?.instantiateController(withIdentifier: "CocoapodsViewController") as? CocoapodsViewController else { return }
        cocoapodsViewController.projectPath = pathLabel.title
        presentAsModalWindow(cocoapodsViewController)
    }
    
    @IBAction func SettingSwiftLintAction(_ sender: NSButtonCell) {
        guard let swiftLintViewController = storyboard?.instantiateController(withIdentifier: "SwiftLintViewController") as? SwiftLintViewController else { return }
        swiftLintViewController.projectPath = pathLabel.title
        presentAsModalWindow(swiftLintViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        if isFirstOpen {
            isFirstOpen.toggle()
            selectDirectory()
        }
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
}

extension ViewController {
    private func selectDirectory() {
        guard let path = NSOpenPanel.openPanner(with: "Please select Your Project Folder") else { return }
        let projectPath = try? FileManager.findXcodeproj(filesInFolderWithPath: path)
        guard projectPath! != nil else {
            NSAlert.dialogCancel(question: "Error", text: "You selected folder isn't an ios project folder. Please select ios project folder.")
            selectDirectory()
            return
        }
        pathLabel.title = path
    }
}
