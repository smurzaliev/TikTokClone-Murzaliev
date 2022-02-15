//
//  ViewController.swift
//  TikTokClone-Murzaliev
//
//  Created by Samat Murzaliev on 15.02.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var layoutScreen = UIView()
    
    private lazy var mainTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .brown
//        view.showsVerticalScrollIndicator = false
//        view.isPagingEnabled = true
        
        return view
    }()
    
    private lazy var bottomBar = UIStackView()
    
    private lazy var videos: [CellModel] = [
        CellModel(image: "screen0"), CellModel(image: "screen1"), CellModel(image: "screen2"), CellModel(image: "screen3"), CellModel(image: "screen0"), CellModel(image: "screen1"), CellModel(image: "screen2"), CellModel(image: "screen3"), CellModel(image: "screen0"), CellModel(image: "screen1"), CellModel(image: "screen2"), CellModel(image: "screen3")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        
        setViews()
    }

    private func setViews() {
        
        view.addSubview(layoutScreen)
        layoutScreen.backgroundColor = .black
        layoutScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        layoutScreen.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
        
                
        
        //MARK: - Нижний StackView с кнопками из SF Symbols
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        
        let imageHome = UIImage(systemName: "house.fill", withConfiguration: largeConfig)
        let imageSearch = UIImage(systemName: "magnifyingglass", withConfiguration: largeConfig)
        let imageAdd = UIImage(systemName: "plus.rectangle", withConfiguration: largeConfig)
        let imageMessage = UIImage(systemName: "message", withConfiguration: largeConfig)
        let imageProfile = UIImage(systemName: "person.crop.circle", withConfiguration: largeConfig)
        
        let bottomButtonHome = UIButton(type: .system)
        bottomButtonHome.setImage(imageHome, for: .normal)
        
        let bottomButtonSearch = UIButton(type: .system)
        bottomButtonSearch.setImage(imageSearch, for: .normal)
        
        let bottomButtonAdd = UIButton(type: .system)
        bottomButtonAdd.setImage(imageAdd, for: .normal)
        
        let bottomButtonMessage = UIButton(type: .system)
        bottomButtonMessage.setImage(imageMessage, for: .normal)
        
        let bottomButtonProfile = UIButton(type: .system)
        bottomButtonProfile.setImage(imageProfile, for: .normal)
        
        
        bottomBar.addArrangedSubview(bottomButtonHome)
        bottomBar.addArrangedSubview(bottomButtonSearch)
        bottomBar.addArrangedSubview(bottomButtonAdd)
       
        bottomBar.addArrangedSubview(bottomButtonMessage)
        bottomBar.addArrangedSubview(bottomButtonProfile)
        
        layoutScreen.addSubview(bottomBar)
        bottomBar.axis = .horizontal
        bottomBar.distribution = .fillEqually
        bottomBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(mainTableView.snp.bottom)
            make.bottom.equalToSuperview().offset(-10)
        }
    
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        let model = videos[indexPath.row]
              
        cell.fill(model: model)
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return mainTableView.frame.height
    }
    
    
}

