//
//  UIImageView+Extension.swift
//  ResumeViewer
//
//  Created by Denis Efremov on 2019-11-02.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
