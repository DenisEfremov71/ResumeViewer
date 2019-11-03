import Foundation

class ResumeService {
    func getResumeFromGist(completion: @escaping (Resume?, Error?) -> Void) {
        
        let urlString = Constants.EndPoints.getResume
        let dataManager = DataManager()
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                guard response != nil else {
                    completion(nil, error)
                    return
                }
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                
                if let resume = dataManager.parseJSON(data: data) {
                    completion(resume, nil)
                } else {
                    completion(nil, error)
                }
            })
            task.resume()
        }
    }
}

class MockResumeService: ResumeService {
    override func getResumeFromGist(completion: @escaping (Resume?, Error?) -> Void) {
        completion(nil, ResumeViewerError.resumeFetchError)
    }
}
