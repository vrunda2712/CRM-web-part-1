gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :note, as: :text


    def full_name
      "#{first_name} #{last_name}"
    end

  end

  Contact.auto_upgrade!
  
  # @@contacts = []
  # @@id = 1

  # attr_reader :id
  # attr_accessor :first_name, :last_name, :email, :note

  # This method should initialize the contact's attributes
  # def initialize(first_name, last_name, email, note)
    # @id = @@id
    # @@id += 1
    #
    # @first_name = first_name
    # @last_name = last_name
    # @email = email
    # @noe = note
  # end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  # def self.create(first_name, last_name, email, note)
  #   new_contact = Contact.new(first_name, last_name, email, note)
  #   @@contacts << new_contact
  #   return new_contact
  # end

  # This method should return all of the existing contacts
  # def self.all
  #   @@contacts
  # end

  # This method should accept an id as an argument
  # and return the contact who has that id
  # def self.find(id)
  #   @@contacts.each do |contact|
  #     if id == contact.id
  #       return contact
  #     end
  #   end
  # end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  # def update(value, new_value)
  #   if value == "first_name"
  #     self.first_name = new_value
  #   elsif value == "last_name"
  #     self.last_name = new_value
  #   elsif value == "email"
  #     self.email = new_value
  #   elsif value == "note"
  #     self.note = new_value
  #   end
  # end
  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  # def self.find_by(value, search)
  #   if value == "first_name"
  #     @@contacts.each do |contact|
  #       if search == contact.first_name
  #         return contact
  #       end
  #     end
  #   elsif value == "last_name"
  #     @@contacts.each do |contact|
  #       if search == contact.last_name
  #         return contact
  #       end
  #     end
  #   elsif value == "email"
  #     @@contacts.each do |contact|
  #       if search == contact.email
  #         return contact
  #       end
  #     end
  #   elsif value == "note"
  #     @@contacts.each do |contact|
  #       if search == contact.note
  #         return contact
  #       end
  #     end
  #   end
  # end

  # This method should delete all of the contacts
  # def self.delete_all
  #   @@contacts.clear
  # end


  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  # def delete
  #   @@contacts.delete(self)
  # end

  # Feel free to add other methods here, if you need them.



# contact1 = Contact.create('Vrunda','Patel','vrunda2712@gmail.com','Loves dog')
# contact2 = Contact.create('Nish','Patel','nish8@gmail.com','Meeting on 05-29')

# puts contact1.first_name
# puts contact1.last_name
# puts contact1.email
# puts contact1.note
# puts
# puts contact2.first_name
# puts contact2.last_name
# puts contact2.email
# puts contact2.note
# puts
# puts contact1.full_name
# puts contact2.full_name
# puts
# puts "All Contacts: "
# puts Contact.all.inspect
# puts
# puts "Update Contact1: "
# puts contact1.update("first_name","Nivi").inspect
# puts
# puts "All Contacts after updateing Contact1: "
# puts Contact.all.inspect
# puts
# puts "Find Contact: "
# puts Contact.find_by("first_name","Nish").inspect
# puts Contact.find_by("last_name", "Patel").inspect
# puts Contact.find_by("email", "vrunda2712@gmail.com").inspect
# puts Contact.find_by("note", "Meeting on 05-29").inspect
# puts
# puts "Delete Contact: "
# puts contact1.delete.inspect
# puts
# puts "All Contacts after deleting Contact1: "
# puts Contact.all.inspect
