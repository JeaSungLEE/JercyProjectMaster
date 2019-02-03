//
//  FileManager+Extensions.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Foundation

extension FileManager {
    static func findFile(path: String, fileName: String) -> String? {
        let fileManager = FileManager.default
        guard let items = try? fileManager.contentsOfDirectory(atPath: "\(path)") else { return nil }
        for itemName in items {
            if itemName == fileName {
                return "\(path)/\(itemName)"
            }
        }
        
        return nil
    }
    
    static func getContent(path: String) -> String? {
        let fileManager = FileManager.default
        guard let fileData = fileManager.contents(atPath: "\(path)") else { return nil }
        let fileString = String(data: fileData, encoding: String.Encoding.utf8)
        return fileString
    }
    
    static func getProjFilePath(path: String) throws -> String? {
        guard let xcodeProjName = try getXcodeprojPath(path: path) else { return nil }
        return "\(xcodeProjName)/project.pbxproj"
    }
    
    static func getXcodeprojPath(path: String) throws -> String? {
        guard let xcodeProjName = try findXcodeproj(filesInFolderWithPath: path) else { return nil }
        return "\(path)/\(xcodeProjName)"
    }
    
    static func findXcodeproj(filesInFolderWithPath folderPath: String) throws -> String? {
        let fileManager = FileManager.default
        
        for itemName in try fileManager.contentsOfDirectory(atPath: folderPath) {
            if itemName.hasSuffix(".xcodeproj") {
                return itemName
            }
        }
        
        return nil
    }
}
