namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    #Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    Rake::Task['db:seed'].invoke

    # Step 1: Create general account
    matt = User.new
    matt.andrew_id = "mjkern"
    matt.password = "secret"
    matt.password_confirmation = "secret"
    matt.role = "general"
    matt.save!

    becca = User.new
    becca.andrew_id = "rkern"
    becca.password = "secret"
    becca.password_confirmation = "secret"
    becca.role = "admin"
    becca.save!

    Leadership.create(user_id: User.last.id, organization_id: 1)
    # admin = User.new
    # admin.andrew_id = "rkern"
    # admin.password = "secret"
    # admin.password_confirmation = "secret"
    # admin.role = "admin"
    # admin.save!

    # Step 2: Create some buildings
    baker = Building.new
    baker.name = "Baker Hall"
    baker.save!

    porter = Building.new
    porter.name = "Porter Hall"
    porter.save!

    wean = Building.new
    wean.name = "Wean Hall"
    wean.save!

    doherty = Building.new
    doherty.name = "Doherty Hall"
    doherty.save!

    #Step 3: Create some rooms
    wean4625 = Room.new
    wean4625.location_address = "4625"
    wean4625.max_capacity = 36
    wean4625.room_type = "classroom"
    wean4625.building_id = 3
    wean4625.save!

    doherty4303 = Room.new
    doherty4303.location_address = "4303"
    doherty4303.max_capacity = 12
    doherty4303.room_type = "classroom"
    doherty4303.building_id = 4
    doherty4303.save!

    classrooms = [['BPH 145C', 20], ["BPH 267", 15], 
    ["BPH 135C", 10], ["BPH 329G", 12], ["BPH 336A", 18], ["BPH 336B", 34], ["BPH 340A", 30],
    ["BPH 342F", 20], ["BPH 446I", 10], ["BPH 223D", 35], ["Baker Hall 154R", 24], ["Baker Hall 154T", 8],
    ["Baker Hall 154R", 24], ["Baker Hall 154T", 8], ["Baker Hall A54", 15], 
    ["Baker Hall Giant Eagle Auditorium A51", 147], ["Baker Hall Steinberg Auditorium A53", 74], 
    ["Baker Hall Adamson Wing 136", 114], ["Baker Hall 154A", 12], ["BPH 135C", 10]] 

    classrooms.each do |c|
        r = Room.new
        if c[0].start_with?("BPH")
            r.building_id = 2
            c[0].slice! "BPH "
            r.location_address = c[0]
        elsif c[0].start_with?("Baker Hall")
            r.building_id = 1
            c[0].slice! "Baker Hall "
            r.location_address = c[0]
        end
        r.max_capacity = c[1]
        r.room_type = "classroom"
        r.save!
    end

    
    s = Event.new
    s.name = "Becca's Event"
    s.number_attending = 15
    s.description = "example text"
    s.room_id = 1
    s.user_id = 3
    s.organization_id = 2
    s.date = Date.current + 5.days
    s.start_time = Time.now
    s.end_time = Time.now + 1.hour
    s.save!
    
    for i in 1..30
        m = Event.new
        m.name = "Sample Event #{i}"
        m.description = "This is an event I am making..."
        m.room_id = Random.rand(21) + 1
        m.number_attending = Random.rand(Room.find(m.room_id).max_capacity) + 1
        m.user_id = Random.rand(9) + 1
        m.organization_id = m.user_id + 1
        m.date = Date.current + (i).days - 15
        m.start_time = Time.new(1,2,1, Random.rand(20), 0, 0, "+00:00")
        m.end_time = m.start_time + (Random.rand(3) + 1).hours
        m.save!
    end

    #["BPH 222C", 26], , 
    #,     ["BPH 246A", 22]["BPH A-60N", 18], ["BPH 150", 22]]
    # t.string "location_address"
    # t.integer "max_capacity"
    # t.string "type"
    # t.integer "building_id"

    # for room in classrooms







  end
end
