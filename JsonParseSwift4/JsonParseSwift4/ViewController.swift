//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by Mac on 09/10/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

//assign as decodable

struct strctJson:Decodable {
    let name:String
    let capital:String
    let region:String
    let population:Int
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
 var arrData = [strctJson]()
    
    @IBOutlet weak var tbl1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    
    func  getData()  {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if(error == nil){
                    self.arrData = try JSONDecoder().decode([strctJson].self, from: data!) //using JSONDecoder property
                    
                    for mainArr in self.arrData{
                        print("Name:\(mainArr.name),  Capital:\(mainArr.capital),  Region:\(mainArr.region), Population:\(mainArr.population)")
                        
                        DispatchQueue.main.async {
                            self.tbl1.reloadData()
                        }
                        
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.nameLbl.text = arrData[indexPath.row].name
        cell.lblCpital.text = arrData[indexPath.row].capital
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

