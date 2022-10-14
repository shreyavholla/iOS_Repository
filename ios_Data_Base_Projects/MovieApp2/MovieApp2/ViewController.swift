//
//  ViewController.swift
//  MovieApp2
//
//  Created by admin on 22/09/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var topRatedMovies : [TMDBMovie] = []
   

    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tbl.dataSource = self
        tbl.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if  NetworkReachabilityManager.default?.isReachable == true {
            
            
            TmdbUtility.instance.getTopRatedMovies { movieList in
                self.topRatedMovies = movieList
                
                print("no of movies : \(self.topRatedMovies.count)")
                
                self.tbl.reloadData()
                
            }
        } else {
            
            let alertVC = UIAlertController(title: "OFFLINE", message: "Kindly connect to wifi or cellular device to proceed", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alertVC.addAction(okAction)
            
            present(alertVC, animated: false)
        }
        
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topRatedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell", for: indexPath) as! MovieCell
        
        let movie = topRatedMovies[indexPath.row]
        
        
        
        cell.titleL.text = movie.title
        cell.overviewT.text = movie.overview
        cell.releaseL.text = movie.release_date
        cell.ratingL.text = "\(movie.vote_average)/10"
        
//        TmdbUtility.instance.downloadImg(imgName: movie.poster_path) { imgData in
//            cell.posterI.image = UIImage(data: imgData)
//        }
        
        //new version to call image --> cache file
        if let url = TmdbUtility.instance.downloadIfRequired(imageName: movie.poster_path){
            
            cell.posterI.image = UIImage(contentsOfFile: url.path)
        }
        
        if(movie.adult) {
            cell.contentView.backgroundColor = .darkGray
        }else {
            cell.contentView.backgroundColor = .systemMint.withAlphaComponent(0.3)
        }
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderColor = CGColor(red: 0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.contentView.layer.borderWidth = 2.0
        
        return cell
    }
    
    
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selected = topRatedMovies[indexPath.row]
        
        
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectedMovie") as! SelectedMovie
        
        vc.id = selected.id
        
        //vc.genre = movie_sel.genres
        
        show(vc, sender:self)
    }
    
    
}
