//
//  FoodController.swift
//  freefu
//
//  Created by Cyron Completo on 2/11/18.
//  Copyright © 2018 GROUP FAIVE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FoodController: UITableViewController {

    @IBAction func expandFood(_ sender: UITapGestureRecognizer) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let coloredView = colorView()
        coloredView.setGradientBackground(colorOne: UIColor(red:0.11, green:0.19, blue:0.59, alpha:1.0), colorTwo: UIColor(red:0.76, green:0.25, blue:0.84, alpha:1.0))
        coloredView.frame = tableView.bounds
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.tableView.bounds
        gradientLayer.colors = [UIColor(red:0.11, green:0.19, blue:0.59, alpha:1.0).cgColor, UIColor(red:0.76, green:0.25, blue:0.84, alpha:1.0).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.7, y:1.0)
        gradientLayer.endPoint = CGPoint(x: 0.4, y:0.0)
        let backgroundView = UIView(frame: self.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        self.tableView.backgroundView = backgroundView
        self.navigationItem.title = "Freefu Food"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame.size = size
//        print(gradientLayer.frame.size)
//        gradientLayer.colors = [UIColor(red:0.11, green:0.19, blue:0.59, alpha:1.0), UIColor(red:0.76, green:0.25, blue:0.84, alpha:1.0)]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0.7, y:1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.4, y:0.0)
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.7, y:1.0)
        gradientLayer.endPoint = CGPoint(x: 0.4, y:0.0)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    @IBOutlet weak var selectedFoodFilter: UISegmentedControl!
    
    @IBAction func changeFoodFilter(_ sender: UISegmentedControl) {
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! CardViewCell
        cell.CellLabel?.text = "Label"
        print(cell.CellLabel?.text)
        cell.CellImageView?.image = UIImage(named: "318x181")
        cell.backgroundColor = UIColor.clear
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
