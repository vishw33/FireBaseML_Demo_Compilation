//
//  SelectImageController.swift
//  FireBaseMLDemo
//
//  Created by Vishwas on 13/05/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SelectImageController: UIViewController {

    fileprivate var imageServiceRequest:[String] = ["Im" , "image" ,"1" , "2" , "3" , "4"]
    var delegate:ImageSelectionProtocal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SelectImageController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return imageServiceRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectImageCell
        cell.imageHolderCellView.image = UIImage.init(named: imageServiceRequest[indexPath.row])
        cell.imageHolderCellView.contentMode = .scaleToFill
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let meta = Metadata.init(name: imageServiceRequest[indexPath.row], orientation:Orientation(rawValue: 0)!)
        
        self.delegate?.SelectedImage(image: UIImage.init(named: imageServiceRequest[indexPath.row])!,metadata: meta)
        self.dismiss(animated: true, completion: nil)
    }
}
