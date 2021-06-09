class AddTables < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :taxonomies do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :items do |t|
      t.string :name, null: false
      t.integer :designer_id, null: false
      t.integer :taxonomy_id, null: false
    end

    add_foreign_key :items, :designers
    add_foreign_key :items, :taxonomies

    create_table :designers_taxonomies do |t|
      t.integer :designer_id, null: false
      t.integer :taxonomy_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :designers_taxonomies, :designers
    add_foreign_key :designers_taxonomies, :taxonomies

    create_table :accepted_designers_taxonomies do |t|
      t.integer :designer_id, null: false
      t.integer :taxonomy_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :accepted_designers_taxonomies, :designers
    add_foreign_key :accepted_designers_taxonomies, :taxonomies

    create_table :exception_designers_taxonomies do |t|
      t.integer :designer_id, null: false
      t.integer :taxonomy_id, null: false
      t.timestamps null: false
    end

    add_foreign_key :exception_designers_taxonomies, :designers
    add_foreign_key :exception_designers_taxonomies, :taxonomies
    
  end
end
