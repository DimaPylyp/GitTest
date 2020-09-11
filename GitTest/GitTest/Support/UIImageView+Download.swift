//
//  UIImageView+Download.swift
//  GitTest
//
//  Created by Alexey Antonov on 11/09/2020.
//  Copyright © 2020 Alex Antonov. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadPicture(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            self.image = image
        } else {
            return
        }
    }
}
