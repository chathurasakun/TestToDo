//
//  DetailsViewController.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Variables
    var viewModel: DetailsViewModel!
    
    // MARK: - Components
    private var lblTotalPrice: UILabel!
    private var lblCount: UILabel!
    private var stepper: UIStepper!
    private var lblNumberOfDays: UILabel!
    private var lblActualPrize: UILabel!
    
    init(viewModel: DetailsViewModel, title: String) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        calculateActulPrize()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        
        lblTotalPrice = UILabel()
        lblTotalPrice.translatesAutoresizingMaskIntoConstraints = false
        lblTotalPrice.textAlignment = .center
        lblTotalPrice.numberOfLines = 1
        lblTotalPrice.text = "Total Sum : "
        lblTotalPrice.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.addSubview(lblTotalPrice)
        
        let totalPriceLabelConstraints = [
            lblTotalPrice.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            lblTotalPrice.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            lblTotalPrice.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            lblTotalPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(totalPriceLabelConstraints)
        
        lblCount = UILabel()
        lblCount.translatesAutoresizingMaskIntoConstraints = false
        lblCount.textAlignment = .center
        lblCount.numberOfLines = 1
        lblCount.text = "0"
        view.addSubview(lblCount)
        
        let countLabelConstraints = [
            lblCount.topAnchor.constraint(equalTo: lblTotalPrice.bottomAnchor, constant: 20),
            lblCount.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(countLabelConstraints)
        
        stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        view.addSubview(stepper)
        
        let stepperConstraints = [
            stepper.topAnchor.constraint(equalTo: lblCount.bottomAnchor, constant: 20),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stepper.widthAnchor.constraint(equalToConstant: 100),
            stepper.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(stepperConstraints)
        
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        lblNumberOfDays = UILabel()
        lblNumberOfDays.translatesAutoresizingMaskIntoConstraints = false
        lblNumberOfDays.text = "\(viewModel.numberOfDaysRemaining ?? "N/A") days remaing for the discount"
        lblNumberOfDays.textAlignment = .center
        lblNumberOfDays.numberOfLines = 1
        view.addSubview(lblNumberOfDays)
        
        let numberOfDaysLabelConstraints = [
            lblNumberOfDays.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 40),
            lblNumberOfDays.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(numberOfDaysLabelConstraints)
        
        lblActualPrize = UILabel()
        lblActualPrize.translatesAutoresizingMaskIntoConstraints = false
        lblActualPrize.text = "Calculating actual prize ...."
        lblActualPrize.textAlignment = .center
        lblActualPrize.numberOfLines = 1
        lblActualPrize.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lblActualPrize.textColor = .systemBlue
        view.addSubview(lblActualPrize)
        
        let actualPrizeLabelConstraints = [
            lblActualPrize.topAnchor.constraint(equalTo: lblNumberOfDays.bottomAnchor, constant: 40),
            lblActualPrize.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(actualPrizeLabelConstraints)
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        lblCount.text = String(sender.value)
        viewModel.itemCount = Int(sender.value)
        lblTotalPrice.text = "Total Sum : \(viewModel.totalSum)"
    }
}

// MARK: - API Requests
extension DetailsViewController {
    private func calculateActulPrize() {
        viewModel.calculateActualPrize { prize in
            /// This delay is added to mimic a network call. Actual production app we don't need to add these
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                self.lblActualPrize.text = "Actual prize is \(prize)"
                timer.invalidate()
            }
        }
    }
}
