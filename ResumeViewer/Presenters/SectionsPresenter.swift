import Foundation

class SectionsPresenter {
    let resumeService = ResumeService()
    let dataManager = DataManager()
    var resume: Resume?
    
    func getResume(completion: @escaping (Bool, Error?) -> Void) {
        if resume != nil {
            completion(true, nil)
        }
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
