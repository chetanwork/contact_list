class ContactsController < ApplicationController
    layout 'keyboard'

	def index
	end

	def check_number
		received = params[:pressedNum]
		combination_string = create_cobination(received)
		@refine_contact = Contact.search(received, combination_string)
		respond_to do |format|
      		format.json { 
        		render json: @refine_contact.map(&:number)
      		}
    	end
	end

	private

	def create_cobination(received)
		charcter = Array.new 
		charcter << "a" << "b" << "c"  if received.include? "2"
		charcter << "d" << "e" << "f"  if received.include? "3"
		charcter << "g" << "h" << "i"  if received.include? "4"
		charcter << "j" << "k" << "l"  if received.include? "5"
		charcter << "m" << "n" << "o"  if received.include? "6"
		charcter << "p" << "q" << "r" << "s"  if received.include? "7"
		charcter << "t" << "u" << "v"  if received.include? "8"
		charcter << "w" << "x" << "y" << "z"  if received.include? "9"
		puts "------------------------------------------"
		p charcter
		puts "------------------------------------------"
		combination_string = (1..charcter.length).flat_map{|n| (charcter).to_a.combination(n).map(&:join)}
		return combination_string
	end
end