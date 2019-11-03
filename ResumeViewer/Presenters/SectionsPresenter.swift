//
//  SectionsPresenter.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import Foundation

class SectionsPresenter {
    let resumeService = ResumeService()
    let dataManager = DataManager()
    var resume: Resume?
    
    func getResume(completion: @escaping (Bool, Error?) -> Void) {
        // first, try to get the resume from Documents folder
//        dataManager.getResumeFromDocumentsFolder(filename: Constants.fileName) { (error, resume) in
//            // if file does not exist, get it from gist.github.com
//            if let error = error {
//                if error == .fileDoesNotExist {
//                    completion(IOError.fileDoesNotExist, nil)
//                } else {
//                    completion(IOError.otherIOError, nil)
//                }
//            }
//        }
        resumeService.getResumeFromGist { (resume, error) in
            guard error == nil else {
                completion(false, error)
                return
            }
            guard resume != nil else {
                completion(false, error)
                return
            }
            self.resume = resume
            completion(true, nil)
        }
    }
}
