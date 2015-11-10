class TodoAssignment < ActiveRecord::Base
	belongs_to :assignable, polymorphic: true
	belongs_to :todo
end
