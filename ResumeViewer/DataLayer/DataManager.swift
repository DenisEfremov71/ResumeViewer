//
//  PersistenceManager.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import Foundation

class DataManager {
    
    let fileManager = FileManager.default
    
    func getResumeFromDocumentsFolder(filename: String, completion: @escaping (IOError?, Resume?) -> Void) {
        if fileExistsInDocuments(filename: filename) {
//            do {
//                let resume = try JSONDecoder().decode(Resume.self, from: data)
//                completion(nil, resume)
//            } catch let error {
//                print(error.localizedDescription)
//                completion(error, nil)
//            }
        } else {
            completion(IOError.fileDoesNotExist, nil)
        }
    }
    
    func fileExistsInDocuments(filename: String) -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(filename) {
            let filePath = pathComponent.path
            if fileManager.fileExists(atPath: filePath) {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
    func parseJSON(data: Data) -> Resume? {
        return try? JSONDecoder().decode(Resume.self, from: data)
    }
}

class MockDataManager: DataManager {
    override func getResumeFromDocumentsFolder(filename: String, completion: @escaping (IOError?, Resume?) -> Void) {
        completion(nil,nil)
    }
}
