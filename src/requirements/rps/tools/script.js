function randomanswer(user){
    var game_list = ["rock","scissors","paper"]
    var randomnum = Math.floor(Math.random() * 3);
    var computer = game_list[randomnum]
    var result
    if (computer == user) {
        result = 'Draw'
    }else{
        if(user == "rock"){
            if(computer == "scissors"){
                result = 'Win'
            }else{
                result = 'Lose'
            }
        }else if(user == "paper"){
            if(computer == "scissors"){
                result = "Lose"
            }else{
                result = "Win"
            }
        }else if(user == "scissors"){
            if(computer == "rock"){
                result ="Lose"
            }else{
                result = "Win"
            }
        }   
    }
addscore(result)
document.querySelector('.result').textContent = result
togglemodal()
}
const togglemodal = () => {
  document.querySelector('#modal').classList.toggle('open')
  document.querySelector('#overlay').classList.toggle('open')
}
var user = 0
var computer = 0
document.getElementById("player").textContent =  user ;
document.getElementById("computer").textContent = computer ;
const addscore = (result) => {
    if(result == "Win"){
        user++
    }else if(result == "Lose"){
        computer++
    }
document.getElementById("player").textContent =  user ;
document.getElementById("computer").textContent = computer ;
}

