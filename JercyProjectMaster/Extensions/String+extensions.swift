//
//  String+extensions.swift
//  JercyProjectMaster
//
//  Created by 이재성 on 03/02/2019.
//  Copyright © 2019 jercy. All rights reserved.
//

import Foundation

extension String {
    var nonEmpty: String? {
        guard count > 0 else {
            return nil
        }
        
        return self
    }
    
    func withoutSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else {
            return self
        }
        
        let startIndex = index(endIndex, offsetBy: -suffix.count)
        return replacingCharacters(in: startIndex..<endIndex, with: "")
    }
}
