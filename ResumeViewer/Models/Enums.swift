//
//  Enums.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import Foundation

enum IOError: Error {
    case fileDoesNotExist
    case otherIOError
}

enum Section: String {
    case contactInformation = "Contact Information"
    case highlights         = "Highlights"
    case workExperience     = "Work Experience"
    case education          = "Education"
    case references         = "References"
}
