//
//  SwiftLintViewController.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Cocoa
import xcodeproj

class SwiftLintViewController: NSViewController {
    let lintModels = LintModels()
    var isFirstOpen: Bool = true
    var projectPath: String?
    
    @IBAction func creatButtonAction(_ sender: Any) {
        makeSwiftlintYml()
    }
    @IBAction func udateBuildPhaseAction(_ sender: Any) {
        addSwiftlintBuildPashe()
        addSwiftlintAutoCorrectBuildPashe()
        NSAlert.dialogCancel(text: "Complete add BuildPhas in your project")
    }
    @IBAction func installSwiftlintAction(_ sender: Any) {
        installSwiftlint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
}

extension SwiftLintViewController {
    private func installBrew() {
        let resultString = Process.launch(command: "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")
        NSAlert.dialogCancel(text: resultString)
    }
    
    private func installSwiftlint() {
        guard let brewPath = findBrewPath() else {
            installBrew()
            installSwiftlint()
            return
        }
        
        let resultString = Process.launch(command: "\(brewPath) install swiftlint")
        NSAlert.dialogCancel(text: resultString)
    }
    
    private func checkSwiftLintYml() -> String? {
        guard let projectPath = projectPath,
            let podfilePath = FileManager.findFile(path: projectPath, fileName: ".swiftlint.yml"),
            let fileContent = FileManager.getContent(path: podfilePath) else { return nil }
        return fileContent
    }
    
    private func makeSwiftlintYml() {
        guard let path = projectPath else { return }
        try? makeSwiftlintymlString().write(toFile: "\(path)/.swiftlint.yml", atomically: true, encoding: String.Encoding.utf8)
        
        NSAlert.dialogCancel(text: "Complete make .swiftlint.yml file")
    }
    
    private func makeSwiftlintymlString() -> String {
        let result = lintModels.getCheckBox()
        let checkedText = result.check.reduce("") {
            "\($0)- \($1)\n"
        }
        let uncheckedText = result.uncheck.reduce("") {
            "\($0)- \($1)\n"
        }
        
        return """
        opt_in_rules:
        \(checkedText)
        disabled_rules:
        \(uncheckedText)
        excluded:
        - Carthage
        - Pods
        """
    }
    
    private func findBrewPath() -> String? {
        guard Process.launch(command: "ls /usr/local/bin/brew") != nil else {
            return nil
        }
        return "/usr/local/bin/brew"
    }
}

extension SwiftLintViewController {
    func addSwiftlintBuildPashe() {
        do {
            guard let path = projectPath, let xcodeProjPath = try FileManager.getXcodeprojPath(path: path), let projectFilePath = try FileManager.getProjFilePath(path: path) else { return }
            let proj = try XcodeProj.init(pathString: xcodeProjPath)
            
            guard !check(proj: proj, name: "swiftlint") else { return }
            
            let buildPasheObject = PBXShellScriptBuildPhase.init(files: [], name: "Swiftlint", inputPaths: [], outputPaths: [], inputFileListPaths: [], outputFileListPaths: [], shellPath: "/bin/sh", shellScript: "if which swiftlint >/dev/null; then \nswiftlint\nelse\necho \"warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint\"\nfi", buildActionMask: 2147483647, runOnlyForDeploymentPostprocessing: false, showEnvVarsInLog: false)
            addBuildPhase(proj: proj, object: buildPasheObject)
            
            try proj.pbxproj.write(pathString: projectFilePath, override: true)
        } catch {}
    }
    
    func addSwiftlintAutoCorrectBuildPashe() {
        do {
            guard let path = projectPath, let xcodeProjPath = try FileManager.getXcodeprojPath(path: path), let projectFilePath = try FileManager.getProjFilePath(path: path) else { return }
            let proj = try XcodeProj.init(pathString: xcodeProjPath)
            
            guard !check(proj: proj, name: "Swiftlint Autocrorrect") else { return }
            
            let buildPasheObject = PBXShellScriptBuildPhase.init(files: [], name: "Swiftlint Autocrorrect", inputPaths: [], outputPaths: [], inputFileListPaths: [], outputFileListPaths: [], shellPath: "/bin/sh", shellScript: "if which swiftlint >/dev/null; then \nswiftlint autocorrect\nelse\necho \"warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint\"\nfi", buildActionMask: 2147483647, runOnlyForDeploymentPostprocessing: false, showEnvVarsInLog: false)
            addBuildPhase(proj: proj, object: buildPasheObject)
            
            try proj.pbxproj.write(pathString: projectFilePath, override: true)
        } catch {}
    }
    
    private func check(proj: XcodeProj, name: String) -> Bool {
        let filterShellScript = proj.pbxproj.shellScriptBuildPhases.filter {
            $0.name?.lowercased().contains(name.lowercased()) ?? false
        }
        
        return filterShellScript.count > 0
    }
    
    private func addBuildPhase(proj: XcodeProj, object: PBXShellScriptBuildPhase) {
        proj.pbxproj.nativeTargets.first?.buildPhases.append(object)
        proj.pbxproj.add(object: object)
    }
}

extension SwiftLintViewController: NSTableViewDelegate, NSTableViewDataSource {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if tableColumn?.identifier.rawValue == "CheckBoxColumn" {
            let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CheckBoxColumn"), owner: self) as? NSButton
            result?.state = lintModels.items[row].checked ? .on : .off
            result?.tag = row
            return result
        } else if tableColumn?.identifier.rawValue == "NameColumn" {
            let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "NameColumn"), owner: self) as? NSTableCellView
            result?.textField?.stringValue = lintModels.items[row].name
            return result
        } else {
            let result = tableView.makeView(withIdentifier: (tableColumn?.identifier)!, owner: self) as? NSTableCellView
            result?.textField?.stringValue = lintModels.items[row].description
            return result
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return lintModels.items.count
    }
}
