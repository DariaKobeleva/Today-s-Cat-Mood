//
//  ViewController.swift
//  Today's Cat Mood
//
//  Created by Дарья Кобелева on 20.03.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var catImage: UIImageView!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchImage() {
        networkManager.fetchImage(from: Link.image.url) { [unowned self] result in
            switch result {
            case .success(let imageData):
                catImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
