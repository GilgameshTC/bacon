//
//  ViewController.swift
//  bacon
//
//  Created by Fabian Terh on 19/3/19.
//  Copyright © 2019 nus.CS3217. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    var core: CoreLogic?

    @IBOutlet private weak var coinView: UIImageView!

    var isUpdateNeeded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        if core == nil {
            do {
                try core = CoreLogic()
            } catch {
                self.handleError(error: error, customMessage: Constants.coreFailureMessage)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        animateFloatingCoin()
    }

    @IBAction func plusButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mainToAddTransactionEx", sender: nil)
    }

    @IBAction func coinSwipedUp(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "mainToAddTransactionEx", sender: nil)
    }

    @IBAction func coinSwipedDown(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "mainToAddTransactionIn", sender: nil)
    }
}

extension MainPageViewController {
    func animateFloatingCoin() {
        let currentFrame = coinView.frame
        UIView.animate(withDuration: 0.7, delay: 0,
                       options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.coinView.frame = CGRect(x: currentFrame.minX, y: currentFrame.minY + 70.0,
                                         width: currentFrame.width, height: currentFrame.height)
        }, completion: nil)
    }
}

extension MainPageViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToAddTransactionEx" {
            guard let addController = segue.destination as? AddTransactionViewController else {
                return
            }
            addController.transactionType = .expenditure
            addController.core = core
        }
        if segue.identifier == "mainToAddTransactionIn" {
            guard let addController = segue.destination as? AddTransactionViewController else {
                return
            }
            addController.transactionType = .income
            addController.core = core
        }
        if segue.identifier == "mainToTransactions" {
            guard let transactionsController = segue.destination as? TransactionsViewController else {
                return
            }
            transactionsController.core = core
        }
    }
}
