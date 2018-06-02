//
//  ViewController.swift
//  ComponentesLab
//
//  Created by Jonathan Varela on 6/2/18.
//  Copyright © 2018 Jonathan Varela. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var textoSwitch: UILabel!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textoSwitch.text = "Switch Activo"
        self.numberLabel.text = "0"
        self.sliderLabel.text = "0"
        self.ActivityIndicator.startAnimating()
        self.preparacionMapa()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SwitchBoton(_ sender: UISwitch) {
        if sender.isOn {
            self.ActivityIndicator.startAnimating()
            self.textoSwitch.text = "Switch Activo"
        }
        else{
            self.ActivityIndicator.stopAnimating()
            self.textoSwitch.text =  "Switch Desactivo"
        }
        
    }
    
    @IBAction func slider(_ sender: Any) {
        self.sliderLabel.text = String(Int(self.slider.value))
    }
    
    func preparacionMapa(){
        let coordinada = CLLocationCoordinate2D(latitude: 9.932316199999999, longitude: -84.03103390000001)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinada, 4000, 4000)
        let lugar = MKPointAnnotation();
        lugar.coordinate = coordinada;
        lugar.title = "Cenfotec"
        self.mapa.setRegion(coordinateRegion, animated: true)
        self.mapa.addAnnotation(lugar);
    }

    @IBAction func stepper(_ sender: UIStepper) {
        self.numberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func compartirTexto(_ sender: UIButton) {
        let URL =  [NSURL(string: "https://www.apple.com")]
        let activityViewController = UIActivityViewController(activityItems: URL , applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

