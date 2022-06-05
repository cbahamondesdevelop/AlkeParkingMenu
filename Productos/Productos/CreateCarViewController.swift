//
//  CreateCarViewController.swift
//  Productos
//
//  Created by Training on 25-05-22.
//

import UIKit

class CreateCarViewController: UIViewController {

    @IBOutlet weak var placaTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var anioTextField: UITextField!
    @IBOutlet weak var respuestaLabel: UILabel!
    @IBOutlet weak var CantMarchasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func onTapAdd(_ sender: Any) {
        
        let titulo = "Agregar Vehiculo"
        
        guard let plate = placaTextField.text, plate.count > 0 else {
            alerta(tituloAlerta: titulo, mensaje: "Placa patente es requerido", tituloOK: "OK")
            return
        }
        guard let name = nombreTextField.text, name.count > 0 else {
            alerta(tituloAlerta: titulo, mensaje: "Nombre Vehiculo es requerido", tituloOK: "OK")
            return
        }
        guard let des = descripcionTextField.text, des.count > 0 else {
            alerta(tituloAlerta: titulo, mensaje: "Modelo Vehiculo es requerido", tituloOK: "OK")
            return
        }
        guard let anio = anioTextField.text, anio.count > 0 else {
            alerta(tituloAlerta: titulo, mensaje: "Año de vehiculo es requerido", tituloOK: "Entendido")
            return
        }
        guard let cantMarchasINT = CantMarchasTextField.text, cantMarchasINT.count > 0 else {
            alerta(tituloAlerta: titulo, mensaje: "Cantidad marchas es requerido", tituloOK: "OK")
            return
        }
        
        
        let ageInt = Int(anio) ?? 0
        let cantMarchas = Int(cantMarchasINT) ?? 0
        var respuesta = ""
        let singleton = carManager.shared
        let car1 = Car(name: name, age: ageInt, des: des, plate: plate, cantidadMarchas: cantMarchas)
        
        
        if plate != "" && name != "" && des != "" && anio != "0" && ageInt != 0 && cantMarchas != 0 {
            singleton.addCar(auto: car1)
            
            respuesta = "Vehiculo agregado correctamente"
            respuestaLabel.text = ""
            
            alertaCreado()
        }
        else {
            respuesta = "Vehiculo NO agregado, debe llenar todos los datos"
            respuestaLabel.text = respuesta
            
            alerta(tituloAlerta: titulo, mensaje: respuesta, tituloOK: "OK")
        }
            
            
        
    }
    
    func alerta (tituloAlerta:String, mensaje:String, tituloOK:String) {
        //ALERT
        let alert = UIAlertController(title: tituloAlerta, message: mensaje, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: tituloOK, style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert,animated: true, completion: nil)
    }
    
    func alertaCreado () {
        
        let alert = UIAlertController(title: "Registro satisfactoria", message: "Se creó tu registro de carro satisfactoriamente", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
                    print("El usuario le dio tap en el boton OK")

                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true)
    }
    
}
