import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var eeveeImageView: UIImageView!
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    //用var宣告，以利可以使用隨機shuffle()
    var questions:[Question] = [
        Question(image: "太陽伊布", answer: "太陽伊布"),
        Question(image: "月亮伊布", answer: "月亮伊布"),
        Question(image: "水伊布", answer: "水伊布"),
        Question(image: "火伊布", answer: "火伊布"),
        Question(image: "仙子伊布", answer: "仙子伊布"),
        Question(image: "伊布", answer: "伊布"),
        Question(image: "冰伊布", answer: "冰伊布"),
        Question(image: "超級巨化伊布", answer: "超級巨化伊布"),
        Question(image: "葉伊布", answer: "葉伊布"),
        Question(image: "雷伊布", answer: "雷伊布")]
    
    //存放選到的題目及題數+1
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        answerLabel.text = "我是哪一隻伊布？"
        //隨機顯示題目和image
        questions.shuffle()
        eeveeImageView.image = UIImage(named: questions[index].image)
        numberOfQuestionLabel.text = "\(index+1) / 10"
        questionProgressView.progress = Float(index + 1) / 10
        self.inputTextField.attributedPlaceholder = NSAttributedString(string: "先猜猜看", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = questions[index].answer
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        answerLabel.text = "我是哪一隻伊布？"
        index = (index + 1) % questions.count
        eeveeImageView.image = UIImage(named: questions[index].image)
        inputTextField.text = ""
        numberOfQuestionLabel.text = "\(index+1) / 10"
        questionProgressView.progress = Float(index + 1) / 10
    }
    
    @IBAction func checkAnswer(_ sender: UITextField) {
        if inputTextField.text == questions[index].answer {
            answerLabel.text = "猜對了！"
        }else{
            answerLabel.text = "猜錯了，你真的知道嗎？"
        }
    }
}
