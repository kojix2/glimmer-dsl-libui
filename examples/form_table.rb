# frozen_string_literal: true

require 'glimmer-dsl-libui'

include Glimmer

data = [
  ['Lisa Sky', 'lisa@sky.com', '720-523-4329', 'Denver', 'CO', '80014'],
  ['Jordan Biggins', 'jordan@biggins.com', '617-528-5399', 'Boston', 'MA', '02101'],
  ['Mary Glass', 'mary@glass.com', '847-589-8788', 'Elk Grove Village', 'IL', '60007'],
  ['Darren McGrath', 'darren@mcgrath.com', '206-539-9283', 'Seattle', 'WA', '98101'],
  ['Melody Hanheimer', 'melody@hanheimer.com', '213-493-8274', 'Los Angeles', 'CA', '90001'],
]

window('Contacts', 550, 550) {
  margined true
  
  vertical_box {
    form {
      stretchy false
      
      @name_entry = entry {
        label 'Name'
      }
      @email_entry = entry {
        label 'Email'
      }
      @phone_entry = entry {
        label 'Phone'
      }
      @city_entry = entry {
        label 'City'
      }
      @state_entry = entry {
        label 'State'
      }
    }
    
    button('Save Contact') {
      stretchy false
      
      on_clicked do
        data << [@name_entry.text, @email_entry.text, @phone_entry.text, @city_entry.text, @state_entry.text]
      end
    }
    
    table {
      text_column('Name')
      text_column('Email')
      text_column('Phone')
      text_column('City')
      text_column('State')

      cell_rows data # implicit data-binding
    }
  }
  
  on_closing do
    puts 'Bye Bye'
  end
}.show
