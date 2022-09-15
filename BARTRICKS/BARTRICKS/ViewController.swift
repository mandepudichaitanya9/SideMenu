//
//  ViewController.swift
//  SideMenu
//
//  Created by chaitanya on 03/09/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var data = [CategoryList]()
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBOutlet weak var dataCollectionView: UICollectionView!
    
    @IBOutlet weak var sideBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.white
        
        sideBtn.target = revealViewController()
        sideBtn.action = #selector(revealViewController()?.revealSideMenu)
        
        dataCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        fetchArrayjson { result in
            self.data = result
            DispatchQueue.main.async {
                self.dataCollectionView.reloadData()
            }
        }
    }
    
    func fetchArrayjson(completion: @escaping (_ result: [CategoryList]) -> (Void)){
            guard let fileLocation = Bundle.main.url(forResource: "simple", withExtension: "json") else {return}
            do {
              let data = try Data(contentsOf: fileLocation)
                let result = try JSONDecoder().decode(JsonModel.self, from: data)
                completion(result.categories)
            }catch {
                print("parsing error")
            }
    
        }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].videos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let videoData = data[indexPath.section].videos[indexPath.row]
        cell.titleLbl.text = videoData.title
        cell.imageView.downloaded(from: videoData.thumb)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 175)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoData = data[indexPath.section].videos[indexPath.row]
        playVideo(videoUrl: videoData.sources)
    }

    func playVideo(videoUrl:String){
        guard let url = URL(string: videoUrl) else {return}
        playerView = AVPlayer(url: url)
        playerView.play()
        playerViewController.player = playerView
        self.present(playerViewController, animated: true, completion: nil)
        
    }
}

