//
//  ListTableViewController.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController {
    
    var wordArray: [Dictionary<String,String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil),
                           forCellReuseIdentifer: "cell")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        tableView.reloadData()
    }
    
    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int{
        return wordArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
            
            let nowIndexPathDictionally = wordArray[indexPath.row]
            
            cell.todolabel.text = nowIndexPathDictionally["todo"]
            cell.sublabel.text = nowIndexPathDictionally["subject"]
            
            return cell
    }

}
