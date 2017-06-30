//
//  ViewController.swift
//  GameOfCodez
//
//  Created by Rickey Hrabowskie on 6/29/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var cultureLbl: UILabel!
    @IBOutlet weak var aliasLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func findCharacterPressed(_ sender: UIButton) {
        DownloadService.instance.downloadCharacter { (character) in
            self.name.text = "Name: \(character.name)"
            self.titleLbl.text = "Title: \(character.name)"
            self.cultureLbl.text = "Culture: \(character.name)"
            self.aliasLbl.text = "Also Known As: \(character.name)"
        }
    }
    
    @IBAction func takeSnapshot(_ sender: UIButton) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let activityItems: [Any] = [image!]
        let avc = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(avc, animated: true, completion: nil)
    }
    
}

