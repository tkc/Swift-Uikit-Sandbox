
import UIKit

class ArticleTable: UIViewController, UITableViewDelegate, UITableViewDataSource,ArticleEdit {
    
    private var limit:Int = 20
    private var canLoadData:Bool = true
    
    private var articles:[Article]=[]
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
        self.prepareTable()
    }
    
    func editItem(article:Article) {
        self.articleAction(article)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let article = articles[indexPath.row]
        let detail = ArticleDetail()
        detail.article = article
        detail.title = article.Title
        detail.nameLabel.text = article.Name
        detail.dateLabel.text = article.Date
        detail.titleLabel.text = article.Title
        detail.contentLabel.text = article.Text
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ArticlwCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.delegate = self
        let article=articles[indexPath.row]
        cell.article=article// TODO
        cell.nameLabel.text = article.Name
        cell.contentLabel.text = article.getTextLimitCountTextStrng(100)
        cell.dateLabel.text = article.Date
        cell.titleLabel.text=article.Title
        cell.articleImage = UIImage(named:article.ImgPath)
        cell.accessoryType = UITableViewCellAccessoryType.None
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ArticleTable {
    
    func articleAction(article:Article){
        
        let alertSheet = UIAlertController(title: "Edit", message: "please select", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let action1 = UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) in
            print("Update")
            print(article.Name)
        })
        let action2 = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive, handler: {
            (action: UIAlertAction!) in
            print("Delete")
            print(article.Name)
        })
        let action3 = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (action: UIAlertAction!) in
            print("Cancel")
            print(article.Name)
        })
        
        alertSheet.addAction(action1)
        alertSheet.addAction(action2)
        alertSheet.addAction(action3)
        
        self.presentViewController(alertSheet, animated: true, completion: nil)
    }
    
    func setData(){
        let article=Article()
        article.Name="Name"
        article.ImgPath="article.jpeg"
        article.Date="2016/08/01"
        article.Title="Title"
        article.Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
        self.articles.append(article)
    }
    
    func prepareTable(){
        tableView = UITableView(frame: CGRect(x: 0, y:0, width: self.view.frame.width, height:self.view.frame.height))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.registerClass(ArticlwCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .SingleLine
        tableView.separatorColor = UIColor.clearColor()
        self.view.addSubview(tableView)
    }
    
}

