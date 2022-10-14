//
//  SelectedMovie.swift
//  MovieApp2
//
//  Created by admin on 22/09/22.
//

import UIKit

class SelectedMovie: UIViewController {

    
    @IBOutlet weak var movienameL: UILabel!
    
    
    @IBOutlet weak var taglineL: UILabel!
    
    @IBOutlet weak var posterI: UIImageView!
    
    
    @IBOutlet weak var overviewL: UITextView!
    
    @IBOutlet weak var budgetL: UILabel!
    
    
    @IBOutlet weak var languageL: UILabel!
    
    
    @IBOutlet weak var genreL: UILabel!
    
    @IBOutlet weak var ratingL: UILabel!
  
    
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TmdbUtility.instance.getMovieDetails(id: id) { [self] details in
            
            self.movienameL.text = details.original_title
            self.taglineL.text = details.tagline
            self.overviewL.text = details.overview
            self.budgetL.text = "\(details.budget)"
            self.languageL.text = details.original_language
            
            let genr = "\(details.genres[0].name) \(details.genres[1].name)"
            self.genreL.text = "\(genr)"
            self.ratingL.text = "\(details.popularity)"
            
            if let url = TmdbUtility.instance.downloadIfRequired(imageName: details.poster_path){
                
                self.posterI.image = UIImage(contentsOfFile: url.path)
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
