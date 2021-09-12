//
//  HomeVC.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    //MARK: - variable
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.setupCollectionView()
        self.presenter.getAllServices()
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionView() {
        self.servicesCollectionView.delegate = self
        self.servicesCollectionView.dataSource = self
        self.servicesCollectionView.registerCell(cell: ServicesCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.servicesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(indexPath: indexPath) as ServicesCell
        self.presenter.configCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREENWEIGHT / 3 - 20, height: SCREENWEIGHT / 4)
    }
}

extension HomeVC: HomeViewProtocol {
    
    func showLoaderView() {
        print("Show Loader")
    }
    
    func hideLoaderView() {
        print("Hide Loader")
    }
    
    func showError(message: String) {
        UIAlertController.showAlertMessage(message)
    }
    
    func reloadData() {
        self.servicesCollectionView.reloadData()
    }
}
