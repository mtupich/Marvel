//
//  ddzfghnghgbf.swift
//  projeto-marvel
//
//  Created by C94279A on 01/12/21.
//

import UIKit
import Kingfisher

extension HomeViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == carouselCollectionView {
            return viewmodel.arrayCarousel.count
            
        } else {
            return viewmodel.filteredArrayList.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == carouselCollectionView {
            
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as! CarouselCell
            cell1.cardCarosselLabel.text = viewmodel.arrayCarousel[indexPath.row].name
            
            let imagePath = viewmodel.arrayCarousel[indexPath.row].thumbnail.path
            let imageExtension = viewmodel.arrayCarousel[indexPath.row].thumbnail.extension
            
            let url = "\(String(describing: imagePath) )/standard_fantastic.\(String(describing: imageExtension))"
            let heroUrlImage = URL(string: url)
            
            cell1.cardCarosselImageView.kf.setImage(
                with: heroUrlImage,
                placeholder: UIImage(named: "Marvel_Logo 1"),
                options: [ .transition(ImageTransition.fade(2.0))],
                progressBlock: nil,
                completionHandler: { resultado in
                    switch resultado {
                    case .success(let image):
                        print(image.cacheType)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
            cell1.layer.cornerRadius =  10
            //            cell1.accessibilityLabel = "Nome \(cell1.cardCarosselLabel.text), item \(indexPath.row) de um total de \(viewmodel.arrayCarousel[indexPath.row].name.count)"
            cell1.cardCarosselLabel.isAccessibilityElement = true
            cell1.cardCarosselLabel.accessibilityHint = "Clique para abrir em detalhe"
            cell1.cardCarosselLabel.accessibilityLabel = "Foto com nome \(viewmodel.arrayCarousel[indexPath.row].name), numero \(indexPath.row + 1) de um total de \(viewmodel.arrayCarousel.count)"
            
            return cell1
            
        } else {
            
            
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCell
            cell2.cardListTitle.text = viewmodel.filteredArrayList[indexPath.row].name
            
            let imagePath = viewmodel.filteredArrayList[indexPath.row].thumbnail.path
            let imageExtension = viewmodel.filteredArrayList[indexPath.row].thumbnail.`extension`
            
            let url = "\(String(describing: imagePath))/standard_fantastic.\(String(describing: imageExtension))"
            let heroUrlImage = URL(string: url)
            
            cell2.cardListImageView.kf.setImage(
                with: heroUrlImage,
                placeholder: UIImage(named: "Marvel_Logo 1"),
                options: [
                    .transition(ImageTransition.fade(2.0))],
                progressBlock: nil,
                completionHandler: { resultado in
                    switch resultado {
                    case .success(let image):
                        print(image.cacheType)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
            
            cell2.layer.cornerRadius =  10
            cell2.cardListTitle.isAccessibilityElement = true
            cell2.cardListTitle.accessibilityHint = "Clique para abrir em detalhe"
            cell2.cardListTitle.accessibilityLabel = "Foto com nome \(viewmodel.filteredArrayList[indexPath.row].name), item \(indexPath.row + 1) de um total de \(viewmodel.filteredArrayList.count)"
            
            
            return cell2
        }
        
        
    }
    
}
