//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskView: UITableView!
    private var tasks = Task.allTasks
    private var task1 = [[Task]]() {
    didSet {
            taskView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskView.dataSource = self
//        taskView.delegate = self
        loadData()
        
        dump(Task.makeSections())
    }
    
    func loadData() {
        task1 = Task.makeSections()
       }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a zzzz"
        let dateAsString = dateFormatter.string(from: task.dueDate)
        cell.detailTextLabel?.text = dateAsString
        return cell
}
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return task1.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return 
    }
}
