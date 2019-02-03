//
//  NSOpenPanel+Extensions.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Cocoa

extension NSOpenPanel {
    static func openPanner(with title: String) -> String? {
        let dialog = NSOpenPanel()
        dialog.title = title
        dialog.showsResizeIndicator = true
        dialog.canChooseDirectories = true
        dialog.canCreateDirectories = true
        dialog.allowsMultipleSelection = false
        dialog.allowedFileTypes = ["none"] //must select 'none' to select a folder
        dialog.allowsOtherFileTypes = false
        
        if dialog.runModal() == NSApplication.ModalResponse.OK {
            let result = dialog.url
            
            if let result = result {
                return  result.path
            }
        }
        return nil
    }
}
