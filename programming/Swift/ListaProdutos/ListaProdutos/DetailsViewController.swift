//
//  DetailsViewController.swift
//  ListaProdutos
//
//  Created by Diego Cavalca on 04/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderZoom: UISlider!
    @IBOutlet weak var switchZoom: UISwitch!
    
    var device: (name:String, photo:String) = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Opções padrão ScollView...
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.zoomScale = 1
        
        // Carregar os dados selecionados...
        self.title = device.name
        imageView.image = UIImage(named:device.photo)
        imageView.sizeToFit()
        
    }
    
    // Calibrando visual antes de carregar a subview...
    override func viewWillLayoutSubviews() {
        
        // Redimensionar ScrollView de acordo com a imagem...
        scrollView.contentSize = imageView.frame.size
    }
    
    // Função de manipulação do zoom dentro de um scroll view...
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {

        // Aplicar zoom no elemento ImageView...
        return imageView
        
    }
    
    // Ação de redimensionamento via slider...
    @IBAction func changeZoom(sender: AnyObject) {
        
        // Aplicar zoom de acordo com slider...
        scrollView.zoomScale = CGFloat(sliderZoom.value)
        
    }
    
    // Sincronizar o slider de acordo com zoom aplicado...
    func scrollViewDidZoom(scrollView: UIScrollView) {
        
        // Aplicar o valor do zoom atual ao slider...
        sliderZoom.setValue(Float(scrollView.zoomScale), animated:true)
        
    }
    
    // Habilitar zoom...
    @IBAction func turnOnOff(sender: AnyObject) {
        // Habilitar slider-zoom de acordo com switch...
        sliderZoom.enabled = switchZoom.on
        
        // Habilitar touch-zoom de acordo com switch...
        scrollView.pinchGestureRecognizer.enabled = switchZoom.on
    }
    
    
    
}
