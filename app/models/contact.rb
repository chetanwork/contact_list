class Contact < ActiveRecord::Base

	def self.search(num, char)
		if num.empty?
			return	nil
		else
			where('number LIKE ?', "%#{num}%")
	    end
	end
end
