//
//  ViewController.swift
//  BlurEffectsTable
//
//  Created by Artem Vaniukov on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let glassCases: [UIBlurEffect.Style] = [.dark, .extraLight, .light, .prominent, .regular, .systemChromeMaterial, .systemChromeMaterialDark, .systemChromeMaterialLight, .systemMaterial, .systemMaterialDark, .systemMaterialLight, .systemThickMaterial, .systemThickMaterialDark, .systemThickMaterialLight, .systemThinMaterial, .systemThinMaterialDark, .systemThinMaterialLight, .systemUltraThinMaterial, .systemUltraThinMaterialDark, .systemUltraThinMaterialLight]
    
    let glassCasesDescription = ["dark", "extraLight", "light", "prominent", "regular", "systemChromeMaterial", "systemChromeMaterialDark", "systemChromeMaterialLight", "systemMaterial", "systemMaterialDark", "systemMaterialLight", "systemThickMaterial", "systemThickMaterialDark", "systemThickMaterialLight", "systemThinMaterial", "systemThinMaterialDark", "systemThinMaterialLight", "systemUltraThinMaterial", "systemUltraThinMaterialDark", "systemUltraThinMaterialLight"]
    
    var tableView: UITableView!
    
    private let glassCellID = "glassCellID"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
        view.backgroundColor = .purple
            
        setupMachine()
    }

    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        tableView.backgroundColor = .clear
        tableView.rowHeight = 400
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(GlassCell.self, forCellReuseIdentifier: glassCellID)
        
        view.addSubview(tableView)
    }
    
    private func setupMachine() {
        let machine = BallMachine(for: view)
        machine.startShow()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        glassCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: glassCellID, for: indexPath) as! GlassCell
        
        let style = glassCases[indexPath.row]
        cell = GlassCell(with: style)
        cell.setLabel(glassCasesDescription[indexPath.row])
        cell.backgroundColor = .clear
        
        return cell
    }
}
