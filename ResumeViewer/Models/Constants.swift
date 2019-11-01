//
//  Constants.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import Foundation

struct Constants {
    
    static let fileName = "resume.json"
    
    struct EndPoints {
        static let getResume = "https://gist.githubusercontent.com/DenisEfremov71/b1219b73794dbb5c04b4f0ecad0f9809/raw/c4df5c781e5db4f3462019a1daac63b0a6ff0083/\(fileName)"
    }
    
    struct ErrorMessaages {
        static let fileDoesNotExist = "The resume file does not exist in the Documents folder."
    }
    
    struct SuccessMessaages {
        static let successCreate = "Successfully created"
    }
}
