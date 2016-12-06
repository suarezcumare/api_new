ActiveAdmin.register User do
  controller do
    skip_before_filter :authenticate_user!
  end

  permit_params :first_name, :last_name, :email, :password, :encrypted_password, :reset_password_sent_at, :reset_password_code

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
    	f.input :first_name
    	f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end