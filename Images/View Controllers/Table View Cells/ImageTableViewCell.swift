//
//  ImageTableViewCell.swift
//  Images
//
//  Created by Bart Jacobs on 31/07/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {

    // MARK: - Static Properties
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    
    private var dataTask: URLSessionDataTask?
    
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet private var thumbnailImageView: UIImageView!

    // MARK: - Public API
    
    func configure(with title: String, url: URL?) {
        // Configure Title Label
        titleLabel.text = title
        
        print(Date())
        print(Thread.isMainThread)
        
        // Load Data
        if let url = url {
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                guard let data = data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.thumbnailImageView.image = image
                }
            }
            dataTask.resume()
            
            self.dataTask = dataTask
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dataTask?.cancel()
        dataTask = nil
        
        // Reset Thumnail Image View
        thumbnailImageView.image = nil
    }
    
}
