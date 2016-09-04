import UIKit
import SnapKit
import FontAwesome_swift

class ArticlwCell: UITableViewCell
{
    var article:Article!
    
    var nameLabel = UILabel();
    var titleLabel = UILabel();
    var contentLabel = UILabel();
    var dateLabel = UILabel();
    var articleImageView:UIImageView!;
    var articleImage:UIImage!;
    var delegate: ArticleEdit?
    var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.prepareView()
        self.prepareEditButton()
    }
   
    //TODO
    func viewWillAppear(animated: Bool) {
        self.nameLabel.text = self.article.Name
        self.titleLabel.text = self.article.Title
    }
    
    func edit(sender: UIButton){
        self.delegate?.editItem(self.article)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
}

extension ArticlwCell {

    func prepareView(){
        
        articleImageView = UIImageView(frame: CGRectMake(0,0,0,0))
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
       
        articleImage = UIImage(named: "article.jpeg")
        articleImageView.image = articleImage
        articleImageView.contentMode = UIViewContentMode.ScaleAspectFit
       
        self.addSubview(nameLabel);
        self.addSubview(contentLabel);
        self.addSubview(titleLabel);
        self.addSubview(dateLabel);
        self.addSubview(articleImageView)
       
        self.nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top).offset(20)
            make.left.equalTo(self.snp_left).offset(30)
        }
       
        self.dateLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.nameLabel.snp_bottom).offset(10)
            make.left.equalTo(self.snp_left).offset(30)
        }
       
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.dateLabel.snp_bottom).offset(10)
            make.left.equalTo(self.snp_left).offset(30)
        }
        
        let resizeHeight = self.getResizeImageHeight()
        self.articleImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.titleLabel.snp_bottom).offset(20)
            make.bottom.equalTo(self.titleLabel.snp_bottom).offset(20+100+resizeHeight)//TODO
            make.left.equalTo(self.snp_left).offset(0)
            make.right.equalTo(self.snp_right).offset(0)
        }
      
        self.contentLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.articleImageView.snp_bottom).offset(20)
            make.left.equalTo(self.snp_left).offset(30)
            make.right.equalTo(self.snp_right).offset(-30)
            make.bottom.equalTo(self.snp_bottom).offset(-20)
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ArticlwCell.edit(_:)))
        nameLabel.addGestureRecognizer(gestureRecognizer)
        self.bringSubviewToFront(nameLabel);
        nameLabel.userInteractionEnabled = true
    }
    
    func getResizeImageHeight() -> CGFloat{
        let imageOrgWidth = articleImage.size.width
        let resizeWidth = self.frame.width
        let rate = resizeWidth / imageOrgWidth
        return articleImage.size.height * rate
    }
 
    func prepareEditButton(){
        
        editButton = UIButton()
        editButton.frame = CGRectMake(0,0,30,30)
        editButton.backgroundColor = UIColor.clearColor()
        editButton.layer.masksToBounds = true
        
        editButton.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        editButton.setTitle(String.fontAwesomeIconWithCode("fa-angle-down"), forState: .Normal)
        editButton.setTitleColor(AppColors.green, forState: UIControlState.Normal)
        editButton.addTarget(self, action: #selector(ArticlwCell.edit(_:)), forControlEvents: .TouchUpInside)
    
        self.addSubview(editButton)
        self.editButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top).offset(20)
            make.right.equalTo(self.snp_right).offset(-30)
        }
    }
}

