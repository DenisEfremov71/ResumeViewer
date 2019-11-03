//
//  SectionsViewController.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import UIKit

class SectionsViewController: UITableViewController {
    
    // MARK: - Properties
    
    let presenter = SectionsPresenter()
    var selectedSection: Section = .contactInformation
    //var resume = Resume()
    
    let sections: [String] = ["Overview", "Categories"]
    let items: [[String]] = [
        ["Contact Information", "Highlights"],          // Overview items
        ["Work Experience", "Education", "References"]  // Category items
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getResume { (success, error) in
            if let error = error {
                UiHelper.showAlert(for: self, with: "\(Constants.ErrorMessages.couldNotGetResume) Description: \(error.localizedDescription)")
            }
            if success == false {
                UiHelper.showAlert(for: self, with: "\(Constants.ErrorMessages.noResumeReturned)")
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resumeCell", for: indexPath)

        cell.textLabel?.text = items[indexPath.section][indexPath.row]

        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = presenter.resume else {
            UiHelper.showAlert(for: self, with: Constants.ErrorMessages.couldNotGetResume)
            return
        }
        selectedSection = Section(rawValue: items[indexPath.section][indexPath.row])!
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsViewController
        vc.presenter = self.presenter
        vc.section = selectedSection
    }

}
