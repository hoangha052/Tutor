 //
//  SubjectViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 5/10/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import RATreeView

class SubjectViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var subjectTableView: UITableView!
//    @IBOutlet weak var subjectTreeView: RATreeView!
    var data : [AnyObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//         data = SubjectViewController.commonInit()
        self.subjectTableView.register(UINib.init(nibName: "TreeTableViewCell", bundle: nil), forCellReuseIdentifier: "TreeTableViewCell")
        self.getAllSubjectData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAllSubjectData() {
        UserProvider().getListProject { (response) in
            if let valueResponse = response?.data, valueResponse.count > 0 {
                self.data = valueResponse
                self.subjectTableView.reloadData()
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: - UItableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TreeTableViewCell") as! TreeTableViewCell
//        cell.configRootCell(self.data[safe: indexPath.row]! as! Project)
        cell.configCell(self.data[safe: indexPath.row]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TreeTableViewCell
        if cell.cellType == .expanded { return }
        if cell.cellType == .rootLevel {
            cell.cellType = .expanded
            var indexPaths: [IndexPath] = []
            for  i in 0 ... Int((cell.projectData?.levels?.count)!) - 1  {
                self.data.insert((cell.projectData?.levels?[i])!, at: indexPath.row + i + 1)
                indexPaths.append(IndexPath.init(row: indexPath.row + i + 1, section: 0))
            }
            tableView.beginUpdates()
            tableView.insertRows(at: indexPaths, with: .automatic)
            tableView.endUpdates()
        } else {
            print("subLevel")
        }
        cell.isSelectedCell = !cell.isSelectedCell
    }

}
