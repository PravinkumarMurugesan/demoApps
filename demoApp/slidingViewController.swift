import UIKit

class slidingViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var mypageController: UIPageControl!
    
    var currentcellindex = 0
    var timer: Timer?
    
    var newOfferImages = ["images1","images3","images4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MUST HAVE
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        mypageController.numberOfPages = newOfferImages.count
        
        timer = Timer.scheduledTimer(timeInterval: 2.0,
                                     target: self,
                                     selector: #selector(slideToNext),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func slideToNext() {
        if currentcellindex < newOfferImages.count - 1 {
            currentcellindex += 1
        } else {
            currentcellindex = 0
        }
        
        mypageController.currentPage = currentcellindex
        
        myCollectionView.scrollToItem(
            at: IndexPath(item: currentcellindex, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
    }
}


extension slidingViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newOfferImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! MyCollectionViewCell
        
        cell.myImageView.image = UIImage(named: newOfferImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }

    
}

