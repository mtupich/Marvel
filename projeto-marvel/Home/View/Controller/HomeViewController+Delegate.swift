//
//  Files.swift
//  projeto-marvel
//
//  Created by C94279A on 01/12/21.
//

import UIKit
import Firebase

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
        let heroNameNoSpaces = detail.heroTapped?.name.replacingOccurrences(of: " ", with: "_")
        
        if collectionView == self.carouselCollectionView {
            detail.heroTapped = viewmodel.arrayCarousel[indexPath.row]
            Analytics.logEvent("Select_content", parameters: ["nome_heroi" : heroNameNoSpaces])
        } else if collectionView == self.listCollectionView {
            detail.heroTapped = viewmodel.filteredArrayList[indexPath.row]
            Analytics.logEvent("Select_content", parameters: ["nome_heroi" : heroNameNoSpaces])
        }
    }
}
