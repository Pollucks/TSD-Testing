class AddNewColumnToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :hitpoints, :integer
    add_column :characters, :strengthmodifier, :integer
    add_column :characters, :dexteritymodifier, :integer
    add_column :characters, :constitutionmodifier, :integer
    add_column :characters, :intelligencemodifier, :integer
    add_column :characters, :wisdommodifier, :integer
    add_column :characters, :charismamodifier, :integer
    add_column :characters, :armorequipment, :string
    add_column :characters, :weaponequipment, :string
  end
end
