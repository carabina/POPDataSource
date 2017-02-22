import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate, ReuseIdentifier {

    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var divider: UIImageView?
    @IBOutlet weak var subTitle: UILabel?
    @IBOutlet weak var icon: UIImageView?
    
    var didBeginEditing: (() -> ())?
    var didEndEditing: (() -> ())?
    var shouldChangeCharacter: ((NSRange, String) -> Bool)?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField?.delegate = self
    }
    
    func normal() {
        self.subTitle?.text = ""
        self.icon?.isHidden = true
        self.divider?.backgroundColor = .lightGray
    }
    
    func editing() {
        self.subTitle?.text = ""
        self.icon?.isHidden = true
        self.divider?.backgroundColor = .blue
    }
    
    func error(_ error: String) {
        self.subTitle?.text = error
        self.subTitle?.textColor = .red
        self.icon?.isHidden = false
        self.divider?.backgroundColor = .red
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let action = self.didBeginEditing {
             action()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let action = self.didEndEditing {
             action()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let action = self.shouldChangeCharacter {
            return action(range, string)
        }
        return true
    }
}
