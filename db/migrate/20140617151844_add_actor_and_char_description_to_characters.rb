class AddActorAndCharDescriptionToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :actor_name, :string
    add_column :characters, :description, :string
  end
end
