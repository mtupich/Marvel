//
//  Detail-Protocols.swift
//  projeto-marvel
//
//  Created by C94279A on 25/11/21.
//

import UIKit
import Kingfisher

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return self.view.bounds.width + 20
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
       // cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15.0)
        cell.backgroundColor = .clear // setei uma cor no BG da detail
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            let cellImage  = UserDetailTableViewCell()
            guard let urlString = heroTapped?.thumbnail.path else { return UITableViewCell()}
            let imageExtension =  heroTapped?.thumbnail.`extension`
            let url = "\(urlString)/standard_fantastic.\(imageExtension!)"
            let heroUrlImage = URL(string: url)
            cellImage.setImageView(url: heroUrlImage!)
            cellImage.backgroundColor = .clear
            cellImage.selectionStyle  = .none
            return cellImage
            
        case 1:
            cell.backgroundColor = .clear
            cell.textLabel?.text = heroTapped?.name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            cell.textLabel?.textColor = .white
        case 2:
            guard let comicItens = heroTapped?.comics.items else { return cell }
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.textLabel?.text = "Sorry, we did not found comics for this hero 😔"
            if comicItens.count > 0 {
                var names = """
                            """
                
                for n in comicItens {
                    if let name = n.name {
                        names.append("\(name)\n")
                    }
                }
                cell.textLabel?.text = """
                📕 COMIC
                \(String(describing: names))
                """
            }
            
        default:
            return UITableViewCell()
        }
        
        return cell
        
        
    }
    
    
    
}



