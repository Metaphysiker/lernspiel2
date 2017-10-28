class CreateEthics < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    create_table :ethics do |t|
      t.string :dork

      t.text :order, array: true, default: [
          "introduction",
          "ethicaltheories",
          "kintro",
          "dintro",
          "dork",
          "tintro",
          "memory",
          "whichisright",
          "prok",
          "prod",
          "prot",
          "konk",
          "kond",
          "kont"
      ]

      t.belongs_to :user, index: true

      t.timestamps
    end

    add_column :ethics, :exercises, :hstore, default: {"dork" => "no", "memory" => "no"}
    add_column :ethics, :answers, :hstore, default: {}
    add_column :ethics, :konsanswers, :hstore, default: {}
    add_column :ethics, :deonanswers, :hstore, default: {}
    add_column :ethics, :progress, :integer, default: 0
    add_column :ethics, :finished, :boolean, default: false

  end
end
