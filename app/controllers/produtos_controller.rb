class ProdutosController < ApplicationController
	before_action :set_produto, only: [:edit, :update, :destroy]
	def index
		@produtos_por_nome = Produto.order(:nome).limit 6
		@produtos_por_preco = Produto.order(:preco).limit 6
	end

	def new
		@produto = Produto.new
		@departamento = Departamento.all
	end

	def create
		valores = produto_params
		@produto = Produto.create valores
		if @produto.save
			flash[:notice] = "Produto salvo com sucesso"
			redirect_to root_url
		else
			render :new
		end
	end

	def destroy
		id = params[:id]
		Produto.destroy id 
		redirect_to root_url
	end

	def busca
		@nome_a_buscar = "%#{params[:nome]}%"
		@produtos = Produto.where "nome like ?", "#{@nome_a_buscar}"
	end

	def edit
		set_produto
		@departamento = Departamento.all
	end

	def update
		set_produto
		valores = produto_params
		if @produto.update valores
			flash[:notice] = "Produto atualizado"
			redirect_to root_url
		else
			renderiza_new
		end
	end

	private
		def renderiza_new
			@departamento = Departamento.all
			render :new
		end

		def set_produto
			id = params[:id]
			@produto = Produto.find(id)
		end

		def produto_params
			params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
		end
end
