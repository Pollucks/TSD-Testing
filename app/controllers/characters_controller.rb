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
        @@strength = self.characterStats
        @@dexterity = self.characterStats
        @@constitution = self.characterStats
        @@intelligence = self.characterStats
        @@wisdom = self.characterStats
        @@charisma = self.characterStats
        self.raceGeneration
        self.classGeneration
        
        @character.race = @@race
        @character.classes = @@classes
        @character.strength = @@strength
        @character.dexterity = @@dexterity
        @character.constitution = @@constitution
        @character.intelligence = @@intelligence
        @character.wisdom = @@wisdom
        @character.charisma = @@charisma
        @character.armorclass = @@armorClass
        @character.gold = @@gold
        
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

public
    def characterStats
        @firstRoll = rand(1..6)
        @secondRoll = rand(1..6)
        @thirdRoll = rand(1..6)
        @fourthRoll = rand(1..6)
        @stats = [@firstRoll, @secondRoll, @thirdRoll, @fourthRoll]
        @stats.sort
        @total = @stats[1] + @stats[2] + @stats[3]
    end
    
    def barbarians                          #0
        @@gold = 0
        @armorType = rand(0..2)
        if @armorType == 0
            @@armorClass = "Light Armor"
        elsif @armorType == 1
            @@armorClass = "Medium Armor"
        end
        
        (0...2).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def bards                               #1
        @@gold = 0
        @@armorClass = "Light Armor"
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def clerics                             #2
        @@gold = 0
        @armorType = rand(0..2)
        if @armorType == 0
            @@armorClass = "Light Armor"
        elsif @armorType == 1
            @@armorClass = "Medium Armor"
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def druids                              #3
        @@gold = 0
        @armorType = rand(0..2)
        if @armorType == 0
            @@armorClass = "Light Armor"
        elsif @armorType == 1
            @@armorClass = "Medium Armor"
        end
        
        (0...2).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def fighters                            #4
        @@gold = 0
        @armorType = rand(0..3)
        if @armorType == 0
            @@armorClass = "Light Armor"
        elsif @armorType == 1
            @@armorClass = "Medium Armor"
        elsif @armorType == 2
            @@armorClass = "Heavy Armor"
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def monks                               #5
        @@gold = 0
        @@armorClass = "No Armor"
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
    end
    
    def paladins                            #6
        @@gold = 0
        @armorType = rand(0..3)
        if @armorType == 0
            @@armorClass = "Light Armor"
        elsif @armorType == 1
            @@armorClass = "Medium Armor"
        elsif @armorType == 2
            @@armorClass = "Heavy Armor"
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def rangers                             #7
        @@gold = 0
        @armorType = rand(0..2)
        if @armorType == 0
            @@armorClass = "Light Armor"
        elsif @armorType == 1
            @@armorClass = "Medium Armor"
        end
        
        (0...5).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def rogues                              #8
        @@gold = 0
        @@armorClass = "Light Armor"
        
        (0...4).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def sorcerers                           #9
        @@gold = 0
        @@armorClass = "No Armor"
        
        (0...3).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def warlocks                            #10
        @@gold = 0
        @@armorClass = "Light Armor"
        
        (0...4).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
    end
    
    def wizards                             #11
        @@gold = 0
        @@armorClass = "No Armor"
        
        @@classes = "Wizard"
        (0...4).each do |i|
            @diceRoll = rand(1..4)
            @@gold = @@gold + @diceRoll
        end
        @@gold = @@gold * 10
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
            self.barbarians
        when 1
            @@classes = "Bard"
            self.bards
        when 2
            @@classes = "Cleric"
            self.clerics
        when 3
            @@classes = "Druid"
            self.druids
        when 4
            @@classes = "Fighter"
            self.fighters
        when 5
            @@classes = "Monk"
            self.monks
        when 6
            @@classes = "Paladin"
            self.paladins
        when 7
            @@classes = "Ranger"
            self.rangers
        when 8
            @@classes = "Rogues"
            self.rogues
        when 9
            @@classes = "Sorcerer"
            self.sorcerers
        when 10
            @@classes = "Warlock"
            self.warlocks
        when 11
            @@classes = "Wizard"
            self.wizards
        end
    end
    
    def raceGeneration
        @pickedRace = rand(0...9)
        case @pickedRace
        when 0
            @@race = "Dwarf"
            self.dwarfs
        when 1
            @@race = "Elf"
            self.elfs
        when 2
            @@race = "Halfling"
            self.halfElfs
        when 3
            @@race = "Human"
            self.humans
        when 4
            @@race = "Dragonborn"
            self.dragonborns
        when 5
            @@race = "Gnomes"
            self.gnomes
        when 6
            @@race = "Half-Elf"
            self.halfElfs
        when 7
            @@race = "Half-Orc"
            self.halfOrcs
        when 8
            @@race = "Tiefling"
            self.tieflings
        end
    end
    
    def character_params
        params.require(:characters).permit(:name, :background, :race, :classes, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :armorclass, :gold)
    end
end