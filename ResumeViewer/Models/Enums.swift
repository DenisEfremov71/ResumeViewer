import Foundation

enum ResumeViewerError: Error {
    case resumeFetchError
}

enum Section: String {
    case contactInformation = "Contact Information"
    case highlights         = "Highlights"
    case workExperience     = "Work Experience"
    case education          = "Education"
    case references         = "References"
}
