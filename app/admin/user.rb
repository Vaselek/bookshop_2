ActiveAdmin.register User do

 permit_params :name, :surname, :email, :password, :password_confirmation, :admin

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :name, label: "Имя"
      f.input :surname, label: "Фамилия"
      f.input :email
      f.input :password, label: "Пароль"
      f.input :password_confirmation, label: "Повторите пароль"
      f.input :phone
      f.input :admin, as: :boolean
      f.input :type, :label => 'Тип', :as => :select, :collection => [["Родитель", Parent], ["Кейс - менеджер", CaseManager], ["Куратор", Curator], ["Терапевт", Therapist], ["Тим - лидер", TeamLeader]]
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column "Имя", :name
    column :email
    column "Телефон", :phone
    column "Администратор", :admin
    column "Тип", :type
    actions
  end

end