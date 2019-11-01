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
    
    func getResume(completion: @escaping (Bool, Resume?) -> Void) {
        // first, try to get the resume from Documents folder
        dataManager.getResumeFromDocumentsFolder(filename: Constants.fileName) { (error, resume) in
            // if file does not exist, get it from gist.github.com
            if error?.localizedDescription == Constants.ErrorMessaages.fileDoesNotExist {
                
            }
        }
    }
}
