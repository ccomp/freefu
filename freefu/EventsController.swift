//
//  EventsController.swift
//  freefu
//
//  Created by Cyron Completo on 2/11/18.
//  Copyright © 2018 GROUP FAIVE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class EventsController: UITableViewController {
    
    var events = [[String: String]]()
    var topLevel = [[String: Array<Dictionary<String, String>>]]()

    @IBOutlet weak var selectedEventFilter: UISegmentedControl!
    
    @IBAction func changeSelectedFilter(_ sender: UISegmentedControl) {
        switchTables()
    }
    
    func switchTables() {
        var keyQuery = "none"
        if (selectedEventFilter.selectedSegmentIndex == 0) {
            keyQuery = "spectatorItems"
        } else if (selectedEventFilter.selectedSegmentIndex == 1) {
            keyQuery = "socialItems"
        } else {
            keyQuery = "petItems"
        }
        for entry in topLevel {
            for (key, value) in entry {
                if (key == keyQuery) {
                    events = value
                }
            }
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name:  Notification.Name("UIDeviceOrientationDidChangeNotification"), object: nil)
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
        
        if let pathURL = Bundle.main.url(forResource: "eventsList", withExtension: "plist") {
            do {
                let data = try Data(contentsOf: pathURL)
                topLevel = (try PropertyListSerialization.propertyList(from: data, options: PropertyListSerialization.ReadOptions.mutableContainers, format: nil)) as! [Dictionary<String, Array>]
            } catch {
                print(error)
            }
        }
        switchTables()
    }
    
    @objc func orientationChanged() {
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)){
            
            print("landscape")
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)){
            
            print("Portrait")
        }
        self.view.frame = UIScreen.main.bounds
        self.view.layoutIfNeeded()
        self.tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.tableView.bounds
        gradientLayer.colors = [UIColor(red:0.11, green:0.19, blue:0.59, alpha:1.0).cgColor, UIColor(red:0.76, green:0.25, blue:0.84, alpha:1.0).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.7, y:1.0)
        gradientLayer.endPoint = CGPoint(x: 0.4, y:0.0)
        let backgroundView = UIView(frame: self.tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        self.tableView.backgroundView = backgroundView
        self.view.frame = UIScreen.main.bounds
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.frame = UIScreen.main.bounds
        self.view.layoutIfNeeded()
//        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        var coloredView = self.tableView.backgroundView as! colorView
//        coloredView.setGradientBackground(colorOne: UIColor(red:0.11, green:0.19, blue:0.59, alpha:1.0), colorTwo: UIColor(red:0.76, green:0.25, blue:0.84, alpha:1.0))
//        self.tableView.backgroundView = coloredView
    }
    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        cell.backgroundColor = UIColor.clear
//    }
    
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
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! CardViewCell
        cell.CellLabel?.text = events[indexPath.row]["name"]
        cell.CellLabel.textColor = UIColor.white
        cell.CellLabel.alpha = 1.0
        cell.CellImageView?.image = UIImage(named: events[indexPath.row]["imageName"]!)
        cell.backgroundColor = UIColor.clear
        cell.CellDescription.text = events[indexPath.row]["description"]
        cell.CellLocation.text = events[indexPath.row]["location"]
        cell.CellTime.text = events[indexPath.row]["date"]! + "\n" + events[indexPath.row]["time"]!
        cell.CellDescription.isUserInteractionEnabled = true
        cell.CellDescription.showsVerticalScrollIndicator = true
        cell.CellDescription.isScrollEnabled = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let address = events[indexPath.row]["location"]
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    print("location not found")
                    return
            }
            let regionDistance:CLLocationDistance = 10000
            let regionSpan = MKCoordinateRegionMakeWithDistance(location.coordinate, regionDistance, regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: location.coordinate, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = self.events[indexPath.row]["name"]
            mapItem.openInMaps(launchOptions: options)
            // Use your location
        }
    }
    

    /*
     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
