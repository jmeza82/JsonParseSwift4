//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by Juan Meza on 1/12/18.
//  Copyright © 2018 Tech-IN. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    
    let name: String
    let description: String
    let courses: [Course]
    
}

struct Course: Decodable {
    
    //Sign ? is for variable optional, if missing fields
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonUrlString = "https://www.tech-in.co/examples/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let data = data else {
                return
            }
            
            do {
                //Only 1 data
                //let course = try JSONDecoder().decode(Course.self, from: data)
                //print(course.name)
                
                //Many datas
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
                //Array over arrays
                //let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                //print(websiteDescription.name, websiteDescription.description)
                
                
            
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
        }.resume()
    }

    


}

