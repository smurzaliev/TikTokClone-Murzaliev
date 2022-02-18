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
        view.showsVerticalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = self
        view.dataSource = self
        return view
    }()
    let bottomButtonHome: UIButton = {
        let view = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        view.setImage(UIImage(systemName: "house.fill", withConfiguration: largeConfig), for: .normal)
        return view
    }()
    let bottomButtonSearch: UIButton = {
        let view = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        view.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: largeConfig), for: .normal)
        return view
    }()
    let bottomButtonAdd: UIButton = {
        let view = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        view.setImage(UIImage(systemName: "plus.rectangle", withConfiguration: largeConfig), for: .normal)
        return view
    }()
    let bottomButtonMessage:UIButton = {
        let view = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        view.setImage(UIImage(systemName: "message", withConfiguration: largeConfig), for: .normal)
        return view
    }()
    let bottomButtonProfile: UIButton = {
        let view = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        view.setImage(UIImage(systemName: "person.crop.circle", withConfiguration: largeConfig), for: .normal)
        return view
    }()
    private lazy var bottomBar = UIStackView()

    //MARK: - Настройка модели экрана
    
    private lazy var videos: [CellModel] = [
        CellModel(image: "screen0"), CellModel(image: "screen1"), CellModel(image: "screen2"), CellModel(image: "screen3"), CellModel(image: "screen0"), CellModel(image: "screen1"), CellModel(image: "screen2"), CellModel(image: "screen3"), CellModel(image: "screen0"), CellModel(image: "screen1"), CellModel(image: "screen2"), CellModel(image: "screen3")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubViews()
    }

    private func setSubViews() {
        
        view.addSubview(layoutScreen)
        layoutScreen.backgroundColor = .black
        layoutScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        layoutScreen.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }

        //MARK: - Нижний StackView с кнопками из SF Symbols
                        
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

//MARK: - Делегаты UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTableViewCell()
        let model = videos[indexPath.row]
              
        cell.fill(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height - 80
    }

}

