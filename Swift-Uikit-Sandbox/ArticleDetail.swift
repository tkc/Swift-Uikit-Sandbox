
import Foundation
import UIKit
import FontAwesome_swift

class ArticleDetail: UIViewController, UITextFieldDelegate {
    
    internal var article:Article!
    private var scrollView: UIScrollView!
    private var toolbar: UIToolbar!
    
    var nameLabel = UILabel();
    var titleLabel = UILabel();
    var contentLabel = UILabel();
    var dateLabel = UILabel();
    var articleImageView:UIImageView!;
    var articleImage:UIImage!;
    
    private var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.white
        self.prepareScrollView()
        self.prepareScrollViewContents()
        self.prepareToolBar()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ArticleDetail {
    
    func prepareScrollView()  {
        scrollView = UIScrollView()
        scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(scrollView)
    }
    
    func prepareScrollViewContents(){
        
        articleImageView = UIImageView(frame: CGRectMake(0,0,0,0))
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentLabel.numberOfLines = 0
        
        articleImage = UIImage(named: article.ImgPath)
        articleImageView.image = articleImage
        articleImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.scrollView.addSubview(nameLabel);
        self.scrollView.addSubview(contentLabel);
        self.scrollView.addSubview(titleLabel);
        self.scrollView.addSubview(dateLabel);
        self.scrollView.addSubview(articleImageView)
        
        self.nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.scrollView.snp_top).offset(70)
            make.left.equalTo(self.view.snp_left).offset(30)
        }
        
        self.dateLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.nameLabel.snp_bottom).offset(10)
            make.left.equalTo(self.scrollView.snp_left).offset(30)
        }
        
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.dateLabel.snp_bottom).offset(10)
            make.left.equalTo(self.scrollView.snp_left).offset(30)
        }
        
        let resizeHeight = self.getResizeImageHeight()
        self.articleImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.titleLabel.snp_bottom).offset(20)
            make.bottom.equalTo(self.titleLabel.snp_bottom).offset(20+resizeHeight)
            make.left.equalTo(self.view.snp_left).offset(0)//TODO
            make.right.equalTo(self.view.snp_right).offset(0)//TODO
        }
        
        self.contentLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.articleImageView.snp_bottom).offset(20)
            make.left.equalTo(self.view.snp_left).offset(30)
            make.right.equalTo(self.view.snp_right).offset(-30)
            make.bottom.equalTo(self.scrollView.snp_bottom).offset(-150)
        }
    }
    
    func getResizeImageHeight() -> CGFloat{
        let imageOrgWidth = articleImage.size.width
        let resizeWidth = self.view.frame.width
        let rate = resizeWidth / imageOrgWidth
        return articleImage.size.height * rate
    }
    
    func commnetViewUp(sender: UIButton) {
        let v:ArticleCommnet = ArticleCommnet()
        self.presentViewController(v, animated: true, completion: nil)
    }
}

extension ArticleDetail {
    
    func prepareToolBar(){
        
        let editButton = UIButton()
        editButton.frame = CGRectMake(0,0,50,30)
        editButton.layer.masksToBounds = true
        editButton.titleLabel?.font = UIFont.fontAwesomeOfSize(26)
        editButton.setTitle(String.fontAwesomeIconWithCode("fa-comment-o"), forState: .Normal)
        editButton.setTitleColor(AppColors.gray, forState: UIControlState.Normal)
        editButton.addTarget(self, action: #selector(ArticleDetail.comment(_:)), forControlEvents: .TouchUpInside)
        let comment = UIBarButtonItem(customView: editButton)
       
        let likeButton = UIButton()
        likeButton.frame = CGRectMake(0,0,50,30)
        likeButton.layer.masksToBounds = true
        likeButton.titleLabel?.font = UIFont.fontAwesomeOfSize(26)
        likeButton.setTitle(String.fontAwesomeIconWithCode("fa-heart-o"), forState: .Normal)
        likeButton.setTitleColor(AppColors.gray, forState: UIControlState.Normal)
        likeButton.addTarget(self, action: #selector(ArticleDetail.like(_:)), forControlEvents: .TouchUpInside)
        let like = UIBarButtonItem(customView: likeButton)
        
        let shareButton = UIButton()
        shareButton.frame = CGRectMake(0,0,50,30)
        shareButton.layer.masksToBounds = true
        shareButton.titleLabel?.font = UIFont.fontAwesomeOfSize(26)
        shareButton.setTitle(String.fontAwesomeIconWithCode("fa-retweet"), forState: .Normal)
        shareButton.setTitleColor(AppColors.gray, forState: UIControlState.Normal)
        shareButton.addTarget(self, action: #selector(ArticleDetail.share(_:)), forControlEvents: .TouchUpInside)
        let share = UIBarButtonItem(customView: shareButton)
        
        let textButton = UIButton()
        textButton.frame = CGRectMake(0,0,100,30)
        textButton.backgroundColor = UIColor.clearColor()
        textButton.titleLabel?.font = UIFont.fontAwesomeOfSize(12)
        textButton.setTitle("277 recomends", forState: .Normal)
        textButton.setTitleColor(AppColors.black, forState: UIControlState.Normal)
        let text = UIBarButtonItem(customView: textButton)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil);
        
        toolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height , self.view.bounds.size.width, 50))
        toolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.size.height - 25)// TODO WHY
        toolbar.barStyle = .Default
        toolbar.tintColor = UIColor.whiteColor()
        toolbar.backgroundColor = AppColors.black_alfa
        toolbar.items = [comment, like, share, flexibleSpace, text]
        self.view.addSubview(toolbar)
    }
    
    func comment(sender: UIButton) {
        let v:ArticleCommnet = ArticleCommnet()
        self.presentViewController(v, animated: true, completion: nil)
    }
    
    func like(sender: UIButton) {
        
    }
    
    func share(sender: UIButton) {
        
    }
}
