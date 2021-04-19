//
//  ViewController.swift
//  CameraFilter
//
//  Created by Adriaan van Schalkwyk on 2021/04/19.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController,
              let photosCollectionViewController = navigationController.viewControllers.first as? PhotosCollectionViewController
        else {
            fatalError("segue destination not found")
        }
        photosCollectionViewController.selectedPhoto.subscribe(onNext: { [weak self] photo in
            self?.photoImageView.image = photo
        }).disposed(by: disposeBag)
    }
}
