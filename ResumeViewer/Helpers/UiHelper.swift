import Foundation
import UIKit

class UiHelper {
    
    static func showAlert(for viewController: UIViewController, with alert: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func addActivityIndicator(view: UIView, activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)
        }
    }
    
    static func removeActivityIndicator(activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}
