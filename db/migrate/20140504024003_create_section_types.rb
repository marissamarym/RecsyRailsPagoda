class CreateSectionTypes < ActiveRecord::Migration
  def change
    create_table :section_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
