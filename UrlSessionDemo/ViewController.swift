//
//  ViewController.swift
//  UrlSessionDemo
//
//  Created by Ahmad Eisa on 3/12/20.
//  Copyright © 2020 Ahmad Eisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func getBtnpressed(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            if let data = data {
                do{
                  let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                      debugPrint(error.localizedDescription)
                }
                
            }
            
        }.resume()
           
        
    }
    @IBAction func postBtnPressed(_ sender: Any) {
        let parameters = ["username":"Ahmad_Maher" , "tweet" : "Hello Ahmad"]
      guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return}
        var request = URLRequest(url: url)
        //let url session that we going to do apost request
        request.httpMethod = "POST"
        //parse data to json
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        // tell api what kind of data send to it
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
            
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    
                }
            }
           
        }.resume()
        
    }
    
}

