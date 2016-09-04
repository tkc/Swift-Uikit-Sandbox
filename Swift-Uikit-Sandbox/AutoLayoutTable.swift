
import UIKit
import SnapKit

class AutoLayoutTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var texts = AutoLayoutModel.all()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func viewWillAppear(animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        
        self.view.backgroundColor = UIColor.redColor()
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(scrollView)
        
        let header: UILabel = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "header"
        header.numberOfLines = 1
        header.lineBreakMode = NSLineBreakMode.ByWordWrapping
        header.backgroundColor = AppColors.purple
        scrollView.addSubview(header)
        
        let footer: UILabel = UILabel()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.text = "footer"
        footer.numberOfLines = 1
        footer.lineBreakMode = NSLineBreakMode.ByWordWrapping
        footer.backgroundColor =  AppColors.purple
        scrollView.addSubview(footer)
        
        let contentView: UIView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(contentView)
        
        self.tableView = UITableView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.userInteractionEnabled = false
        self.tableView.registerClass(AutoLayoutCustomCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
        
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableViewAutomaticDimension
        
        contentView.addSubview(self.tableView)
        
        let viewsDict: Dictionary = [
            "mainView": self.view,
            "header": header,
            "footer": footer,
            "scrollView": scrollView,
            "contentView": contentView,
            "tableView": tableView
        ]
        
        let metricsDict: Dictionary = [
            "tableViewHeight": self.tableView.contentSize.height
        ]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView(==mainView)]|", options: [], metrics: nil, views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[scrollView]-0-|", options: [], metrics: nil, views: viewsDict))
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[header]-20-|", options: [], metrics: nil, views: viewsDict))
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[footer]-20-|", options: [], metrics: nil, views: viewsDict))
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(==scrollView)]|", options: [], metrics: nil, views: viewsDict))
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[header]-10-[contentView]-10-[footer]-10-|", options: [], metrics: nil, views: viewsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: [], metrics: nil, views: viewsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView(>=tableViewHeight)]|", options: [], metrics: metricsDict, views: viewsDict))
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AutoLayoutCustomCell
        cell?.title.text = self.texts[indexPath.row].title
        cell?.excerpt.text = self.texts[indexPath.row].text
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = AutoLayoutCustomCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        cell.title.text = self.texts[indexPath.row].title
        cell.excerpt.text = self.texts[indexPath.row].text
        return cell.height()
    }
}





