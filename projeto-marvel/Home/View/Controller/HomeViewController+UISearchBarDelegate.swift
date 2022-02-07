//
//  searchTextField-ExtensionVC.swift
//  projeto-marvel
//
//  Created by C94279A on 23/11/21.
//

import Foundation
import UIKit

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchHeroes()
        
        if !searchText.isEmpty{
            filter = true
            viewmodel.filteredArrayList = viewmodel.arrayList.filter({ heroi in
                let newHero = heroi.name
                return newHero.contains(searchText)
            })
            self.listCollectionView.reloadData()
            
        }else{
            filter = false
            DispatchQueue.main.async {
                self.listCollectionView.reloadData()
            }
            searchBar.resignFirstResponder()
            viewmodel.fillArrayListWithApiResponse()
        }
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        if viewmodel.filteredArrayList.count > 0 {
            DispatchQueue.main.async {
                print("nothing to show :( ")
                
            }
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    func searchHeroes() {
        let query = heroSearchBar.text!
        //fileteredArrayList.removeAll()
        if let url = URL(string: urlCall.urlSearchNamesHero(nameStartWith: query)) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                
                // Convert
                var result: APIResult?
                
                do {
                    let decoder = JSONDecoder()
                    result = try decoder.decode(APIResult.self, from: data)
                    //  result = try JSONDecoder().decode(APIResult.self, from: data)
                }
                catch {
                    print("error")
                }
                
                guard let finalResult = result else {
                    return
                }
                
                // Update our movies array
                let newFilteredHeroes = finalResult.data
                self.viewmodel.arrayList = newFilteredHeroes.results
                
                
                // Refresh our table
                DispatchQueue.main.async {
                    self.listCollectionView.reloadData()
                }
                
                
            }
            .resume()
            
        }
        
    }
    
}





