class CharactersController < ApplicationController
    @@race = "temp"
    @@classes = "temp"
    @@strength = 0           #0
    @@dexterity = 0          #1
    @@constitution = 0       #2
    @@intelligence = 0       #3
    @@wisdom = 0             #4
    @@charisma = 0           #5
    @@armorclass = "temp"
    @@gold = 0
    @@hitpoints = 0
    @@strengthmodifier = 0           #0
    @@dexteritymodifier = 0          #1
    @@constitutionmodifier = 0       #2
    @@intelligencemodifier = 0       #3
    @@wisdommodifier = 0             #4
    @@charismamodifier = 0           #5
    @@armorequipment = "temp"
    @@weaponequipment = "temp"
    
    def index
        @characters = Character.all
    end
    
    def show
        @character = Character.find(params[:id])
    end
    
    def new
        @character = Character.new
    end
    
    def create
        @character = Character.new(character_params)
        @@armorclass = "God Armor"
        @@strength = characterStats
        @@dexterity = characterStats
        @@constitution = characterStats
        @@intelligence = characterStats
        @@wisdom = characterStats
        @@charisma = characterStats
        raceGeneration
        @@strengthmodifier = characterModifier(@@strength)
        @@dexteritymodifier = characterModifier(@@dexterity)
        @@constitutionmodifier = characterModifier(@@constitution)
        @@intelligencemodifier = characterModifier(@@intelligence)
        @@wisdommodifier = characterModifier(@@wisdom)
        @@charismamodifier = characterModifier(@@charisma)
        classGeneration
        
        @character.race = @@race
        @character.classes = @@classes
        @character.strength = @@strength
        @character.dexterity = @@dexterity
        @character.constitution = @@constitution
        @character.intelligence = @@intelligence
        @character.wisdom = @@wisdom
        @character.charisma = @@charisma
        @character.armorclass = @@armorclass
        @character.gold = @@gold
        @character.hitpoints = @@hitpoints
        @character.strengthmodifier = @@strengthmodifier
        @character.dexteritymodifier = @@dexteritymodifier
        @character.constitutionmodifier = @@constitutionmodifier
        @character.intelligencemodifier = @@intelligencemodifier
        @character.wisdommodifier = @@wisdommodifier
        @character.charismamodifier = @@charismamodifier
        @character.armorequipment = @@armorequipment
        @character.weaponequipment = @@weaponequipment
        
        if @character.save
            redirect_to @character
        else
            render 'new'
        end
    end
  
    def edit
        @character = Character.find(params[:id])
    end
  
    def update
        @character = Character.find(params[:id])
    
        if @character.update(character_params)
            redirect_to @character
        else
            render 'edit'
        end
    end
  
    def destroy
        @character = Character.find(params[:id])
        @character.destroy

        redirect_to characters_path
    end

private
    def characterStats
        @firstRoll = rand(1..6)
        @secondRoll = rand(1..6)
        @thirdRoll = rand(1..6)
        @fourthRoll = rand(1..6)
        @stats = [@firstRoll, @secondRoll, @thirdRoll, @fourthRoll]
        @stats.sort
        @total = @stats[1] + @stats[2] + @stats[3]
    end
    
    def characterModifier(stat)
        if(stat == 1)
            @modifier = -5
        elsif stat == 2 || stat == 3
            @modifier = -4
        elsif stat == 4 || stat == 5
            @modifier = -3
        elsif stat == 6 || stat == 7
            @modifier = -2
        elsif stat == 8 || stat == 9
            @modifier = -1
        elsif stat == 10 || stat == 11
            @modifier = 0
        elsif stat == 12 || stat == 13
            @modifier = 1
        elsif stat == 14 || stat == 15
            @modifier = 2
        elsif stat == 16 || stat == 17
            @modifier = 3
        elsif stat == 18 || stat == 19
            @modifier = 4
        elsif stat == 20 || stat == 21
            @modifier = 5
        elsif stat == 22 || stat == 23
            @modifier = 6
        elsif stat == 24 || stat == 25
            @modifier = 7
        elsif stat == 26 || stat == 27
            @modifier = 8
        elsif stat == 28 || stat == 29
            @modifier = 9
        elsif stat > 29
            @modifier = 10
        end
    end
    
    def lightArmor
        equitmentPiece = rand(0...3)
        lightarmor = ["Padded Armor", "Leather Armor", "Studded Leather Armor"]
        returnValue = lightarmor[equitmentPiece]
        returnValue
    end
    
    def mediumArmor
        equitmentPiece = rand(0...5)
        mediumarmor = ["Hide Armor", "Chain Shirt", "Scale Mail", "Breastplate", "Half Plate"]
        returnValue = mediumarmor[equitmentPiece]
        returnValue
    end
    
    def heavyArmor
        equitmentPiece = rand(0...4)
        heavyarmor = ["Ring Mail", "Chain Mail", "Splint", "Plate"]
        returnValue = heavyarmor[equitmentPiece]
        returnValue
    end
    
    def simpleMelee
        weaponPiece = rand(0...11)
        simplemelee = ["Club", "Dagger", "Greatclub", "Handaxe", "Javelin", "Light Hammer", "Mace", "Quarterstaff", "Sickle", "Spear", "Unarmed"]
        returnValue = simplemelee[weaponPiece]
        returnValue
    end
    
    def simpleRange
        weaponPiece = rand(0...4)
        simplerange = ["Light Crossbow", "Darts", "Shortbow", "Sling"]
        returnValue = simplerange[weaponPiece]
        returnValue
    end
    
    def martialMelee
        weaponPiece = rand(0...18)
        martialmelee = ["Battleaxe", "Flail", "Glaive", "Greataxe", "Greatsword", "Halberd", "Lance", "Longsword", "Maul", "Morningstar", "Pike", "Rapier", "Scimitar", "Shortsword", "Trident", "War Pick", "Warhammer", "Whip"]
        returnValue = martialmelee[weaponPiece]
        returnValue
    end
    
    def martialRange
        weaponPiece = rand(0...5)
        martialrange = ["Blowgun", "Hand Crossbow", "Heavy Crossbow", "Longbow", "Net"]
        returnValue = martialrange[weaponPiece]
        returnValue
    end
    
    def barbarians                          #0
        @@gold = 0
        @armorType = rand(0...2)
        if @armorType == 0
            @@armorclass = "Light Armor"
            @@armorequipment = lightArmor
        elsif @armorType == 1
            @@armorclass = "Medium Armor"
            @@armorequipment = mediumArmor
        end
        
        @weaponType = rand(0...4)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        elsif @weaponType == 3
            @@weaponequipment = martialRange
        end
        
        (0...2).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..12)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def bards                               #1
        @@gold = 0
        @@armorclass = "Light Armor"
        @@armorequipment = lightArmor
        
        @weaponType = rand(0...4)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        elsif @weaponType == 3
            @@weaponequipment = martialRange
        end
            
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..8)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def clerics                             #2
        @@gold = 0
        @armorType = rand(0...2)
        if @armorType == 0
            @@armorclass = "Light Armor"
            @@armorequipment = lightArmor
        elsif @armorType == 1
            @@armorclass = "Medium Armor"
            @@armorequipment = mediumArmor
        end
        
        @weaponType = rand(0...2)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = simpleRange
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..8)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def druids                              #3
        @@gold = 0
        @armorType = rand(0...2)
        if @armorType == 0
            @@armorclass = "Light Armor"
            @@armorequipment = lightArmor
        elsif @armorType == 1
            @@armorclass = "Medium Armor"
            @@armorequipment = mediumArmor
        end
        
        @weaponType = rand(0...3)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        end
        
        (0...2).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..8)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def fighters                            #4
        @@gold = 0
        @armorType = rand(0...3)
        if @armorType == 0
            @@armorclass = "Light Armor"
            @@armorequipment = lightArmor
        elsif @armorType == 1
            @@armorclass = "Medium Armor"
            @@armorequipment = mediumArmor
        elsif @armorType == 2
            @@armorclass = "Heavy Armor"
            @@armorequipment = heavyArmor
        end
        
        @weaponType = rand(0...4)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        elsif @weaponType == 3
            @@weaponequipment = martialRange
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..10)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def monks                               #5
        @@gold = 0
        @@armorclass = "No Armor"
        @@armorequipment = "No Armor"
        
        @weaponType = rand(0...3)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        end
            
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        
        dieRoll = rand(1..8)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def paladins                            #6
        @@gold = 0
        @armorType = rand(0...3)
        if @armorType == 0
            @@armorclass = "Light Armor"
            @@armorequipment = lightArmor
        elsif @armorType == 1
            @@armorclass = "Medium Armor"
            @@armorequipment = mediumArmor
        elsif @armorType == 2
            @@armorclass = "Heavy Armor"
            @@armorequipment = heavyArmor
        end
        
        @weaponType = rand(0...4)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        elsif @weaponType == 3
            @@weaponequipment = martialRange
        end
            
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..10)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def rangers                             #7
        @@gold = 0
        @armorType = rand(0...2)
        if @armorType == 0
            @@armorclass = "Light Armor"
            @@armorequipment = lightArmor
        elsif @armorType == 1
            @@armorclass = "Medium Armor"
            @@armorequipment = mediumArmor
        end
        
        @weaponType = rand(0...4)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        elsif @weaponType == 3
            @@weaponequipment = martialRange
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..10)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def rogues                              #8
        @@gold = 0
        @@armorclass = "Light Armor"
        @@armorequipment = lightArmor
        
        @weaponType = rand(0...4)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = martialMelee
        elsif @weaponType == 2
            @@weaponequipment = simpleRange
        elsif @weaponType == 3
            @@weaponequipment = martialRange
        end
        
        (0...4).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..8)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def sorcerers                           #9
        @@gold = 0
        @@armorclass = "No Armor"
        @@armorequipment = "No Armor"
        
        @weaponType = rand(0...2)
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = simpleRange
        end
        
        (0...3).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..6)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def warlocks                            #10
        @@gold = 0
        @@armorclass = "Light Armor"
        @@armorequipment = lightArmor
        
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = simpleRange
        end
        
        (0...4).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..8)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def wizards                             #11
        @@gold = 0
        @@armorclass = "No Armor"
        @@armorequipment = "No Armor"
        
        if @weaponType == 0
            @@weaponequipment = simpleMelee
        elsif @weaponType == 1
            @@weaponequipment = simpleRange
        end
        
        @@classes = "Wizard"
        (0...4).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
        
        dieRoll = rand(1..6)
        @@hitpoints = 1 * dieRoll
        @@hitpoints = @@hitpoints + @@constitutionmodifier
    end
    
    def dwarfs                                          #0
        @@constitution = @@constitution + 2
    end
    
    def elfs                                            #1
        @@dexterity = @@dexterity + 2
    end
    
    def halflings                                       #2
        @@dexterity = @@dexterity + 2
    end
    
    def humans                                          #3
        @@strength = @@strength + 1
        @@dexterity = @@dexterity + 1
        @@constitution = @@constitution + 1
        @@intelligence = @@intelligence + 1
        @@wisdom = @@wisdom + 1
        @@charisma = @@charisma + 1
    end

    def dragonborns                                     #4
        @@strength = @@strength + 2
        @@charisma = @@charisma + 1
    end
    
    def gnomes                                          #5
        @@intelligence = @@intelligence + 2
    end
    
    def halfElfs                                        #6
        @@charisma = @@charisma + 2
        @bonusStat1 = rand(0...6)
        @bonusStat2 = rand(0...6)
        case @bonusStat1
        when 0
            @@strength = @@strength + 1
        when 1
            @@dexterity = @@dexterity + 1
        when 2
            @@constitution = @@constitution + 1
        when 3
            @@intelligence = @@intelligence + 1
        when 4
            @@wisdom = @@wisdom + 1
        when 5
            @@charisma = @@charisma + 1
        end
        
        case @bonusStat2
        when 0
            @@strength = @@strength + 1
        when 1
            @@dexterity = @@dexterity + 1
        when 2
            @@constitution = @@constitution + 1
        when 3
            @@intelligence = @@intelligence + 1
        when 4
            @@wisdom = @@wisdom + 1
        when 5
            @@charisma = @@charisma + 1
        end
    end
    
    def halfOrcs                                        #7
        @@strength = @@strength + 2
        @@constitution = @@constitution + 1
    end
    
    def tieflings                                       #8
        @@charisma = @@charisma + 2
        @@intelligence = @@intelligence + 1
    end
    
    def classGeneration
        @pickedClass = rand(0...12)
        case @pickedClass
        when 0
            @@classes = "Barbarian"
            barbarians
        when 1
            @@classes = "Bard"
            bards
        when 2
            @@classes = "Cleric"
            clerics
        when 3
            @@classes = "Druid"
            druids
        when 4
            @@classes = "Fighter"
            fighters
        when 5
            @@classes = "Monk"
            monks
        when 6
            @@classes = "Paladin"
            paladins
        when 7
            @@classes = "Ranger"
            rangers
        when 8
            @@classes = "Rogues"
            rogues
        when 9
            @@classes = "Sorcerer"
            sorcerers
        when 10
            @@classes = "Warlock"
            warlocks
        when 11
            @@classes = "Wizard"
            wizards
        end
    end
    
    def raceGeneration
        @pickedRace = rand(0...9)
        case @pickedRace
        when 0
            @@race = "Dwarf"
            dwarfs
        when 1
            @@race = "Elf"
            elfs
        when 2
            @@race = "Halfling"
            halfElfs
        when 3
            @@race = "Human"
            humans
        when 4
            @@race = "Dragonborn"
            dragonborns
        when 5
            @@race = "Gnome"
            gnomes
        when 6
            @@race = "Half-Elf"
            halfElfs
        when 7
            @@race = "Half-Orc"
            halfOrcs
        when 8
            @@race = "Tiefling"
            tieflings
        end
    end
    
    def character_params
        params.require(:characters).permit(:name, :background, :race, :classes, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :armorclass, :gold, :hitpoints, :strengthmodifier, :dexteritymodifier, :constitutionmodifier, :intelligencemodifier, :wisdommodifier, :charismamodifier, :armorequipment, :weaponequipment)
    end
end