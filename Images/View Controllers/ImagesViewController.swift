//
//  ImagesViewController.swift
//  Images
//
//  Created by Bart Jacobs on 31/07/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

final class ImagesViewController: UITableViewController {

    // MARK: - Types
    
    private struct Image {
    
        // MARK: - Properties
        
        let title: String
        
        // MARK: -
        
        let url: URL?
        
    }
    
    // MARK: - Properties
    
    private lazy var dataSource: [Image] = [
        Image(title: "Misery Ridge",                    url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/1.jpg")),
        Image(title: "Grand Teton Sunset",              url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/2.jpg")),
        Image(title: "Orange Icebergs",                 url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/3.jpg")),
        Image(title: "Grand Teton Sunrise",             url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/4.jpg")),
        Image(title: "Milky Tail",                      url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/5.jpg")),
        Image(title: "White Sands National Monument",   url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/6.jpg")),
        Image(title: "Stonehenge Storm",                url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/7.jpg")),
        Image(title: "Mountain Sunrise",                url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/8.jpg")),
        Image(title: "Colours of Middle Earth",         url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/9.jpg")),
        Image(title: "Misery Ridge",                    url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/1.jpg")),
        Image(title: "Grand Teton Sunset",              url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/2.jpg")),
        Image(title: "Orange Icebergs",                 url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/3.jpg")),
        Image(title: "Grand Teton Sunrise",             url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/4.jpg")),
        Image(title: "Milky Tail",                      url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/5.jpg")),
        Image(title: "White Sands National Monument",   url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/6.jpg")),
        Image(title: "Stonehenge Storm",                url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/7.jpg")),
        Image(title: "Mountain Sunrise",                url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/8.jpg")),
        Image(title: "Colours of Middle Earth",         url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/9.jpg"))
    ]
    
    private lazy var session: URLSession = {
        //print(URLCache.shared.memoryCapacity) // def cache size 512000 bytes // 0.5Mb
        URLCache.shared.memoryCapacity = 50 * 1024 * 1024 // set cache 512mb
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad // caching strategy
        return URLSession(configuration: configuration)
    }()

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseIdentifier, for: indexPath) as? ImageTableViewCell else {
            fatalError("Unable to Dequeue Image Table View Cell")
        }
        
        // Fetch Image
        let image = dataSource[indexPath.row]

        // Configure Cell
        cell.configure(with: image.title, url: image.url, session: session)

        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}
