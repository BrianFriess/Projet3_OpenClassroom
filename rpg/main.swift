// MARK: -Creation des personnages

// creation de 2 tableaux vide de type character qui vont representer les 2 joueurs
var playerOne  = [Character]()
var playerTwo = [Character]()



// creation de la classe des personnages jouable
class Character {
    var name : String
    // la propriété deadOrAlive servira pour eviter de soigner un perso avec 0 PV
    var deadOrAlive = true
    var attack : Int
    var heal : Int
    var pv : Int
    var classe : String
    // propriété weapon est de type Weapon
    var weapon : AllWeapon
    
    
    // on crée un initialiseur qui va initialiser les valeurs qui seront changées en fonction du nom et de la classe du champion
    init (name: String, attack : Int, heal : Int, pv : Int, weapon : AllWeapon, classe : String ){
        self.name = name
        self.attack = attack
        self.heal = heal
        self.pv = pv
        self.classe = classe
        // les armes vont definir des bonus de soin / d'attaque
        // le case va rajouter à la propriété attaque ou soin des bonus
        self.weapon = weapon
        switch weapon{
        case .sword:
            self.attack += 5
        case .wand:
            self.heal += 5
        case .stick:
            self.attack += 3
            self.heal += 3
        case .fork:
            self.attack += 1
        }
    }
    
    //cette fonction sera changé en fonction de la classe pour que le champion disent une phrase après le choix des joueurs
    func choiceClasse(){
        print()
    }
    
    func statut() -> String{
        if deadOrAlive == true{
           return ("VIVANT 😄")
        }
        else {
           return ("MORT 💀")
        }
    }
}


// creation des classes de champion qui herite de character.
class Warrior : Character {
    // on initialise ici l'attaque, les pv, le heal et le nom du champion, pour le nom, on utilise la fonction checkName() qui est plus bas qui va demander à l'utilisateur de donner un nom.
    // initialiser de cette manière, permet de demander un nom immediatement à la création de l'instance.
    // on donne également une arme basique à nos champion qui vont leur donner de l'attaque ou du soin en plus.
    init(){
        let attack = 10
        let heal = 1
        let pv = 120
        let classe = "GUERRIER ⚔️"
        super.init(name: checkName() , attack: attack, heal: heal, pv: pv, weapon: .sword, classe: classe)
    }
    override func choiceClasse() {
        print("BASTON!⚔️\n")
    }
}


// creation des classes de champion qui herite de character.
class Healer : Character{
    init(){
        let attack = 1
        let heal = 10
        let pv = 80
        let classe = "SOIGNEUR 🧝‍♀️"
        super.init(name: checkName()  , attack: attack, heal: heal, pv: pv, weapon: .wand, classe: classe)
    }
    override func choiceClasse() {
        print("Prêt pour vous soigner 🧝‍♀️\n")
    }
}


// creation des classes de champion qui herite de character.
class Wizard : Character{
    init(){
        let attack = 5
        let heal = 5
        let pv = 100
        let classe = "MAGE 🧙‍♂️"
        super.init(name: checkName() , attack: attack, heal: heal, pv: pv, weapon: .stick, classe: classe)
    }
    override func choiceClasse() {
        print("Ma magie est à votre service 🧙‍♂️\n")
    }
}


// creation des classes de champion qui herite de character.
class Villageois : Character{
    init(){
        let attack = 1
        let heal = 1
        let pv = 30
        let classe = "VILLAGEOIS 🧑‍🌾🌾"
        super.init(name: checkName()  , attack: attack, heal: heal, pv: pv, weapon: .fork, classe: classe)
    }
    override func choiceClasse() {
        print("heu.. je suis pas sûr là... 🧑‍🌾\n")
    }
}

// cette enum contient toutes les armes du jeu et une petite phrase utiliser pour presenter l'arme
enum AllWeapon : String {
    case sword = "EPEE : +5 Attaque"
    case wand = "BAGUETTE : +5 Soin"
    case stick = "BATON : +3 Attaque / +3 Soin"
    case fork = "FOURCHE : +1 Attaque"
}


// fonction pour donner un nom aux personnage
func checkName() -> String{
    if let name = readLine(){
        return name
    }
    return ("nom non valide")
}



//on créé une fonction pour verifier qu'il y a bien un nom d'entrée pour le champion
// on a comme parametre un tableau de Character et range qui sera l'endroit ou nous somme dans notre tableau
func VerifNameEmpty(_ player : [Character], range : Int){
    while player[range-1].name == ""{
        // temps que le nom n'est pas rentré, on  appelle la fonction name()
        print("Merci de rentrer un nom")
        player[range-1].name = checkName()
    }
}






// ici, on verifie que dans le même tableau de characters, on des noms differents.
// la fonction prend comme paramètre un tableau de type character.
func sameNameinArray( _ player : [Character]){
    // cette boucle va verifier l'integralité des 2 autres boucle et ainsi eviter qu'on renomme par exemple le nom 2 comme le nom 1.
    while player[0].name == player[1].name || player[0].name == player[2].name || player [1].name == player[2].name
    {
        // cette boucle va verifier si le nom 1 est égale au nom 2 ou 3 si oui, elle va demander à changer le nom n°1.
        while player[0].name == player[1].name || player[0].name == player[2].name
        {
            print("\nil y a trop de \(player[0].name) dans cette equipe!"
                + "\n Nouveau nom du champion n° 1 :")
            player[0].name = checkName()
            //on appelle la fonction pour verifier qu'il y a bien un nom d'entrée
            VerifNameEmpty(player, range: 0+1)
        }
        // cette boucle, va verifier si le nom 2 est égale au nom 3 si oui, elle va demander à modifier le nom 2.
        while player[1].name == player[2].name
        {
            print("\nil y a trop de \(player[1].name) dans cette equipe!"
                + "\n Nouveau nom du champion n° 2 :")
            player[1].name = checkName()
            //on appelle la fonction pour verifier qu'il y a bien un nom d'entrée
            VerifNameEmpty( player, range: 1+1)
        }
    }
}



// cette fonction va permettre de comparer les 2 tableaux
func sameNameInTwoArray(){
    // on crée une boucle avec le 1er tableau qui à chaque tour va fouiller le contenu integrale du 2eme tableau
    for i in playerOne{
        for j in playerTwo{
            // si on trouve des noms identiques, on crée un boucle pour renommer le champion du joueur 1 temps que le nom est identique
            if i.name == j.name{
                while i.name == j.name
                {
                print("\nLes 2 joueurs ont prit le nom \(j.name)"
                    + "\n\nJOUEUR 1 merci de changer le nom de \(j.name)")
                    i.name = checkName()
                    // on appelle dans ce cas la fonction pour verifier les doublons dans un tableau pour eviter de renommer son champion avec un nom déjà utilisé
                    sameNameinArray(playerOne)
                    // on reverifie les noms dans les 2 tableaux
                    sameNameInTwoArray()
                }
            }
        }
    }
}





// fonction pour initialiser les 3 champions du joueur 1
func createCharacterOne(){
    print("\n////////"
        + "JOUEUR 1"
        + "////////")
    
    //on crée une boucle pour créer 3 cases du tableau et pour donner un nom à chaque champion et une classe de champion
    for i in 1...3{
        print("\nCLASSE DE VOTRE CHAMPION N°\(i) :"
            + "\n1- GUERRIER⚔️ - Beaucoup d'attaque mais peu de soin - PV : 120"
            + "\n2- SOIGNEUR🧝‍♀️ - Beaucoup de soin mais peu d'attaque - PV : 80 "
            + "\n3- MAGE🧙‍♂️ - attaque et soin équilibrés - PV : 100"
            + "\nautre - VILLAGEOIS🧑‍🌾 - très peu d'attaque et de soin, on vous deconseille - PV : 30")
        // on laisse l'utilisateur choisir sa classe
        if let choice = readLine(){
            if choice == "1"{
                // une fois le choix fait, on donne alors la classe à chaque champion et on lui donne un nom avec la fonction name() qui est dejà initaliser dans la classe
                print(" NOM DU CHAMPION N° \(i)")
                playerOne.append(Warrior())
            }
            else if choice == "2"{
                print(" NOM DU CHAMPION N° \(i)")
                playerOne.append(Healer())
            }
            else if choice == "3"{
                print(" NOM DU CHAMPION N° \(i)")
                playerOne.append(Wizard())
            }
            // si le choix est autre que 1-2-3 alors le champion sera un villageois... bonne chance
            else {
                print(" NOM DU... VILLAGEOIS ?? N° \(i)")
                playerOne.append(Villageois())
            }
        }
        // si le nom est vide, on redemande d'en entrée un.
        VerifNameEmpty(playerOne, range: i)
    }
    //On utilise la fonction pour verifier si il y a deux fois le même nom dans le tableau
    sameNameinArray(playerOne)
}





// fonction pour initialiser les 3 champions du joueur 2
func createCharacterTwo(){
    print("\n////////"
        + "JOUEUR 2"
        + "////////")
    
    //on crée une boucle pour créer 3 cases du tableau et pour donner un nom à chaque champion et une classe de champion
    for i in 1...3{
        print("\nCLASSE DE VOTRE CHAMPION N°\(i) :"
            + "\n1- GUERRIER⚔️ - Beaucoup d'attaque mais peu de soin - PV : 120"
            + "\n2- SOIGNEUR🧝‍♀️ - Beaucoup de soin mais peu d'attaque - PV : 80 "
            + "\n3- MAGE🧙‍♂️ - attaque et soin équilibrés - PV : 100"
            + "\nautre - VILLAGEOIS🧑‍🌾 - très peu d'attaque et de soin, on vous deconseille - PV : 30")
        // on laisse l'utilisateur choisir sa classe
        if let choice = readLine(){
            if choice == "1"{
                // une fois le choix fait, on donne alors la classe à chaque champion et on lui donne un nom avec la fonction name() qui est dejà initaliser dans la classe
                print(" NOM DU CHAMPION N° \(i)")
                playerTwo.append(Warrior())
            }
            else if choice == "2"{
                print(" NOM DU CHAMPION N° \(i)")
                playerTwo.append(Healer())
            }
            else if choice == "3"{
                print(" NOM DU CHAMPION N° \(i)")
                playerTwo.append(Wizard())
            }
            // si le choix est autre que 1-2-3 alors le champion sera un villageois... bonne chance
            else {
                print(" NOM DU... VILLAGEOIS ?? N° \(i)")
                playerTwo.append(Villageois())
            }
        }
        // si le nom est vide, on redemande d'en entrée un.
        VerifNameEmpty(playerTwo, range: i)
    }
    //On utilise la fonction pour verifier si il y a deux fois le même nom dans le tableau
    sameNameinArray( playerTwo)
}
  


// cette fonction sert à verifier les stats de son équipe à chaque fois qu'on l'appelle.
func statCharacter(_ player : [Character], range : Int){
    print("\nCHAMPION N°\(range) : \(player[range-1].name)"
        + "\nCLASSE :\(player[range-1].classe)"
        + "\nAttaque 💪 : \(player[range-1].attack)"
        + "\nSoin ✨ : \(player[range-1].heal)"
        + "\nPV ❤️ : \(player[range-1].pv)"
        + "\nARME ⚔️ : \(player[range-1].weapon.rawValue)"
        + "\nSTATUT☠️ : \(player[range-1].statut())" )
}







// on initialise les 3 personnages des 2 joueurs
createCharacterOne()
createCharacterTwo()
// on verifie si les noms sont identiques dans les 2 tableaux
sameNameInTwoArray()


// ici on affiche le nom des champions de chaque joueur

print("\n🗡JOUEUR🏹 1 ")
for i in 1...3
{
    statCharacter(playerOne, range: i)
    playerOne[i-1].choiceClasse()
}

print("\n🗡JOUEUR 2🏹 ")
for i in 1...3
{
    statCharacter(playerTwo, range: i)
    playerTwo[i-1].choiceClasse()
}








// MARK: SYSTEME DE JEU

// creation d'une classe qui va gerer le jeu
class Game{
    
    //la propriété laps est pour savoir qui va jouer
    var laps = true
    var numberOfRound = 0
    var end = false
    
    //la méthode Round elle, va changer laps de true à false à chaque fin de tour.
    //true : joueur 1
    //false : joueur 2
    func Round(){
        if laps == true{
            laps = false
        }
        else{
            laps = true
        }
        numberOfRound += 1
    }

    // la fonction alive, va verifier si un des champions est mort
    func Alive(_ player : [Character]){
        var dead = 0
        for i in player{
            if i.pv <= 0
            {
                //si les pv d'un des chamions, ça variable deadoralive passe sur false, on ne peut plus jouer avec le champion.
                i.deadOrAlive = false
                //la propriété dead = dead +1
                dead += 1
            }
        }
        //si à l'appelle de la méthode alive, dead = 3 alors la partie s'arrête.
        if dead == 3{
            // end va definir la fin du jeu
            end = true
        }
    }
    
}


// cette fonction sert à lister les champions par leur nom avant de choisir une action.
func listName (_ player : [Character]){
    for i in 1...3
    {
        //si les champions sont vivants, on ecrit leurs noms
        if player[i-1].deadOrAlive == true
        {
            print("\(i)- \(player[i-1].name)")
        }
        // si ils sont morts, on ajoute des emojis
        else
        {
            print("🪦💀\(player[i-1].name)💀🪦")
        }
    }
}



// cette fonction va permettre de choisir une action au debut d'un tour: choisir un champion ou voir les stats de nos chamions.
func chooseCharacters(_ player : [Character]){
    // ici on liste nos champions avec la fonction listName()
    listName(player)
    print("4- STAT CHAMPIONS")
    print("5- PASSER LE TOUR")
    // on laisse le choix au joueur de choisir son champion
        if let choice = readLine(){
            if  choice == "1"{
                // avant de selectionner le champion, on verifie qu'il soit toujours vivant
                if player[0].deadOrAlive == true
                {
                    print("\(player[0].name) attend vos ordres")
                    // une fois le choix fait, on appelle la fonction pour choisir l'action attaquer ou soigner
                    chooseAction(player, range: 0)
                }
                // si le champion est mort, on demande de choisir un autre champion et on relance la fonction chooseCharacters
                else {
                    print("\(player[0].name) est mort, veuillez choisir un autre champion\n")
                    chooseCharacters(player)
                }
            }
            else if  choice == "2"{
                // avant de selectionner le champion, on verifie qu'il soit toujours vivant
                if player[1].deadOrAlive == true
                {
                    print("\(player[1].name) attend vos ordres")
                    // une fois le choix fait, on appelle la fonction pour choisir l'action attaquer ou soigner
                    chooseAction(player, range: 1)
                }
                // si le champion est mort, on demande de choisir un autre champion et on relance la fonction chooseCharacters
                else {
                    print("\(player[1].name) est mort, veuillez choisir un autre champion\n")
                    chooseCharacters(player)
                }
            }
            else if  choice == "3"{
                // avant de selectionner le champion, on verifie qu'il soit toujours vivant
                if player[2].deadOrAlive == true
                {
                print("\(player[2].name) attend vos ordres")
                // une fois le choix fait, on appelle la fonction pour choisir l'action attaquer ou soigner
                chooseAction(player, range: 2)
                }
                // si le champion est mort, on demande de choisir un autre champion et on relance la fonction chooseCharacters
                else {
                    print("\(player[2].name) est mort, veuillez choisir un autre champion\n")
                    chooseCharacters(player)
                }
            }
            // si il tape sur 4, il demande les stats de ses champions
            else if choice == "4" {
                for i in 1...3
                {
                    // on appelle alors la fonction pour montrer les stats
                statCharacter(player, range: i)
                }
                // on relance la fonction pour choisir son champion.
                chooseCharacters(player)
            }
            //sur 5, il appelle la méthode pour changer la valeur de laps et donc passer son tour
            else if choice == "5" {
            
            }
            //sinon on rappelle la fonction pour qu'il fasse son choix.
            else {
                print("il faut choisir !")
                chooseCharacters(player)
            }
    }
}


//cette fonction, demande au joueur de choisir entre attaquer ou soigner
func chooseAction(_ player : [Character], range : Int){
    print("\n\(player[range].name)"
        + "\n1- ATTAQUER"
        + "\n2- SOIGNER"
        + "\n3- RETOUR")
    if let choice = readLine(){
        // si le joueur appuie sur 1, il va choisir d'attaquer un champion ennemie
        if choice == "1"{
            // ici on appelle la fonction qui va permettre d'attaquer le champion ennemie
            print("\n\(player[range].name) va attaquer!")
            attaque(player, range: range)
        }
        //si le joueur appuie sur 2, il va choisir de soigner un allié
        else if choice == "2"{
            print("\n\(player[range].name) va soigner")
            // on appelle alors la fonction pour soigner
            heal(player, range: range)
        }
        else if choice == "3"{
            // si il fait 3, on appelle la fonction pour choisir un champion
            chooseCharacters(player)
        }
        else {
            // sinon on relance la fonction pour choisir une action
            print("il faut faire un choix")
            chooseAction(player, range: range)
        }
    }
}




// cette fonction va être la fonction pour soigner un allié
func heal(_ player : [Character],range : Int){
    // ici on liste nos champions avec la fonction listName()
    print("\nQui voulez vous soigner ?")
    listName(player)
    //on demande au joueur de faire un choix quand son choix est fait, les PV du champion choisi vont être augmenté du nombre de heal que le champion possède.
    if let choice = readLine(){
        if choice == "1"{
            // on verifie si le champion est mort ou vivant, si il est mort, on rappelle la fonction pour donner du soin à un autre champion.
            if player[0].deadOrAlive == true
            {
                player[0].pv += player[range].heal
                print("\n\(player[range].name) donne \(player[range].heal) PV à \(player[0].name) ")
            }
            else{
                print("\(player[0].name) est mort, il ne peut plus recevoir de soin\n")
                heal(player, range: range)
            }
        }
        else if choice == "2"{
            if player[1].deadOrAlive == true
            {
                player[1].pv += player[range].heal
                print("\n\(player[range].name) donne \(player[range].heal) PV à \(player[1].name) ")
            }
            else{
                print("\(player[1].name) est mort, il ne peut plus recevoir de soin\n")
                heal(player, range: range)
            }
        }
        else if choice == "3"{
            if player[2].deadOrAlive == true
            {
                player[2].pv += player[range].heal
                print("\n\(player[range].name) donne \(player[range].heal) PV à \(player[2].name) ")
            }
            else{
                print("\(player[2].name) est mort, il ne peut plus recevoir de soin\n")
                heal(player, range: range)
            }
        }
        else {
            // sinon, on redemande au joueur de faire un choix.
            print("il faut faire un choix")
            heal(player, range : range)
        }
    }
}

// on crée la fonction qui va permettre d'attaquer
func attaque(_ player : [Character], range : Int){
    // la variable suffer va permettre de choisir l'équipe qui va subir l'attaque.
    var suffer = [Character]()
    // si le tour == true le joueur 1 est en train de jouer, donc c'est le joueur 2 qui va subir l'attaque
    if game.laps == true {
        suffer = playerTwo
    }
    //si le tour est sur false, c'est le joueur 2 qui est en train de jouer, donc c'est le joueur 1 qui va subir l'attaque
    else {
        suffer = playerOne
    }
    // ici on liste les champions ennemies en appelant suffer
    listName(suffer)
    if let choice = readLine(){
        if choice == "1"{
            if suffer[0].deadOrAlive == true
            {
                suffer[0].pv -= player[range].attack
                print("\n\(player[range].name) enlève \(player[range].attack) PV à \(suffer[0].name) ")
            }
            else {
                print("vous ne pouvez pas attaquer un cadavre !")
                attaque(player, range: range)
            }
        }
        else if choice == "2"{
            if suffer[1].deadOrAlive == true
            {
                suffer[1].pv -= player[range].attack
                print("\n\(player[range].name) enlève \(player[range].attack) PV à \(suffer[1].name) ")
            }
            else{
                print("vous ne pouvez pas attaquer un cadavre !")
                attaque(player, range: range)
            }
        }
        else if choice == "3"{
            if suffer[2].deadOrAlive == true
            {
                suffer[2].pv -= player[range].attack
                print("\n\(player[range].name) enlève \(player[range].attack) PV à \(suffer[2].name) ")
            }
            else{
                print("vous ne pouvez pas attaquer un cadavre !")
                attaque(player, range: range)
            }
        }
        else {
            // sinon, on redemande au joueur de faire un choix.
            print("il faut faire un choix")
            attaque(player, range : range)
        }
    }
    //on verfie avec la méthode game.alive si le champion qu'on vient de subir l'attaquer est encore en vie ou non
    //on verifie également si les 3 champions sont mort ou vivant dans cette même méthode
    game.Alive(suffer)
}





// on crée une instance de la classe game
var game = Game()


// temps que end est sur false, on continue à jouer
while game.end != true{
    
    // dans la boucle, on verifie si la partie est terminée car si la boucle n'est pas fini mais que les champions n'ont pas de pv, ils vont quand même pouvoir attaquer pendant 1 tour
    if game.end == false {
        // on verifie c'est à qui le tour et on lance la fonction pour choisir son joueur
        if game.laps == true{
            print("\n/////JOUEUR 1/////"
                + "\nCHOISIS TON CHAMPION !\n")
            chooseCharacters(playerOne)
            game.Round()
        }
    }
    
    // dans la boucle, on verifie si la partie est terminée car si la boucle n'est pas fini mais que les chamions n'ont pas de pv, ils vont quand même pouvoir attaquer pendant 1 tour
    if game.end == false {
        // on verifie c'est à qui le tour et on lance la fonction pour choisir son joueur
        if game.laps == false{
            print("\n/////JOUEUR 2/////"
                + "\nCHOISIS TON CHAMPION !\n")
            chooseCharacters(playerTwo)
            game.Round()
        }
    }
}

//si le jeu s'arrête et que le tour est sur false c'est que le joueur 1 à gagné
if game.laps == false
{
    print("joueur 1 gagnant")
}
// si le jeu s'arrête et que le tour est sur true c'est que le joueur 2 à gagné
else{
print("joueur 2 gagant")
}
