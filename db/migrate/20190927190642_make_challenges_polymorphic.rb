class MakeChallengesPolymorphic < ActiveRecord::Migration[5.1]
  class Challenge < ApplicationRecord 
    belongs_to :content, polymorphic: true
  end

  class TextChallenge < ApplicationRecord; end
    def change
      change_table(:challenges) do |t|
        t.string :content_type
        t.integer :content_id
        t.index [:content_type, :content_id]
    end

  reversible do |dir|
    Challenge.reset_column_information
    Challenge.find_each do |challenge|
      dir.up do
        text_challenge= TextChallenge.create(body: challenge.body)
        challenge.update(content_id: text_challenge.id, content_type: "TextChallenge" )
      end
      dir.down do
        challenge.update(body: challenge.content.body)
        challenge.content.destroy
      end
    end
  end

    remove_column :challenges, :body,  :string

end
end