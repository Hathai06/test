//
//  ViewController.swift
//  test
//
//  Created by living mobile on 13/1/2563 BE.
//  Copyright © 2563 living mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var manager = Manager()
    private var model = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "dataTableViewCell", bundle: nil), forCellReuseIdentifier: "dataTableViewCell")
        requestData()
        // Do any additional setup after loading the view.
    }
    
    @objc
    private func requestData() {
        manager.detailPerformRequest() { [weak self] (data, error) in
            
            guard let weakSelf = self else {
                return
            }
            
            if let data = data {
                print(data)
                weakSelf.model = data
                
                DispatchQueue.main.async {
                    weakSelf.tableView.reloadData()
                }
                
            } else {
                print(error!)
            }
        }
    }
    
}
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataTableViewCell") as! dataTableViewCell
        let modeldata = model[indexPath.row]
        cell.modelData = modeldata
        
        return cell
    }
    
}



