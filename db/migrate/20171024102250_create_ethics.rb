class CreateEthics < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    create_table :ethics do |t|
      t.string :dork

      t.belongs_to :user, index: true

      t.timestamps
    end

    add_column :ethics, :exercises, :hstore, default: {"dork" => "no", "memory" => "no"}
    add_column :ethics, :answers, :json, default: []
    add_column :ethics, :progress, :integer, default: 0
    add_column :ethics, :finished, :boolean, default: false

  end
end
