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

class ViewController: UIViewController {
 var arrData = [strctJson]()
    
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
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

