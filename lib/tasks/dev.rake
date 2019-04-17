namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
  #    show_spinner("Apagando BD...") { %x(rails db:drop) }
   #   show_spinner("Criando BD...") { %x(rails db:create) }
   #   show_spinner("Migrando BD...") { %x(rails db:migrate) }
    #  show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
  #    show_spinner("Cadastrando administradores extras...") { %x(rails dev:add_extra_admins) }
   #    show_spinner("Cadastrando Assuntos...") { %x(rails dev:add_extra_subjects) }
       show_spinner("Cadastrando perguntas e respostas...") { %x(rails dev:add_answers_and_questions) }
     # show_spinner("Cadastrando o usuário padrão...") { %x(rails dev:add_default_user) }
    #  show_spinner("Cadastrando usuário extras...") { %x(rails dev:add_extra_users) }
      
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

###################ADICIONA ASSUNTOS#################

desc "Adiciona assuntos extras"
task add_extra_subjects: :environment do
  10.times do |i|
     Subject.create!(
      description: Faker::DcComics.hero
    )
  end
end

####################Perguntas e Respostas Questions############################
  desc "Adiciona perguntas e respostas"
      task add_answers_and_questions: :environment do
      Subject.all.each do |subject|
          rand(5..10).times do |i|
          Question.create!(
          question:   "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          response:      Faker::Lorem.paragraph,
          date_question: Faker::Date.forward(23),
          date_response: Faker::Date.forward(30),
          subject: subject
      )
      end
    end
  end
end


  ###################ADICIONA ADMINISTRADORER#################
  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      name_admin: 'ERNANI',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD,
        name_admin: Faker::Name.name,  
        last_name_admin: Faker::Name.last_name, 
        street_admin: Faker::Address.street_name,
        city_admin: Faker::Address.city,
        zip_code_admin: Faker::Address.zip_code

      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user1@user1.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona usuários extras"
  task add_extra_users: :environment do
    10.times do |i|
      User.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end


end