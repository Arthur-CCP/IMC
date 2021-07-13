

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TfWeigth: UITextField!
    @IBOutlet weak var TfHeigth: UITextField!
    @IBOutlet weak var LbResult: UILabel!
    @IBOutlet weak var ImgResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func Calculate(_ sender: Any) {
        if let weight = Double(TfWeigth.text!), let height = Double(TfHeigth.text!){
            imc = weight/pow(height, 2)
            showResults()
        
        }
    }
    func showResults(){
        var result: String = ""
        var image:  String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                image  = "abaixo"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image  = "abaixo"
            case 18..<25:
                result = "Peso Ideal"
                image  = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image  = "sobre"
            default:
                result = "Obesidade"
                image  = "obesidade"
        }
        LbResult.text = "\(Int(imc)): \(result)"
        ImgResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
        
    }
    
}

