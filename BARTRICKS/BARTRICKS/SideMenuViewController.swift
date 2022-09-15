//
//  SideMenuViewController.swift
//  SideMenu
//
//  Created by chaitanya on 03/09/22.
//

import UIKit
struct SideMenuModel {
    var icon: UIImage
    var title: String
}
protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}


class SideMenuViewController: UIViewController {
    
    var menu: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(systemName: "person")!, title: "PROFILE"),
        SideMenuModel(icon: UIImage(systemName: "photo.fill")!, title: "GALLERY"),
        SideMenuModel(icon: UIImage(systemName: "camera")!, title: "UPLOAD"),
        SideMenuModel(icon: UIImage(systemName: "person.2")!, title: "FRIENDS"),
        SideMenuModel(icon: UIImage(systemName: "magnifyingglass")!, title: "SEARCH"),
        SideMenuModel(icon: UIImage(systemName: "bell")!, title: "NOTIFICATIONS"),
        SideMenuModel(icon: UIImage(systemName: "wrench")!, title: "SETTINGS"),
        SideMenuModel(icon: UIImage(systemName: "rectangle.portrait.and.arrow.right")!, title: "SIGN OUT")
    ]
    
    var data = ["PROFILE","GALLERY","UPLOAD","FRIENDS","SEARCH","NOTIFICATIONS","SETTINGS","SIGN OUT",]
    let ImageNames = ["person","photo.fill","camera","person.2","magnifyingglass","bell","wrench","rectangle.portrait.and.arrow.right"]
    var defaultHighlightedCell: Int = 0
    var delegate: SideMenuViewControllerDelegate?
    
    @IBOutlet weak var sideMenuTitle: UILabel!
    @IBOutlet weak var sideMenuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UtilityFunction().userSelected(Object: "A")
        
        if UtilityFunction().getUserSelected() == "Chaitanya" {
            if let index = data.firstIndex(of: "UPLOAD") {
                data.remove(at: index)
            }
        }
        
        
        

        regesterTableViewCell()
        sideMenuTableView.backgroundColor = #colorLiteral(red: 0.4557096958, green: 0.3384696245, blue: 0.7207697034, alpha: 1)
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
        self.sideMenuTableView.reloadData()
    }
    
    func regesterTableViewCell(){
        sideMenuTableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: "SideMenuCell")
    }
}

extension SideMenuViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as? SideMenuCell else {return UITableViewCell()}
//        cell.iconImageView.image = self.menu[indexPath.row].icon
//        cell.titleLabel.text = self.menu[indexPath.row].title
        cell.iconImageView.image = UIImage(systemName: ImageNames[indexPath.row])
        cell.titleLabel.text = self.data[indexPath.row]
        
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.4557096958, green: 0.3384696245, blue: 0.7207697034, alpha: 1)
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UtilityFunction().getUserSelected() == "Chaitanya" {
        switch indexPath.row {
        case 0,1,2,3,4,5:
            return 60
        case 6:
           return 170
        default:
            return 50
        }
        }else {
            switch indexPath.row {
            case 0,1,2,3,4,5,6:
                return 60
            case 7:
               return 170
            default:
                return 50
        }
    }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        // Remove highlighted color when you press the 'Profile' and 'Like us on facebook' cell

    }
}
