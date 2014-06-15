ActiveAdmin.register Provider do
  # index do
  #   column "Category" do |provider|
  #     provider.categories.each do |p|
  #       p.name
  #     end
  #   end
  # end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :address
      row :phone_number
      row :address
      row :email
      row :website
      row :created_at
      row :updated_at
      row :region_id
    end

    panel "Categories" do
      table_for provider.categories do |category|
        column :name
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :region_id, as: :select, collection: Region.all
      f.input :name
      f.input :description
      f.input :address
      f.input :phone_number
      f.input :email
      f.input :website
      f.input :categories, :as => :check_boxes
    end
    f.buttons
  end


end
