class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name, :null =>false, :unique => true
      t.string :email
      t.string :password, :null =>false
	  t.boolean :send_emails
      t.timestamps
    end
    admin = Admin.create(:name => :admin, :password => :admin, :email => 'steel5rat@gmail.com')
  end
end
