//
//  DetailedViewController.swift
//  GitTest
//
//  Created by Alexey Antonov on 11/09/2020.
//  Copyright © 2020 Alex Antonov. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    
    var repo: RepoModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let repo = repo else {return}
        nameLabel.text = repo.name
        starsLabel.text = "\(repo.starCount)"
        avatarImageView.downloadPicture(from: repo.avatarURL)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
