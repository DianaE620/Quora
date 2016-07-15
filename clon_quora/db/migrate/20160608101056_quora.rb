class Quora < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
    end

    create_table :questions do |t|
      t.belongs_to :user, index:true
      t.string :question
      t.timestamps
    end

    create_table :answers do |t|
      t.belongs_to :user, index:true
      t.belongs_to :question, index:true
      t.string :answer
      t.timestamps
    end

    create_table :answer_votes do |t|
      t.belongs_to :user, index:true
      t.belongs_to :answer
      t.integer :votes, :default => 0
    end

    create_table :question_votes do |t|
      t.belongs_to :user, index:true
      t.belongs_to :question
      t.integer :votes, :default => 0
    end

  end
end
