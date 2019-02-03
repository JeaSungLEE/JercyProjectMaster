//
//  Process+Extensions.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Cocoa

extension Process {
    @discardableResult static func launch(command: String) -> String? {
        let bashString = Process().launchBash(withCommand: "\(command)")
        
        return bashString
    }
    
    @discardableResult static func launch(path: String, command: String) -> String? {
        let bashString = Process().launchBash(withCommand: "cd \(path) && \(command)")
        return bashString
    }
    
    @discardableResult static func launchWithPassword(command: String) -> String? {
        let bashString = Process().launchBashWithPassword(command: "\(command)")
        return bashString
    }
    
    @discardableResult static func launchWithPassword(path: String, command: String) -> String? {
        let bashString = Process().launchBashWithPassword(command: "cd \(path) && \(command)")
        return bashString
    }
    
    private func launchBash(withCommand command: String) -> String? {
        launchPath = "/bin/bash"
        arguments = ["-c", command]
        
        let pipe = Pipe()
        standardOutput = pipe
        standardError = Pipe()
        
        launch()
        waitUntilExit()
        
        let outputData = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: outputData, encoding: .utf8)?.nonEmpty
    }
    
    private func launchBashWithPassword(command: String) -> String? {
        guard let password = NSAlert.getString(title: "Required Password", question: "Please input password", defaultValue: "Password") else { return nil }
        
        let taskOne = Process()
        taskOne.launchPath = "/bin/echo"
        taskOne.arguments = [password]
        
        let taskTwo = Process()
        taskTwo.launchPath = "/usr/bin/sudo"
        taskTwo.arguments = ["-S", "/bin/bash", "-c", command]
        
        let pipeBetween:Pipe = Pipe()
        taskOne.standardOutput = pipeBetween
        taskTwo.standardInput = pipeBetween
        
        let pipeToMe = Pipe()
        taskTwo.standardOutput = pipeToMe
        taskTwo.standardError = pipeToMe
        
        taskOne.launch()
        taskTwo.launch()
        waitUntilExit()
        
        let outputData = pipeToMe.fileHandleForReading.readDataToEndOfFile()
        return String(data: outputData, encoding: .utf8)?.nonEmpty
    }
}
