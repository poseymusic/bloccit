class CreateRatelings < ActiveRecord::Migration
   def change
     create_table :ratelings do |t|
       t.integer :rating_id
       t.integer :topic_id
       t.references :rating, index: true
       t.references :topic, index: true
       t.references :post, index: true
       t.references :rateable, polymorphic: true, index: true
       t.timestamps null: false
     end
     add_foreign_key :ratelings, :ratings
     add_foreign_key :ratelings, :topics
     add_foreign_key :ratelings, :posts
   end
 end
