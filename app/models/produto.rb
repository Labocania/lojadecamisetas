class Produto < ActiveRecord::Base
	validates :quantidade, presence: true
	validates :nome, presence: true, length: { minimum: 5}
	belongs_to :departamento
end
