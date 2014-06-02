class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.string :title
      t.string :description
      t.string :department
      t.string :email
      t.boolean :done

      t.timestamps
    end
  end
end
