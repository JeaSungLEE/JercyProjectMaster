//
//  NSAlert+Extension.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Cocoa

extension NSAlert {
    static func dialogCancel(question: String, text: String) {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Cancel")
        alert.runModal()
    }
    static func dialogCancel(text: String?) {
        let alert = NSAlert()
        alert.messageText = "Complete"
        alert.informativeText = text ?? "Failed"
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Cancel")
        alert.runModal()
    }
    
    static func dialogYesCancel(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "YES")
        alert.addButton(withTitle: "Cancel")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    static func dialogOKCancel(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    static func getString(title: String, question: String, defaultValue: String) -> String? {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.messageText = title
        alert.informativeText = question
        
        let textField = NSSecureTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 24))
        textField.placeholderString = defaultValue
        
        alert.accessoryView = textField
        let response: NSApplication.ModalResponse = alert.runModal()
        
        if response == NSApplication.ModalResponse.alertFirstButtonReturn {
            return textField.stringValue
        } else {
            return nil
        }
    }
}
