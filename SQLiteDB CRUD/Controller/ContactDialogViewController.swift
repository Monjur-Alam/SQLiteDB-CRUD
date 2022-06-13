//
//  ContactDialogViewController.swift
//  SQLiteDB CRUD
//
//  Created by MacBook Pro on 8/6/22.
//

import Foundation
import UIKit

class ContactDialogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet var parentView: UIView!
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    var numbers: [Person]!
    var delegate: getData!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertView.layer.cornerRadius = 10.0
        nameLabel.text = numbers[0].name
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.numbers[0].source.phoneNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListTableViewCell", for: indexPath) as? ContactListTableViewCell {
                let number = (numbers[0].source.phoneNumbers[indexPath.row].value).value(forKey: "digits") as? String
                    
            cell.selectionStyle = .none
            cell.UpdateCellView(numberText: number!)
                return cell
            } else {
                return ContactListTableViewCell()
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        
        delegate.setContact(name: numbers[0].name, number: ((numbers[0].source.phoneNumbers[indexPath.row].value).value(forKey: "digits") as? String)!)
    }
}
