import Foundation
import UIKit

struct Constants {
    
    static let fileName = "resume.json"
    
    struct EndPoints {
        static let getResume = "https://gist.githubusercontent.com/DenisEfremov71/b1219b73794dbb5c04b4f0ecad0f9809/raw/c4df5c781e5db4f3462019a1daac63b0a6ff0083/\(fileName)"
        static let freighteraLogoURL = "https://media.licdn.com/dms/image/C4D0BAQF6YVUAMKFoug/company-logo_400_400/0?e=1580947200&v=beta&t=CbXtclFpsjeDh0sJSonOMKYYDvixmgEO7NCadUcBfKc"
        static let fmLogoURL = "https://media.licdn.com/dms/image/C560BAQG4d1lwrB43iA/company-logo_400_400/0?e=1580947200&v=beta&t=oHGvw7JhC-fGr9gsV68Fvx3Ne9k4DLCGcFiTtGy8XMY"
    }
    
    struct ErrorMessages {
        static let fileDoesNotExist = "The resume file does not exist in the Documents folder."
        static let couldNotGetResume = "Error: could not get resume from gist.github."
        static let noResumeReturned = "Error: no resume returned from gist.github."
        static let otherError = "Some other error happened."
    }
    
    struct TestErrorMessages {
        static let jsonResultShouldNotBeNil = "JSON result should not be nil"
        static let fileExistsShouldNotBeFalse = "Result should not be false"
        static let fileExistsShouldNotBeTrue = "Result should not be true"
        static let getResumeFromGistErrorShouldBeNil = "Error should be nil"
        static let getResumeFromGistErrorShouldNotBeNil = "Error should not be nil"
        static let getResumeFromGistResumeShouldBeNil = "Resume should be nil"
        static let getResumeFromGistResumeShouldNotBeNil = "Resume should not be nil"
    }
    
    struct TestExpectations {
        static let getResume = "get resume"
    }
    
    struct Dimentions {
        static let titleHeight: CGFloat = 50
        static let lblHeight: CGFloat = 20
        static let txtViewHeight: CGFloat = 350
        static let txtViewHeightTaller: CGFloat = 700
        static let workExpViewHeight: CGFloat = 580
        static let educationViewHeight: CGFloat = 120
    }
}
