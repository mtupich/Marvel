//
//  ViewController+UIScrollDelegate.swift
//  projeto-marvel
//
//  Created by C94279A on 01/12/21.
//

import UIKit

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // calcula aonde esta na posição y de cima para baixo
        let offsetY = listCollectionView.contentOffset.y
        let contentHeight = listCollectionView.contentSize.height
        // verifica se chegou no final da lista
        if offsetY > contentHeight - scrollView.frame.size.height && self.paginacao == false && !filter {
            animation?.loaderAnimation()
            viewmodel.scrollInfinito()
            
        }
        if offsetY < contentHeight - scrollView.frame.size.height && self.paginacao == true || self.viewmodel.reachConnection?.isConnected == false {
            animation?.animationView?.isHidden = true
        }
    }
}

