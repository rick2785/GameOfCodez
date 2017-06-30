//
//  DownloadService.swift
//  GameOfCodez
//
//  Created by Rickey Hrabowskie on 6/29/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DownloadService {
    
    static let instance = DownloadService()
    
    func downloadCharacter(completed: @escaping CharacterCompletion) {
        let random = Int(arc4random_uniform(500))
        
        let urlString = "\(BASE_URL)/\(random)"
        
        Alamofire.request(urlString).responseJSON { (response) in
            guard let data = response.data else { return }
            let json = JSON(data: data)
            
            let name = json["name"].stringValue
            let culture = json["culture"].stringValue
            let titles = json["titles"].arrayValue
            var title = ""
            if titles.count > 0 {
                if let titleJson = titles.first?.stringValue {
                    title = titleJson
                }
            }
            
            let aliases = json["aliases"].arrayValue
            var alias = ""
            if aliases.count > 0 {
                if let aliasJson = aliases.first?.stringValue {
                    alias = aliasJson
                }
            }
            
            let character = Character(name: name, title: title, culture: culture, alias: alias)
            
            completed(character)
        }
    }
}
